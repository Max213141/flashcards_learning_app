import 'package:flashcards_learning_app/common_widgets/custom_action_button.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';

class RestoreBackupAcceptanceBody extends StatelessWidget {
  const RestoreBackupAcceptanceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
          child: Text(
            'Восстановить данные из резервной копии?',
            textAlign: TextAlign.center,
            style: AppConst.h1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Текущие темы, слова и прогресс будут полностью заменены данными из резервной копии',
            textAlign: TextAlign.center,
            style: AppConst.text,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomActionButton(
                buttonText: 'Отмена',
                onTap: () => Navigator.of(context).pop(false),
                borderColor: AppConst.black,
                borderWidth: .5,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: CustomActionButton(
                buttonText: 'Восстановить',
                onTap: () => Navigator.of(context).pop(true),
                color: Color(0x99FF0A0A),
                borderColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
