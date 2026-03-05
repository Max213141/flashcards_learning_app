import 'dart:math';

import 'package:flashcards_learning_app/utils/derangement_shuffle.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('returns copy for empty list', () {
    final source = <int>[];
    final result = shuffleWithoutSamePositions(source, random: Random(1));

    expect(result, isEmpty);
    expect(identical(source, result), false);
  });

  test('returns copy for single-element list', () {
    final source = [1];
    final result = shuffleWithoutSamePositions(source, random: Random(1));

    expect(result, [1]);
    expect(identical(source, result), false);
  });

  test('for 2+ elements has no item in same position', () {
    final source = [1, 2, 3, 4, 5, 6];
    final result = shuffleWithoutSamePositions(source, random: Random(2));

    for (var i = 0; i < source.length; i++) {
      expect(identical(result[i], source[i]), false);
    }
  });

  test('is deterministic with seeded random', () {
    final source = [1, 2, 3, 4, 5, 6];
    final first = shuffleWithoutSamePositions(source, random: Random(42));
    final second = shuffleWithoutSamePositions(source, random: Random(42));

    expect(first, second);
  });
}
