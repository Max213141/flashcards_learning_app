import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flashcards_learning_app/data/local/topic_summary.dart';
import 'package:flashcards_learning_app/entities/word.dart';

class AnalyticsService {
  AnalyticsService({FirebaseAnalytics? analytics})
    : _analytics = analytics ?? FirebaseAnalytics.instance;

  final FirebaseAnalytics _analytics;

  Future<void> setCollectionEnabled(bool enabled) async {
    try {
      await _analytics.setAnalyticsCollectionEnabled(enabled);
    } catch (_) {
      // Keep analytics failures non-blocking for app behavior.
    }
  }

  void logTopicOpened({required TopicSummary topic}) {
    _logEvent(
      name: 'topic_opened',
      parameters: {
        'topic_id': topic.id,
        'total_words': topic.totalWords,
        'learned_words': topic.learnedWords,
      },
    );
  }

  void logPracticeStarted({required int topicId}) {
    _logEvent(name: 'practice_started', parameters: {'topic_id': topicId});
  }

  void logExamStarted({required int topicId}) {
    _logEvent(name: 'exam_started', parameters: {'topic_id': topicId});
  }

  void logWordOpened({required int topicId, required Word word}) {
    _logEvent(
      name: 'word_opened',
      parameters: {'topic_id': topicId, 'learned': word.learned ? 1 : 0},
    );
  }

  void logBackupExportRequested() {
    _logEvent(name: 'backup_export_requested');
  }

  void logBackupRestoreRequested() {
    _logEvent(name: 'backup_restore_requested');
  }

  void logTopicCreated() {
    _logEvent(name: 'topic_created');
  }

  void logWordsImportRequested({required int topicId}) {
    _logEvent(
      name: 'words_import_requested',
      parameters: {'topic_id': topicId},
    );
  }

  void logWordAddRequested({required int topicId}) {
    _logEvent(name: 'word_add_requested', parameters: {'topic_id': topicId});
  }

  void _logEvent({required String name, Map<String, Object>? parameters}) {
    unawaited(_logEventSafe(name: name, parameters: parameters));
  }

  Future<void> _logEventSafe({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    try {
      await _analytics.logEvent(name: name, parameters: parameters);
    } catch (_) {
      // Keep analytics failures non-blocking for app behavior.
    }
  }
}
