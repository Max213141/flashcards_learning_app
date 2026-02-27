import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flutter/material.dart';

class EditWordDialog extends StatelessWidget {
  final Word word;
  final Future<void> Function(Word updatedWord)? onSave;
  const EditWordDialog({super.key, required this.word, this.onSave});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final maxHeight =
        (media.size.height - media.viewInsets.bottom - 48).clamp(
              280.0,
              media.size.height * 0.95,
            );

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      backgroundColor: AppConst.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight, maxWidth: 520),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Изменение слова', style: AppConst.h1),
              const SizedBox(height: 8),
              Flexible(child: EditWordForm(word: word, onSave: onSave)),
            ],
          ),
        ),
      ),
    );
  }
}
