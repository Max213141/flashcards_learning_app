import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flutter/material.dart';

class FlashcardBackside extends StatelessWidget {
  final Word wordPair;
  final String translation;
  const FlashcardBackside({
    super.key,
    required this.wordPair,
    required this.translation,
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

        child: Column(
          children: [
            Spacer(flex: 1),

            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0, top: 5),
                child: Icon(Icons.access_alarm_outlined),
              ),
            ),
            Spacer(flex: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 75.0),
              child: Text(
                translation,
                maxLines: 5,
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(flex: 15),
          ],
        ),
      ),
    );
  }
}
