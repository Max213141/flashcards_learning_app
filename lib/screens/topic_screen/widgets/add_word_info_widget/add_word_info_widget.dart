import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flashcards_learning_app/screens/topic_screen/widgets/add_word_info_widget/widgets.dart';
import 'package:flutter/material.dart';

/// Explains how manual word creation works.
class AddWordInfoWidget extends StatelessWidget {
  const AddWordInfoWidget({super.key, required this.onBack});

  /// Called when the user wants to return to the add-word form.
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text(l10n.topicAddWordInfoTitle, style: AppConst.h1)),
          const SizedBox(height: 24),
          Text(l10n.topicAddWordInfoDescription, style: AppConst.text),
          const SizedBox(height: 20),
          AddWordInfoRow(text: l10n.topicAddWordInfoWordRule),
          AddWordInfoRow(text: l10n.topicAddWordInfoTranslationRule),
          AddWordInfoRow(text: l10n.topicAddWordInfoOptionalFieldsRule),
          AddWordInfoRow(text: l10n.topicAddWordInfoTranscriptionRule),
          AddWordInfoRow(text: l10n.topicAddWordInfoPartOfSpeechRule),
          AddWordInfoRow(text: l10n.topicAddWordInfoUsageRule),
          AddWordInfoRow(text: l10n.topicAddWordInfoSaveRule),
          const SizedBox(height: 24),
          Center(
            child: SizedBox(
              height: 55,
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: AppConst.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                onPressed: onBack,
                icon: const Icon(Icons.arrow_back, size: 20),
                label: Text(
                  l10n.topicAddWordInfoBackButton,
                  style: AppConst.text,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
