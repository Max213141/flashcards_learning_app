String russianPluralForm(
  int count, {
  required String one,
  required String few,
  required String many,
}) {
  final n = count.abs() % 100;
  final n1 = n % 10;
  if (n > 10 && n < 20) return many;
  if (n1 > 1 && n1 < 5) return few;
  if (n1 == 1) return one;
  return many;
}

String russianWordForm(int count) {
  return russianPluralForm(count, one: 'слово', few: 'слова', many: 'слов');
}

String formatRussianWordCount(int count) {
  return '$count ${russianWordForm(count)}';
}

String englishWordForm(int count, {String singular = 'word', String plural = 'words'}) {
  return count.abs() == 1 ? singular : plural;
}

String formatEnglishWordCount(int count) {
  return '$count ${englishWordForm(count)}';
}
