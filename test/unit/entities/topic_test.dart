import 'package:flashcards_learning_app/entities/topic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('copyWith updates topic fields', () {
    final source = Topic(id: 1, topicName: 'Animals', colorValue: 0xFFA89DEF);
    final updated = source.copyWith(
      topicName: 'Travel',
      colorValue: 0xFF000000,
    );

    expect(updated.id, 1);
    expect(updated.topicName, 'Travel');
    expect(updated.colorValue, 0xFF000000);
  });

  test('toJson/fromJson maps fields', () {
    final source = Topic(topicName: 'Travel', colorValue: 0xFFA89DEF);

    final json = source.toJson();
    final restored = Topic.fromJson(json);

    expect(restored.topicName, 'Travel');
    expect(restored.colorValue, 0xFFA89DEF);
  });

  test('color getter returns null or Color from colorValue', () {
    final noColor = Topic(topicName: 'A');
    final withColor = Topic(topicName: 'B', colorValue: 0xFFA89DEF);

    expect(noColor.color, isNull);
    expect(withColor.color, const Color(0xFFA89DEF));
  });
}
