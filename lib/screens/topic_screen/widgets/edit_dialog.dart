import 'package:flashcards_learning_app/blocs/word_editing_bloc/word_editing_bloc.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditWordDialog extends StatelessWidget {
  final Word word;
  final Future<void> Function(Word updatedWord)? onSave;
  const EditWordDialog({super.key, required this.word, this.onSave});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final maxHeight = (media.size.height - media.viewInsets.bottom - 48).clamp(
      280.0,
      media.size.height * 0.95,
    );

    Widget dialogChild = Dialog(
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
              Text(l10nOf(context).editWordDialogTitle, style: AppConst.h1),
              const SizedBox(height: 8),
              Flexible(
                child: EditWordForm(word: word, onSave: onSave),
              ),
            ],
          ),
        ),
      ),
    );

    if (onSave != null) return dialogChild;

    return BlocListener<WordEditingBloc, WordEditingState>(
      listener: (context, state) {
        if (state.status == WordEditingStatus.saveSuccess) {
          Navigator.of(context).pop(true);
          context.read<WordEditingBloc>().add(
            const WordEditingEvent.statusConsumed(),
          );
          return;
        }

        if (state.status == WordEditingStatus.failure &&
            state.message != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message!)));
          context.read<WordEditingBloc>().add(
            const WordEditingEvent.statusConsumed(),
          );
        }
      },
      child: dialogChild,
    );
  }
}
