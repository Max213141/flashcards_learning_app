import 'package:flutter/material.dart';

class FlashcardFrontSide extends StatelessWidget {
  final String word;
  final String? transcription;
  const FlashcardFrontSide({super.key, required this.word, this.transcription});

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
            padding: const EdgeInsets.symmetric(horizontal: 75.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  word,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
                ),
                if (transcription != null)
                  Text(
                    transcription!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(255, 46, 50, 52),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
