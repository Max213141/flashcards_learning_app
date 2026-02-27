import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/utils/utils.dart';
import 'package:flutter/material.dart';

class FlashcardFrontSide extends StatelessWidget {
  final Word wordPair;
  final String word;
  final Color topicColor;
  final String? transcription;
  final String? partOfSpeech;
  const FlashcardFrontSide({
    super.key,
    required this.word,
    this.transcription,
    this.partOfSpeech,
    required this.wordPair,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(partOfSpeech ?? '', style: AppConst.text),
                    // GestureDetector(
                    //   onTap: () => AutoRouter.of(
                    //     context,
                    //   ).push(EditWordRoute(word: wordPair)),
                    //   child: SvgPicture.asset(
                    //     'assets/iconss/edit.svg',
                    //     width: 24,
                    //     height: 24,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Spacer(flex: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: ScaledText(value: word),
              ),
              if (transcription != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    transcription!,
                    style: AppConst.text,
                    textAlign: TextAlign.center,
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
