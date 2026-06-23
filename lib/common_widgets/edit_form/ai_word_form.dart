import 'package:flashcards_learning_app/blocs/blocs.dart';
import 'package:flashcards_learning_app/common_widgets/edit_form/ai_drafts_controls.dart';
import 'package:flashcards_learning_app/common_widgets/edit_form/word_form_controllers.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiWordForm extends StatefulWidget {
  final Future<void> Function(Word updatedWord)? onSave;

  const AiWordForm({super.key, this.onSave});

  @override
  State<AiWordForm> createState() => _AiWordFormState();
}

class _AiWordFormState extends State<AiWordForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final WordFormControllers _wordControllers = WordFormControllers();

  bool _saving = false;

  @override
  void dispose() {
    _wordControllers.dispose();
    super.dispose();
  }

  Future<void> _requestAiDraft() async {
    final input = _wordControllers.wordText;
    if (input.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Введите слово или фразу')));
      return;
    }

    context.read<AiWordDraftBloc>().add(
      AiWordDraftEvent.generateRequested(input: input),
    );
  }

  Future<void> _handleSave() async {
    if (_wordControllers.wordText.isEmpty ||
        _wordControllers.translationText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Заполните слово и перевод')),
      );
      return;
    }

    setState(() => _saving = true);
    try {
      await widget.onSave?.call(_wordControllers.toWord());
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: BlocConsumer<AiWordDraftBloc, AiWordDraftState>(
          listener: _handleAiState,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EditFormFields(
                    learningWordController: _wordControllers.learningWord,
                    translationController: _wordControllers.translation,
                    transcriptionController: _wordControllers.transcription,
                    partofSpeechController: _wordControllers.partOfSpeech,
                    usageController: _wordControllers.usage,
                  ),
                  AiDraftControls(state: state, onGenerate: _requestAiDraft),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: CustomActionButton(
                      buttonText: _saving ? 'Сохранение...' : 'Сохранить',
                      onTap: _saving ? null : _handleSave,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _handleAiState(
    BuildContext context,
    AiWordDraftState state,
  ) async {
    if (state.generationStatus == AiGenerationStatus.success &&
        state.draft != null) {
      _wordControllers.applyDraft(state.draft!);
      context.read<AiWordDraftBloc>().add(
        const AiWordDraftEvent.statusConsumed(),
      );
      return;
    }

    if (state.generationStatus == AiGenerationStatus.failure &&
        state.message != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.message!)));
      context.read<AiWordDraftBloc>().add(
        const AiWordDraftEvent.statusConsumed(),
      );
    }
  }
}
