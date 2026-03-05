import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('copyWith preserves nullable fields by default and can clear them', () {
    final source = Word(
      id: 1,
      topicId: 10,
      word: 'cat',
      translation: 'кот',
      topic: 'Animals',
      transcription: '[kæt]',
      partOfSpeech: 'noun',
      usage: 'A cat sleeps.',
      learned: true,
      learnedAt: DateTime(2025, 1, 1),
    );

    final unchanged = source.copyWith(word: 'dog');
    expect(unchanged.word, 'dog');
    expect(unchanged.transcription, '[kæt]');
    expect(unchanged.learnedAt, DateTime(2025, 1, 1));

    final cleared = source.copyWith(
      transcription: null,
      partOfSpeech: null,
      usage: null,
      topic: null,
      learnedAt: null,
    );

    expect(cleared.transcription, isNull);
    expect(cleared.partOfSpeech, isNull);
    expect(cleared.usage, isNull);
    expect(cleared.topic, isNull);
    expect(cleared.learnedAt, isNull);
  });

  test('toJson/fromJson maps optional fields and learnedAt', () {
    final date = DateTime.parse('2025-01-01T12:00:00.000Z');
    final source = Word(
      word: 'cat',
      translation: 'кот',
      topic: 'Animals',
      transcription: '[kæt]',
      partOfSpeech: 'noun',
      usage: 'A cat sleeps.',
      learned: true,
      learnedAt: date,
    );

    final json = source.toJson();
    final restored = Word.fromJson(json);

    expect(restored.word, source.word);
    expect(restored.translation, source.translation);
    expect(restored.topic, source.topic);
    expect(restored.transcription, source.transcription);
    expect(restored.partOfSpeech, source.partOfSpeech);
    expect(restored.usage, source.usage);
    expect(restored.learned, isTrue);
    expect(restored.learnedAt, date);
  });
}
