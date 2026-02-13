import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flutter/material.dart';

class EditWordDialog extends StatelessWidget {
  final Word word;
  final Future<void> Function(Word updatedWord)? onSave;
  const EditWordDialog({super.key, required this.word, this.onSave});

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
              Text('Изменение слова', style: AppConst.h1),
              const SizedBox(height: 8),
              Expanded(
                child: EditWordForm(word: word, onSave: onSave),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
