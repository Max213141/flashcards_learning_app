import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flutter/material.dart';

class FancyAccomplishmentText extends StatelessWidget {
  final int dailyGoal;
  const FancyAccomplishmentText({super.key, required this.dailyGoal});

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
                '0',
                style: AppConst.additionalText.copyWith(
                  fontWeight: FontWeight.w600,
                ),
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
              child: Text('$dailyGoal', style: AppConst.additionalText),
            ),
          ),
        ],
      ),
    );
  }
}
