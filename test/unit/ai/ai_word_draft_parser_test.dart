import 'package:flashcards_learning_app/utils/ai_word_draft_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const parser = AiWordDraftParser();

  test('accepts valid JSON', () {
    final draft = parser.parse('''
{
  "word": "bonjour",
  "translation": "привет",
  "transcription": "бонжур",
  "partOfSpeech": "междометие",
  "usage": "Bonjour ! - Привет!"
}
''');

    expect(draft.word, 'bonjour');
    expect(draft.translation, 'привет');
    expect(draft.transcription, 'бонжур');
    expect(draft.partOfSpeech, 'междометие');
    expect(draft.usage, 'Bonjour ! - Привет!');
  });

  test('rejects missing word', () {
    expect(
      () => parser.parse('{"translation":"привет"}'),
      throwsFormatException,
    );
  });

  test('rejects empty translation', () {
    expect(
      () => parser.parse('{"word":"bonjour","translation":"  "}'),
      throwsFormatException,
    );
  });

  test('normalizes empty optional fields to null and trims values', () {
    final draft = parser.parse('''
```json
{
  "word": " bonjour ",
  "translation": " привет ",
  "transcription": "",
  "partOfSpeech": " ",
  "usage": null
}
```
''');

    expect(draft.word, 'bonjour');
    expect(draft.translation, 'привет');
    expect(draft.transcription, isNull);
    expect(draft.partOfSpeech, isNull);
    expect(draft.usage, isNull);
  });
}
