import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class FinishedTestBodyWidget extends StatelessWidget {
  final int successfulGuesses;
  final int failedGuesses;
  final int wordsListLength;
  const FinishedTestBodyWidget({
    super.key,
    required this.successfulGuesses,
    required this.failedGuesses,
    required this.wordsListLength,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);

    return PopUpBox(
      popupContent: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(l10n.finishedTestTitle, style: AppConst.h1),
          const SizedBox(height: 12),
          Text(
            l10n.finishedTestCorrectCount(successfulGuesses),
            style: AppConst.text,
          ),
          const SizedBox(height: 6),
          Text(
            l10n.finishedTestIncorrectCount(failedGuesses),
            style: AppConst.text,
          ),
          const SizedBox(height: 6),
          Text(
            l10n.finishedTestTotalCount(wordsListLength),
            style: AppConst.text,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 42,
            width: 120,
            child: CustomActionButton(
              onTap: () async {
                Navigator.of(context, rootNavigator: true).pop();
              },
              buttonText: l10n.finishedTestOkButton,
            ),
          ),
        ],
      ),
    );
  }
}
