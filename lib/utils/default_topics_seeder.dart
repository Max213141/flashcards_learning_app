import 'dart:convert';

import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef SharedPreferencesProvider = Future<SharedPreferences> Function();

class DefaultTopicTemplate {
  final String id;
  final String topicName;
  final int colorValue;
  final String assetPath;

  const DefaultTopicTemplate({
    required this.id,
    required this.topicName,
    required this.colorValue,
    required this.assetPath,
  });
}

class DefaultTopicsSeeder {
  static const List<DefaultTopicTemplate> templates = [
    DefaultTopicTemplate(
      id: 'english_german_flashcards_50',
      topicName: 'English - German',
      colorValue: 0xFFA89DEF,
      assetPath: 'assets/default_topics/english_german_flashcards_50.json',
    ),
    DefaultTopicTemplate(
      id: 'english_italian_flashcards_50',
      topicName: 'English - Italian',
      colorValue: 0xFF99EDF3,
      assetPath: 'assets/default_topics/english_italian_flashcards_50.json',
    ),
  ];

  DefaultTopicsSeeder({
    required AppDatabase appDatabase,
    AssetBundle? assetBundle,
    SharedPreferencesProvider? preferencesProvider,
  }) : _appDatabase = appDatabase,
       _assetBundle = assetBundle ?? rootBundle,
       _preferencesProvider =
           preferencesProvider ?? SharedPreferences.getInstance;

  final AppDatabase _appDatabase;
  final AssetBundle _assetBundle;
  final SharedPreferencesProvider _preferencesProvider;

  Future<void> seedIfNeeded() async {
    final preferences = await _preferencesProvider();

    for (final template in templates) {
      final seededKey = _seededKey(template.id);
      if (preferences.getBool(seededKey) ?? false) {
        continue;
      }

      final words = await _loadWords(template);
      await _appDatabase.createTopicWithWordsIfMissing(
        topic: Topic(
          topicName: template.topicName,
          colorValue: template.colorValue,
        ),
        words: words
            .map((word) => word.copyWith(topic: template.topicName))
            .toList(),
      );
      await preferences.setBool(seededKey, true);
    }
  }

  Future<List<Word>> _loadWords(DefaultTopicTemplate template) async {
    final jsonString = await _assetBundle.loadString(template.assetPath);
    final decoded = jsonDecode(jsonString);
    if (decoded is! List) {
      throw FormatException(
        'Default topic asset must contain a list: ${template.assetPath}',
      );
    }

    return decoded.map<Word>((item) {
      if (item is! Map) {
        throw FormatException(
          'Default topic item must be an object: ${template.assetPath}',
        );
      }
      return Word.fromJson(item.map((key, value) => MapEntry('$key', value)));
    }).toList();
  }

  static String _seededKey(String templateId) {
    return 'default_topic_template_seeded.$templateId';
  }
}
