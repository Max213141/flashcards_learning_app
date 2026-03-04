import 'dart:math';

List<T> shuffleWithoutSamePositions<T>(List<T> items, {Random? random}) {
  if (items.length < 2) {
    return List<T>.from(items);
  }

  final rng = random ?? Random();
  final shuffled = List<T>.from(items);

  for (var attempt = 0; attempt < 8; attempt++) {
    shuffled.shuffle(rng);

    final hasSamePosition = Iterable<int>.generate(
      items.length,
    ).any((index) => identical(shuffled[index], items[index]));

    if (!hasSamePosition) {
      return shuffled;
    }
  }

  final offset = rng.nextInt(items.length - 1) + 1;

  return List<T>.generate(
    items.length,
    (index) => items[(index + offset) % items.length],
  );
}
