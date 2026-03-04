import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/screens/exam_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ExamFinishedWidget extends StatelessWidget {
  final int wordsListLength;
  const ExamFinishedWidget({super.key, required this.wordsListLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SuccessWidget(),
        const SizedBox(height: 8),
        Text('Экзамен завершен', style: AppConst.h1),
        const SizedBox(height: 8),
        Text('Всего: $wordsListLength', style: AppConst.text),
        const SizedBox(height: 16),
        SizedBox(
          height: 42,
          width: 120,
          child: CustomActionButton(
            onTap: () async {
              Navigator.of(context, rootNavigator: true).pop();
            },
            buttonText: 'Ок',
          ),
        ),
      ],
    );
  }
}
