import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flashcards_learning_app/screens/exam_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ExamFinishedWidget extends StatelessWidget {
  final int wordsListLength;
  const ExamFinishedWidget({super.key, required this.wordsListLength});

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SuccessWidget(),
        const SizedBox(height: 8),
        Text(l10n.examFinishedTitle, style: AppConst.h1),
        const SizedBox(height: 8),
        Text(
          l10n.examFinishedTotalCount(wordsListLength),
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
            buttonText: l10n.examFinishedOkButton,
          ),
        ),
      ],
    );
  }
}
