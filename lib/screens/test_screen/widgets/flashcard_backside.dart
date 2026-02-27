import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/utils/utils.dart';
import 'package:flutter/material.dart';

class FlashcardBackside extends StatelessWidget {
  final Word wordPair;
  final String translation;
  final Color topicColor;

  const FlashcardBackside({
    super.key,
    required this.wordPair,
    required this.translation,
    required this.topicColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),

      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(width: 12, color: topicColor),
          borderRadius: BorderRadius.circular(18),
        ),

        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: ScaledText(value: translation),
          ),
        ),
      ),
    );
  }
}
