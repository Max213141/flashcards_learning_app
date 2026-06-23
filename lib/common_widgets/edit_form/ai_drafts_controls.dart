import 'package:flashcards_learning_app/blocs/blocs.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiDraftControls extends StatefulWidget {
  final AiWordDraftState state;
  final VoidCallback onGenerate;

  const AiDraftControls({
    super.key,
    required this.state,
    required this.onGenerate,
  });

  @override
  State<AiDraftControls> createState() => _AiDraftControlsState();
}

class _AiDraftControlsState extends State<AiDraftControls> {
  late final TextEditingController _sourceLanguageController;
  late final TextEditingController _targetLanguageController;

  @override
  void initState() {
    super.initState();
    _sourceLanguageController = TextEditingController(
      text: widget.state.sourceLanguage,
    );
    _targetLanguageController = TextEditingController(
      text: widget.state.targetLanguage,
    );
    _sourceLanguageController.addListener(_languageSettingsChanged);
    _targetLanguageController.addListener(_languageSettingsChanged);
  }

  @override
  void didUpdateWidget(covariant AiDraftControls oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncControllerText(
      controller: _sourceLanguageController,
      text: widget.state.sourceLanguage,
    );
    _syncControllerText(
      controller: _targetLanguageController,
      text: widget.state.targetLanguage,
    );
  }

  @override
  void dispose() {
    _sourceLanguageController.removeListener(_languageSettingsChanged);
    _targetLanguageController.removeListener(_languageSettingsChanged);
    _sourceLanguageController.dispose();
    _targetLanguageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(l10n.aiDraftControlsTitle, style: AppConst.h2),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextfieldPaddingWrapper(
                height: 48,
                textField: CustomTextfield(
                  controller: _sourceLanguageController,
                  maxLength: 24,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextfieldPaddingWrapper(
                height: 48,
                textField: CustomTextfield(
                  controller: _targetLanguageController,
                  maxLength: 24,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: CustomActionButton(
            buttonText: l10n.aiDraftControlsGenerateTranslationButton,
            onTap: widget.onGenerate,
          ),
        ),
      ],
    );
  }

  void _languageSettingsChanged() {
    context.read<AiWordDraftBloc>().add(
      AiWordDraftEvent.languageSettingsChanged(
        sourceLanguage: _sourceLanguageController.text,
        targetLanguage: _targetLanguageController.text,
      ),
    );
  }

  void _syncControllerText({
    required TextEditingController controller,
    required String text,
  }) {
    if (controller.text == text) {
      return;
    }

    controller.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
