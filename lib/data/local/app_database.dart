import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:flashcards_learning_app/entities/topic.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/data/local/topic_summary.dart';

part 'app_database.g.dart';

@DataClassName('TopicEntry')
class Topics extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get colorValue => integer().nullable()();
}

@DataClassName('WordEntry')
class Words extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get topicId => integer().nullable().references(Topics, #id)();
  TextColumn get word => text()();
  TextColumn get translation => text()();
  BoolColumn get learned => boolean().withDefault(const Constant(false))();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'flashcards.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [Topics, Words])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> createTopic(Topic topic) async {
    return into(topics).insert(
      TopicsCompanion.insert(
        name: topic.topicName,
        colorValue: Value(topic.colorValue),
      ),
    );
  }

  Stream<List<TopicSummary>> watchTopicSummaries() {
    final query = customSelect(
      '''
      SELECT
        t.id as id,
        t.name as name,
        t.color_value as colorValue,
        COUNT(w.id) as totalWords,
        SUM(CASE WHEN w.learned = 1 THEN 1 ELSE 0 END) as learnedWords
      FROM topics t
      LEFT JOIN words w ON w.topic_id = t.id
      GROUP BY t.id
      ORDER BY t.id DESC
      ''',
      readsFrom: {topics, words},
    );

    return query.watch().map(
      (rows) => rows.map((row) {
        return TopicSummary(
          id: row.read<int>('id'),
          topicName: row.read<String>('name'),
          colorValue: row.read<int?>('colorValue'),
          totalWords: row.read<int>('totalWords'),
          learnedWords: row.read<int?>('learnedWords') ?? 0,
        );
      }).toList(),
    );
  }

  Future<int> createTopicIfMissing(String topicName) async {
    final existing = await (select(
      topics,
    )..where((tbl) => tbl.name.equals(topicName))).getSingleOrNull();
    if (existing != null) {
      return existing.id;
    }
    return into(topics).insert(TopicsCompanion.insert(name: topicName));
  }

  Future<void> insertWords(int topicId, List<Word> wordList) async {
    if (wordList.isEmpty) return;
    final entries = wordList
        .map(
          (w) => WordsCompanion.insert(
            topicId: Value(topicId),
            word: w.word,
            translation: w.translation,
            learned: Value(w.learned),
          ),
        )
        .toList();
    await batch((b) => b.insertAll(words, entries));
  }

  Future<int> createTopicWithWords({
    required Topic topic,
    required List<Word> words,
  }) async {
    return transaction(() async {
      final topicId = await createTopic(topic);
      await insertWords(topicId, words);
      return topicId;
    });
  }

  Future<void> insertImportedWords(List<Word> words) async {
    if (words.isEmpty) return;
    await transaction(() async {
      for (final group in _groupByTopicName(words).entries) {
        final topicId = await createTopicIfMissing(group.key);
        await insertWords(topicId, group.value);
      }
    });
  }

  Map<String, List<Word>> _groupByTopicName(List<Word> words) {
    final map = <String, List<Word>>{};
    for (final word in words) {
      final topicName = (word.topic ?? '').trim();
      final key = topicName.isEmpty ? 'Untitled' : topicName;
      map.putIfAbsent(key, () => []).add(word);
    }
    return map;
  }

  Future<String?> getTopicName(int topicId) async {
    final topic = await (select(
      topics,
    )..where((tbl) => tbl.id.equals(topicId))).getSingleOrNull();
    return topic?.name;
  }

  Future<Word?> getWordById(int wordId) async {
    final query = customSelect(
      '''
      SELECT
        w.id as id,
        w.topic_id as topicId,
        w.word as word,
        w.translation as translation,
        w.learned as learned,
        t.name as topicName
      FROM words w
      LEFT JOIN topics t ON t.id = w.topic_id
      WHERE w.id = ?
      LIMIT 1
      ''',
      variables: [Variable.withInt(wordId)],
      readsFrom: {words, topics},
    );
    final row = await query.getSingleOrNull();
    if (row == null) return null;
    return Word(
      id: row.read<int>('id'),
      topicId: row.read<int?>('topicId'),
      word: row.read<String>('word'),
      translation: row.read<String>('translation'),
      learned: row.read<int>('learned') == 1,
      topic: row.read<String?>('topicName'),
    );
  }

  Future<List<Word>> getWordsForTopic(int topicId) async {
    final rows = await (select(
      words,
    )..where((tbl) => tbl.topicId.equals(topicId))).get();
    return rows
        .map(
          (row) => Word(
            id: row.id,
            topicId: row.topicId,
            word: row.word,
            translation: row.translation,
            learned: row.learned,
          ),
        )
        .toList();
  }

  Future<List<Word>> getAllWordsWithTopicName() async {
    final query = customSelect(
      '''
      SELECT
        w.id as id,
        w.topic_id as topicId,
        w.word as word,
        w.translation as translation,
        w.learned as learned,
        t.name as topicName
      FROM words w
      LEFT JOIN topics t ON t.id = w.topic_id
      ORDER BY w.id DESC
      ''',
      readsFrom: {words, topics},
    );
    final rows = await query.get();
    return rows
        .map(
          (row) => Word(
            id: row.read<int>('id'),
            topicId: row.read<int?>('topicId'),
            word: row.read<String>('word'),
            translation: row.read<String>('translation'),
            learned: row.read<int>('learned') == 1,
            topic: row.read<String?>('topicName'),
          ),
        )
        .toList();
  }

  Future<int> deleteWordById(int id) async {
    return (delete(words)..where((word) => word.id.equals(id))).go();
  }
}

final AppDatabase appDatabase = AppDatabase();
