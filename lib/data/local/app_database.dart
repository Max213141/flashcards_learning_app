import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flashcards_learning_app/utils/utils.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:flashcards_learning_app/entities/topic.dart';
import 'package:flashcards_learning_app/entities/user_goals.dart' as entity;
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/data/local/topic_summary.dart';

part 'app_database.g.dart';

// ignore: unused_element
void _log(dynamic message) =>
    Logger.projectLog(message, name: 'UniversePayApp');

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
  TextColumn get topicName => text()();
  TextColumn get transcription => text().nullable()();
  TextColumn get partOfSpeech => text().nullable()();
  TextColumn get usage => text().nullable()();
  BoolColumn get learned => boolean().withDefault(const Constant(false))();
  DateTimeColumn get learnedAt => dateTime().nullable()();
}

@DataClassName('UserGoalsEntry')
class UserGoalsTable extends Table {
  IntColumn get id => integer()();
  IntColumn get overallGoal => integer()();
  IntColumn get dailyGoal => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'flashcards.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [Topics, Words, UserGoalsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // @override
  // MigrationStrategy get migration => MigrationStrategy(
  //   onUpgrade: (m, from, to) async {
  //     if (from < 2) {
  //       await m.addColumn(words, words.transcription);
  //       await m.addColumn(words, words.partOfSpeech);
  //       await m.addColumn(words, words.usage);
  //     }
  //     if (from < 3) {
  //       await m.addColumn(words, words.learnedAt);
  //     }
  //   },
  // );

  Future<int> createTopic(Topic topic) async {
    return into(topics).insert(
      TopicsCompanion.insert(
        name: topic.topicName,
        colorValue: Value(topic.colorValue),
      ),
    );
  }

  Stream<List<TopicSummary>> watchTopicSummaries({
    TopicSortOption sortOption = TopicSortOption.createdDesc,
  }) {
    final orderBy = _topicSummaryOrderBy(sortOption);
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
      ORDER BY $orderBy
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

  String _topicSummaryOrderBy(TopicSortOption option) {
    switch (option) {
      case TopicSortOption.titleAsc:
        return 't.name COLLATE NOCASE ASC, t.id DESC';
      case TopicSortOption.colorAsc:
        return '''
        CASE WHEN t.color_value IS NULL THEN 1 ELSE 0 END,
        t.color_value ASC,
        t.name COLLATE NOCASE ASC,
        t.id DESC
        ''';
      case TopicSortOption.createdDesc:
        return 't.id DESC';
    }
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

  Future<void> insertWords({
    required int topicId,
    required String topicName,
    required List<Word> wordList,
  }) async {
    if (wordList.isEmpty) return;
    final entries = wordList
        .map(
          (w) => WordsCompanion.insert(
            topicId: Value(topicId),
            word: w.word.trim(),
            topicName: topicName.trim(),
            translation: w.translation.trim(),
            transcription: Value(_normalizeNullableText(w.transcription)),
            partOfSpeech: Value(_normalizeNullableText(w.partOfSpeech)),
            usage: Value(_normalizeNullableText(w.usage)),
            learned: Value(w.learned),
            learnedAt: Value(w.learnedAt),
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
      await insertWords(
        topicId: topicId,
        topicName: topic.topicName,
        wordList: words,
      );
      return topicId;
    });
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
        w.learned_at as learnedAt,
        w.topic_name as topicName,
        w.transcription as transcription,
        w.part_of_speech as partOfSpeech,
        w.usage as usage
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
      learnedAt: row.read<DateTime?>('learnedAt'),
      topic: row.read<String?>('topicName'),
      transcription: row.read<String?>('transcription'),
      partOfSpeech: row.read<String?>('partOfSpeech'),
      usage: row.read<String?>('usage'),
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
            topic: row.topicName,
            translation: row.translation,
            transcription: row.transcription,
            partOfSpeech: row.partOfSpeech,
            usage: row.usage,
            learned: row.learned,
            learnedAt: row.learnedAt,
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
        w.learned_at as learnedAt,
        COALESCE(NULLIF(TRIM(w.topic_name), ''), t.name) as topicName,
        w.transcription as transcription,
        w.part_of_speech as partOfSpeech,
        w.usage as usage
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
            learnedAt: row.read<DateTime?>('learnedAt'),
            topic: _normalizeNullableText(row.read<String?>('topicName')),
            transcription: _normalizeNullableText(
              row.read<String?>('transcription'),
            ),
            partOfSpeech: _normalizeNullableText(
              row.read<String?>('partOfSpeech'),
            ),
            usage: _normalizeNullableText(row.read<String?>('usage')),
          ),
        )
        .toList();
  }

  Future<int> deleteWordById(int id) async {
    return (delete(words)..where((word) => word.id.equals(id))).go();
  }

  Future<bool> addWord(Word newWord) async {
    final topicId = newWord.topicId;
    if (topicId == null) return false;
    final resolvedTopicName = (newWord.topic ?? '').trim().isNotEmpty
        ? newWord.topic!.trim()
        : (await getTopicName(topicId) ?? '');
    final insertedId = await into(words).insert(
      WordsCompanion.insert(
        topicId: Value(topicId),
        word: newWord.word.trim(),
        translation: newWord.translation.trim(),
        topicName: resolvedTopicName,
        transcription: Value(_normalizeNullableText(newWord.transcription)),
        partOfSpeech: Value(_normalizeNullableText(newWord.partOfSpeech)),
        usage: Value(_normalizeNullableText(newWord.usage)),
        learned: Value(newWord.learned),
        learnedAt: Value(newWord.learnedAt),
      ),
    );
    return insertedId > 0;
  }

  Future<bool> updateWord(Word updatedWord) async {
    final id = updatedWord.id;
    if (id == null) return false;
    final updatedCount =
        await (update(words)..where((word) => word.id.equals(id))).write(
          WordsCompanion(
            topicId: Value(updatedWord.topicId),
            word: Value(updatedWord.word.trim()),
            translation: Value(updatedWord.translation.trim()),
            topicName: _normalizeNullableText(updatedWord.topic) == null
                ? const Value.absent()
                : Value(_normalizeNullableText(updatedWord.topic)!),
            transcription: Value(
              _normalizeNullableText(updatedWord.transcription),
            ),
            partOfSpeech: Value(
              _normalizeNullableText(updatedWord.partOfSpeech),
            ),
            usage: Value(_normalizeNullableText(updatedWord.usage)),
            learned: Value(updatedWord.learned),
            learnedAt: Value(updatedWord.learnedAt),
          ),
        );
    return updatedCount > 0;
  }

  String? _normalizeNullableText(String? value) {
    if (value == null) return null;
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  Future<bool> deleteTopicWithWords(int topicId) async {
    if (topicId < 0) return false;
    return transaction(() async {
      await (delete(words)..where((word) => word.topicId.equals(topicId))).go();
      final deletedTopics = await (delete(
        topics,
      )..where((tbl) => tbl.id.equals(topicId))).go();
      return deletedTopics > 0;
    });
  }

  Future<void> saveUserGoals(entity.UserGoals goals) async {
    await into(userGoalsTable).insertOnConflictUpdate(
      UserGoalsTableCompanion.insert(
        id: const Value(1),
        overallGoal: goals.overallGoal,
        dailyGoal: goals.dailyGoal,
      ),
    );
  }

  Future<entity.UserGoals?> getUserGoals() async {
    final row = await (select(
      userGoalsTable,
    )..where((tbl) => tbl.id.equals(1))).getSingleOrNull();
    if (row == null) return null;
    return entity.UserGoals(
      overallGoal: row.overallGoal,
      dailyGoal: row.dailyGoal,
    );
  }

  Stream<entity.UserGoals?> watchUserGoals() {
    return (select(
      userGoalsTable,
    )..where((tbl) => tbl.id.equals(1))).watchSingleOrNull().map((row) {
      if (row == null) return null;
      return entity.UserGoals(
        overallGoal: row.overallGoal,
        dailyGoal: row.dailyGoal,
      );
    });
  }

  Future<({int totalWords, int learnedWords})> getWordsProgressStats() async {
    final query = customSelect(
      '''
      SELECT
        COUNT(*) as totalWords,
        COALESCE(SUM(CASE WHEN learned = 1 THEN 1 ELSE 0 END), 0) as learnedWords
      FROM words
      ''',
      readsFrom: {words},
    );
    final row = await query.getSingle();
    return (
      totalWords: row.read<int>('totalWords'),
      learnedWords: row.read<int>('learnedWords'),
    );
  }

  Stream<({int totalWords, int learnedWords, int learnedToday})>
  watchWordsProgressStats() {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final startOfNextDay = startOfDay.add(const Duration(days: 1));
    final query = customSelect(
      '''
      SELECT
        COUNT(*) as totalWords,
        COALESCE(SUM(CASE WHEN learned = 1 THEN 1 ELSE 0 END), 0) as learnedWords,
        COALESCE(
          SUM(
            CASE
              WHEN learned_at >= ? AND learned_at < ? THEN 1
              ELSE 0
            END
          ),
          0
        ) as learnedToday
      FROM words
      ''',
      variables: [
        Variable.withDateTime(startOfDay),
        Variable.withDateTime(startOfNextDay),
      ],
      readsFrom: {words},
    );
    return query.watchSingle().map(
      (row) => (
        totalWords: row.read<int>('totalWords'),
        learnedWords: row.read<int>('learnedWords'),
        learnedToday: row.read<int>('learnedToday'),
      ),
    );
  }

  Future<int> restoreFromBackupJson(List<Map<String, dynamic>> backupJson) {
    const int defaultTopicColorValue = 0xFFA89DEF;
    const String fallbackTopicName = 'Без темы';

    String normalizeTopicName(String? raw) {
      final trimmed = raw?.trim();
      if (trimmed == null || trimmed.isEmpty) return fallbackTopicName;
      return trimmed;
    }

    String requireTextField(
      Map<String, dynamic> json,
      String key, {
      required int index,
    }) {
      final value = json[key];
      if (value is! String || value.trim().isEmpty) {
        throw FormatException(
          'Invalid "$key" at item ${index + 1}: non-empty string expected',
        );
      }
      return value.trim();
    }

    bool parseLearned(Map<String, dynamic> json) {
      final value = json['learned'];
      if (value == null) return false;
      if (value is bool) return value;
      if (value is num) return value != 0;
      if (value is String) {
        final normalized = value.trim().toLowerCase();
        if (normalized == 'true' || normalized == '1') return true;
        if (normalized == 'false' || normalized == '0') return false;
      }
      throw const FormatException('Invalid "learned" value in backup JSON');
    }

    DateTime? parseLearnedAt(
      Map<String, dynamic> json, {
      required bool learned,
    }) {
      if (!learned) return null;
      final value = json['learnedAt'];
      if (value == null) return null;
      if (value is! String || value.trim().isEmpty) {
        throw const FormatException('Invalid "learnedAt" value in backup JSON');
      }
      try {
        return DateTime.parse(value);
      } on FormatException {
        throw const FormatException('Invalid "learnedAt" value in backup JSON');
      }
    }

    return transaction(() async {
      await delete(words).go();
      await delete(topics).go();
      await delete(userGoalsTable).go();

      if (backupJson.isEmpty) return 0;

      final topicIdByName = <String, int>{};
      for (var i = 0; i < backupJson.length; i++) {
        final item = backupJson[i];
        final topicName = normalizeTopicName(item['topic'] as String?);
        if (topicIdByName.containsKey(topicName)) continue;
        final topicId = await into(topics).insert(
          TopicsCompanion.insert(
            name: topicName,
            colorValue: const Value(defaultTopicColorValue),
          ),
        );
        topicIdByName[topicName] = topicId;
      }

      final entries = <WordsCompanion>[];
      for (var i = 0; i < backupJson.length; i++) {
        final item = backupJson[i];
        final topicName = normalizeTopicName(item['topic'] as String?);
        final topicId = topicIdByName[topicName];
        if (topicId == null) {
          throw FormatException('Topic not found for item ${i + 1}');
        }

        final word = requireTextField(item, 'word', index: i);
        final translation = requireTextField(item, 'translation', index: i);
        final transcription = _normalizeNullableText(
          item['transcription'] as String?,
        );
        final partOfSpeech = _normalizeNullableText(
          item['partOfSpeech'] as String?,
        );
        final usage = _normalizeNullableText(item['usage'] as String?);
        final learned = parseLearned(item);

        entries.add(
          WordsCompanion.insert(
            topicId: Value(topicId),
            word: word,
            translation: translation,
            topicName: topicName,
            transcription: Value(transcription),
            partOfSpeech: Value(partOfSpeech),
            usage: Value(usage),
            learned: Value(learned),
            learnedAt: Value(parseLearnedAt(item, learned: learned)),
          ),
        );
      }

      await batch((b) => b.insertAll(words, entries));
      return entries.length;
    });
  }
}

final AppDatabase appDatabase = AppDatabase();
