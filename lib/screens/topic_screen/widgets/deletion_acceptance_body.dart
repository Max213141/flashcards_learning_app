import 'package:flashcards_learning_app/common_widgets/custom_action_button.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class DeletionAcceptanceBody extends StatelessWidget {
  final String topicName;
  const DeletionAcceptanceBody({super.key, required this.topicName});

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
          child: Text(
            l10n.deletionAcceptanceTitle(topicName),
            textAlign: TextAlign.center,
            style: AppConst.h1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            l10n.deletionAcceptanceMessage,
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
                buttonText: l10n.deletionAcceptanceCancelButton,
                onTap: () => Navigator.of(context).pop(false),
                borderColor: AppConst.black,
                borderWidth: .5,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: CustomActionButton(
                buttonText: l10n.deletionAcceptanceDeleteButton,
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
