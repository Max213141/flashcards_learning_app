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
          border: Border.all(
            width: 12,
            color: Color.fromRGBO(174, 192, 111, 100),
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(75.0),
            child: Text(word, maxLines: 5, textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}
