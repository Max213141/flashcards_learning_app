import 'package:flashcards_learning_app/common_widgets/custom_action_button.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';

class CrashlyticsConsentBody extends StatelessWidget {
  const CrashlyticsConsentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Text(
            'Разрешить анонимную аналитику и отчёты о сбоях?',
            textAlign: TextAlign.center,
            style: AppConst.h1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Это помогает понять, как вы используете приложение, и быстрее исправлять ошибки. '
            'Вы можете изменить выбор позже.',
            textAlign: TextAlign.center,
            style: AppConst.text,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: CustomActionButton(
                buttonText: 'Не сейчас',
                onTap: () => Navigator.of(context).pop(false),
                borderColor: AppConst.transparent,
                color: Color(0x99FF0A0A),
                borderWidth: .5,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: CustomActionButton(
                buttonText: 'Разрешить',
                onTap: () => Navigator.of(context).pop(true),
                borderColor: AppConst.black,
                borderWidth: .5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
