import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flutter/material.dart';

class EditWordForm extends StatefulWidget {
  final Word? word;
  final Future<void> Function(Word updatedWord)? onSave;
  final bool pinSaveButtonToBottom;

  const EditWordForm({
    super.key,
    this.word,
    this.onSave,
    this.pinSaveButtonToBottom = false,
  });

  @override
  State<EditWordForm> createState() => _EditWordFormState();
}

class _EditWordFormState extends State<EditWordForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController learningWordController = TextEditingController();
  final TextEditingController translationController = TextEditingController();
  final TextEditingController transcriptionController = TextEditingController();
  final TextEditingController partofSpeechController = TextEditingController();
  final TextEditingController usageController = TextEditingController();

  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final word = widget.word;
    if (word != null) {
      learningWordController.text = word.word;
      translationController.text = word.translation;
      transcriptionController.text = word.transcription ?? '';
      partofSpeechController.text = word.partOfSpeech ?? '';
      usageController.text = word.usage ?? '';
    }
  }

  @override
  void dispose() {
    learningWordController.dispose();
    translationController.dispose();
    transcriptionController.dispose();
    partofSpeechController.dispose();
    usageController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    final wordValue = learningWordController.text.trim();
    final translationValue = translationController.text.trim();
    if (wordValue.isEmpty || translationValue.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Заполните слово и перевод')),
      );
      return;
    }

    if (widget.onSave == null) return;

    final baseWord =
        widget.word ?? Word(word: wordValue, translation: translationValue);
    final updatedWord = baseWord.copyWith(
      word: wordValue,
      translation: translationValue,
      transcription: _normalizedOrNull(transcriptionController.text),
      partOfSpeech: _normalizedOrNull(partofSpeechController.text),
      usage: _normalizedOrNull(usageController.text),
    );

    setState(() => _saving = true);
    try {
      await widget.onSave!(updatedWord);
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  String? _normalizedOrNull(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;

    final content = widget.pinSaveButtonToBottom
        ? Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: EditFormFields(
                      learningWordController: learningWordController,
                      translationController: translationController,
                      transcriptionController: transcriptionController,
                      partofSpeechController: partofSpeechController,
                      usageController: usageController,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: CustomActionButton(
                    buttonText: _saving ? 'Сохранение...' : 'Сохранить',
                    onTap: _handleSave,
                  ),
                ),
              ],
            ),
          )
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditFormFields(
                  learningWordController: learningWordController,
                  translationController: translationController,
                  transcriptionController: transcriptionController,
                  partofSpeechController: partofSpeechController,
                  usageController: usageController,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: CustomActionButton(
                    buttonText: _saving ? 'Сохранение...' : 'Сохранить',
                    onTap: _handleSave,
                  ),
                ),
              ],
            ),
          );

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: content,
      ),
    );
  }
}
