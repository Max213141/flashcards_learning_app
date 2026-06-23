import 'package:flashcards_learning_app/blocs/word_editing_bloc/word_editing_bloc.dart';
import 'package:flashcards_learning_app/common_widgets/edit_form/word_form_controllers.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  late final WordFormControllers _controllers;

  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _controllers = WordFormControllers(word: widget.word);
  }

  @override
  void dispose() {
    _controllers.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (_controllers.wordText.isEmpty || _controllers.translationText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10nOf(context).editWordFormRequiredFieldsError),
        ),
      );
      return;
    }

    final updatedWord = _controllers.toWord(baseWord: widget.word);

    if (widget.onSave == null) {
      context.read<WordEditingBloc>().add(
        WordEditingEvent.saveRequested(updatedWord: updatedWord),
      );
      return;
    }

    setState(() => _saving = true);
    try {
      await widget.onSave!(updatedWord);
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;
    final formContent = EditFormFields(
      learningWordController: _controllers.learningWord,
      translationController: _controllers.translation,
      transcriptionController: _controllers.transcription,
      partofSpeechController: _controllers.partOfSpeech,
      usageController: _controllers.usage,
    );

    final content = widget.pinSaveButtonToBottom
        ? Padding(
            padding: EdgeInsets.only(bottom: bottom),
            child: Column(
              children: [
                Expanded(child: SingleChildScrollView(child: formContent)),
                const SizedBox(height: 16),
                SizedBox(width: double.infinity, child: _buildSaveButton()),
              ],
            ),
          )
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                formContent,
                const SizedBox(height: 16),
                SizedBox(width: double.infinity, child: _buildSaveButton()),
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

  Widget _buildSaveButton() {
    if (widget.onSave != null) {
      return CustomActionButton(
        buttonText: _saving
            ? l10nOf(context).editWordFormSavingButton
            : l10nOf(context).editWordFormSaveButton,
        onTap: _handleSave,
      );
    }

    return BlocBuilder<WordEditingBloc, WordEditingState>(
      builder: (context, state) {
        return CustomActionButton(
          buttonText: state.isSaving
              ? l10nOf(context).editWordFormSavingButton
              : l10nOf(context).editWordFormSaveButton,
          onTap: state.isSaving ? null : _handleSave,
        );
      },
    );
  }
}
