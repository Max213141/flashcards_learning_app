import 'dart:convert';

import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flashcards_learning_app/utils/default_topics_seeder.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../mocks/mock_app_database.dart';

class _FakeAssetBundle extends CachingAssetBundle {
  _FakeAssetBundle(this.assets);

  final Map<String, String> assets;

  @override
  Future<ByteData> load(String key) async {
    final asset = assets[key];
    if (asset == null) {
      throw StateError('Missing test asset: $key');
    }

    final bytes = Uint8List.fromList(utf8.encode(asset));
    return ByteData.view(bytes.buffer);
  }
}

void main() {
  late MockAppDatabase appDatabase;
  late DefaultTopicsSeeder seeder;

  setUpAll(() {
    registerFallbackValue(const Topic(topicName: 'Fallback'));
    registerFallbackValue(<Word>[]);
  });

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    appDatabase = MockAppDatabase();
    seeder = DefaultTopicsSeeder(
      appDatabase: appDatabase,
      assetBundle: _FakeAssetBundle({
        for (final template in DefaultTopicsSeeder.templates)
          template.assetPath: jsonEncode([
            {
              'word': 'hello',
              'translation': 'translation',
              'topic': 'Original Topic',
              'transcription': '/həˈləʊ/',
              'partOfSpeech': 'interjection',
              'usage': 'Hello there.',
              'learned': false,
              'learnedAt': null,
            },
          ]),
      }),
    );

    when(
      () => appDatabase.createTopicWithWordsIfMissing(
        topic: any(named: 'topic'),
        words: any(named: 'words'),
      ),
    ).thenAnswer((_) async => 1);
  });

  test('seedIfNeeded imports each default topic template once', () async {
    await seeder.seedIfNeeded();

    final captured = verify(
      () => appDatabase.createTopicWithWordsIfMissing(
        topic: captureAny(named: 'topic'),
        words: captureAny(named: 'words'),
      ),
    ).captured;

    expect(captured, hasLength(DefaultTopicsSeeder.templates.length * 2));
    for (var i = 0; i < DefaultTopicsSeeder.templates.length; i++) {
      final template = DefaultTopicsSeeder.templates[i];
      final topic = captured[i * 2] as Topic;
      final words = captured[i * 2 + 1] as List<Word>;

      expect(topic.topicName, template.topicName);
      expect(topic.colorValue, template.colorValue);
      expect(words, hasLength(1));
      expect(words.single.topic, template.topicName);
      expect(words.single.word, 'hello');
    }
  });

  test('seedIfNeeded skips templates that were already seeded', () async {
    await seeder.seedIfNeeded();
    clearInteractions(appDatabase);

    await seeder.seedIfNeeded();

    verifyNever(
      () => appDatabase.createTopicWithWordsIfMissing(
        topic: any(named: 'topic'),
        words: any(named: 'words'),
      ),
    );
  });
}
