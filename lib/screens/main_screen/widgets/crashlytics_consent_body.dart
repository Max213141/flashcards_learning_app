import 'package:flashcards_learning_app/common_widgets/custom_action_button.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

class CrashlyticsConsentBody extends StatelessWidget {
  const CrashlyticsConsentBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Text(
            l10n.crashlyticsConsentTitle,
            textAlign: TextAlign.center,
            style: AppConst.h1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            l10n.crashlyticsConsentMessage,
            textAlign: TextAlign.center,
            style: AppConst.text,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: CustomActionButton(
                buttonText: l10n.crashlyticsConsentNotNowButton,
                onTap: () => Navigator.of(context).pop(false),
                borderColor: AppConst.transparent,
                color: Color(0x99FF0A0A),
                borderWidth: .5,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: CustomActionButton(
                buttonText: l10n.crashlyticsConsentAllowButton,
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
