import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          border: Border.all(width: 12, color: AppConst.primary),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lexicalCategory ?? ''),
                    SvgPicture.asset(
                      'assets/iconss/edit.svg',
                      width: 24,
                      height: 24,
                    ),
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
