import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
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
    return PopUpBox(
      popupContent: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Тест завершен', style: AppConst.h1),
          const SizedBox(height: 12),
          Text('Правильно: $successfulGuesses', style: AppConst.text),
          const SizedBox(height: 6),
          Text('Неправильно: $failedGuesses', style: AppConst.text),
          const SizedBox(height: 6),
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
      ),
    );
  }
}
