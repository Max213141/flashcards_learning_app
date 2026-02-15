import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flutter/material.dart';

class AddWordDialog extends StatelessWidget {
  final Future<void> Function(Word updatedWord)? onSave;
  const AddWordDialog({super.key, this.onSave});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppConst.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: IntrinsicHeight(
          child: Column(
            children: [
              Text('Добавление слова', style: AppConst.h1),
              const SizedBox(height: 8),
              Expanded(child: EditWordForm(onSave: onSave)),
            ],
          ),
        ),
      ),
    );
  }
}
