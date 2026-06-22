import 'package:flashcards_learning_app/blocs/blocs.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';

class AiDraftControls extends StatelessWidget {
  final TextEditingController sourceLanguageController;
  final TextEditingController targetLanguageController;
  final AiWordDraftState state;
  final VoidCallback onGenerate;
  final VoidCallback onCancel;

  const AiDraftControls({
    super.key,
    required this.sourceLanguageController,
    required this.targetLanguageController,
    required this.state,
    required this.onGenerate,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text('AI черновик', style: AppConst.h2),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextfieldPaddingWrapper(
                height: 48,
                textField: CustomTextfield(
                  controller: sourceLanguageController,
                  maxLength: 24,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextfieldPaddingWrapper(
                height: 48,
                textField: CustomTextfield(
                  controller: targetLanguageController,
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
            buttonText: 'Сгенерировать перевод',
            onTap: onGenerate,
          ),
        ),
      ],
    );
  }
}
