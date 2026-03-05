import 'package:flashcards_learning_app/utils/pluralization.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('russianWordForm handles one/few/many edge cases', () {
    expect(russianWordForm(1), 'слово');
    expect(russianWordForm(2), 'слова');
    expect(russianWordForm(5), 'слов');
    expect(russianWordForm(11), 'слов');
    expect(russianWordForm(21), 'слово');
    expect(russianWordForm(24), 'слова');
    expect(russianWordForm(-1), 'слово');
  });

  test('englishWordForm handles singular/plural', () {
    expect(englishWordForm(1), 'word');
    expect(englishWordForm(0), 'words');
    expect(englishWordForm(2), 'words');
    expect(englishWordForm(-1), 'word');
  });

  test('format helpers include count and word form', () {
    expect(formatRussianWordCount(22), '22 слова');
    expect(formatEnglishWordCount(3), '3 words');
  });
}
