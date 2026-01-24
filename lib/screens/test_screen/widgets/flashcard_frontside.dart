import 'package:flutter/material.dart';

class FlashcardFrontSide extends StatelessWidget {
  final String word;
  final String? transcription;
  final String? lexicalCategory;
  const FlashcardFrontSide({
    super.key,
    required this.word,
    this.transcription,
    this.lexicalCategory,
  });

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lexicalCategory ?? ''),
                    Icon(Icons.access_alarm_outlined),
                  ],
                ),
              ),
              Spacer(flex: 8),
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
              Spacer(flex: 10),
            ],
          ),
        ),
      ),
    );
  }
}
