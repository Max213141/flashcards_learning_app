import 'package:flutter/material.dart';

class FlashcardSide extends StatelessWidget {
  final String word;
  const FlashcardSide({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(child: Text(word)),
      ),
    );
  }
}
