import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/json_import_info_widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Explains topic creation, JSON import, and prompt-assisted file creation.
class JsonImportInfoWidget extends StatelessWidget {
  const JsonImportInfoWidget({super.key, required this.onBack});

  static const String _prompt = '''
Create a downloadable JSON file for a flashcards app.

Generate the result as a .json file that I can download and import into the app.
If you cannot attach a downloadable file, return only raw JSON text with no
markdown fences, comments, or extra explanation.

Before generating the flashcards, use these language settings:
- Source language for "word": <FILL SOURCE LANGUAGE HERE>.
- Target language for "translation": <FILL TARGET LANGUAGE HERE>.

The root value must be one JSON array. Each array item must be an object that
represents one flashcard.

Required fields for every item:
- "word": string, the word or phrase to learn in the source language.
- "translation": string, the translation in the target language.

Supported optional fields:
- "topic": string, topic/deck name. Use the same topic for all items unless a
  different grouping is useful.
- "transcription": string, pronunciation or phonetic transcription for "word".
- "partOfSpeech": string, for example noun, verb, adjective, adverb, phrase,
  idiom, or interjection.
- "usage": string, one short natural example sentence in the source language.
- "learned": boolean. Use false or omit it for new flashcards.
- "learnedAt": string in ISO 8601 date-time format. Omit it unless "learned"
  is true.

Use camelCase keys exactly as shown. Do not include IDs.
Do not add trailing commas.
Create 30 useful flashcards for this topic: <FILL TOPIC HERE>.
Name the downloadable file flashcards_<FILL_TOPIC_HERE>.json.

Example item:
{
  "word": "hello",
  "translation": "hola",
  "topic": "Basic greetings",
  "transcription": "/heh-loh/",
  "partOfSpeech": "interjection",
  "usage": "Hello, nice to meet you."
}
''';

  /// Called when the user wants to return to topic creation.
  final VoidCallback onBack;

  Future<void> _copyPrompt(BuildContext context) async {
    final l10n = l10nOf(context);
    await Clipboard.setData(const ClipboardData(text: _prompt));
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.popUpBodyJsonPromptCopied)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text(l10n.popUpBodyJsonInfoTitle, style: AppConst.h1)),
          const SizedBox(height: 24),
          Text(l10n.popUpBodyJsonInfoDescription, style: AppConst.text),
          const SizedBox(height: 20),
          InfoRow(text: l10n.popUpBodyJsonInfoManualTopicFlow),
          InfoRow(text: l10n.popUpBodyJsonInfoImportFlow),
          InfoRow(text: l10n.popUpBodyJsonInfoArrayRule),
          InfoRow(text: l10n.popUpBodyJsonInfoRequiredFields),
          InfoRow(text: l10n.popUpBodyJsonInfoOptionalFields),
          InfoRow(text: l10n.popUpBodyJsonInfoTopicRule),
          InfoRow(text: l10n.popUpBodyJsonInfoPromptRule),
          const SizedBox(height: 20),
          Text(l10n.popUpBodyJsonExampleTitle, style: AppConst.h2),
          const SizedBox(height: 8),
          const JsonExampleBox(),
          const SizedBox(height: 24),
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                SizedBox(
                  height: 55,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppConst.buttonBackground,
                      foregroundColor: AppConst.black,
                      side: const BorderSide(color: AppConst.primary, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                    onPressed: () => _copyPrompt(context),
                    icon: const Icon(Icons.content_copy, size: 20),
                    label: Text(
                      l10n.popUpBodyJsonCopyPromptButton,
                      style: AppConst.text,
                    ),
                  ),
                ),
                SizedBox(
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
                      l10n.popUpBodyJsonBackButton,
                      style: AppConst.text,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
