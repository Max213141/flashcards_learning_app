import 'package:flashcards_learning_app/blocs/word_editing_bloc/word_editing_bloc.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditWordScreenView extends StatelessWidget {
  const EditWordScreenView({super.key, required this.word});

  final Word? word;

  @override
  Widget build(BuildContext context) {
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
      child: Scaffold(
        backgroundColor: AppConst.background,
        appBar: AppBar(
          title: Text(l10nOf(context).editWordScreenTitle, style: AppConst.h1),
          backgroundColor: AppConst.background,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: EditWordForm(word: word, pinSaveButtonToBottom: true),
        ),
      ),
    );
  }
}
