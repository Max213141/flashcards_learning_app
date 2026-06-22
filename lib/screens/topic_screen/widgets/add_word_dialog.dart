import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flutter/material.dart';

class AddWordDialog extends StatelessWidget {
  final Future<void> Function(Word updatedWord)? onSave;
  const AddWordDialog({super.key, this.onSave});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final maxHeight = (media.size.height - media.viewInsets.bottom - 48).clamp(
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
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Добавление слова', style: AppConst.h1),
              const SizedBox(height: 8),
              Flexible(child: EditWordForm(onSave: onSave)),
            ],
          ),
        ),
      ),
    );
  }
}
