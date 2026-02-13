import 'package:flashcards_learning_app/common_widgets/custom_action_button.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flutter/material.dart';

class DeletionAcceptanceBody extends StatelessWidget {
  final String topicName;
  const DeletionAcceptanceBody({super.key, required this.topicName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
          child: Text(
            'Вы точно хотите удалить тему “$topicName”?',
            textAlign: TextAlign.center,
            style: AppConst.h1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Все слова и ваш прогресс удалятся полностью',
            textAlign: TextAlign.center,
            style: AppConst.text,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomActionButton(
                buttonText: 'Отмена',
                onTap: () => Navigator.of(context).pop(false),
                borderColor: AppConst.black,
                borderWidth: 1,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: CustomActionButton(
                buttonText: 'Удалить',
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
