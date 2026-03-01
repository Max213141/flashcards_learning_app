import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';

class FancyAccomplishmentText extends StatelessWidget {
  final int currentDailyLearned;
  final int dailyGoal;
  const FancyAccomplishmentText({
    super.key,
    required this.currentDailyLearned,
    required this.dailyGoal,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.top,
            child: Transform.translate(
              offset: const Offset(0, -2),
              child: Text(
                '$currentDailyLearned',
                style: AppConst.additionalText,
              ),
            ),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,

            child: Text('/', style: AppConst.additionalText),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Transform.translate(
              offset: const Offset(0, 0),
              child: Text(
                '$dailyGoal',
                style: AppConst.additionalText.copyWith(
                  color: Color.fromARGB(255, 117, 117, 117),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
