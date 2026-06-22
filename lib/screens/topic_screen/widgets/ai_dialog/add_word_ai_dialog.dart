import 'package:flashcards_learning_app/blocs/blocs.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flashcards_learning_app/screens/topic_screen/widgets/ai_dialog/widgets.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddWordAIDialog extends StatelessWidget {
  final Future<void> Function(Word updatedWord)? onSave;
  const AddWordAIDialog({super.key, this.onSave});

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
              Text('ИИ ассистент', style: AppConst.h1),
              const SizedBox(height: 8),
              Flexible(
                child: BlocProvider(
                  create: (_) =>
                      getIt<AiWordDraftBloc>()
                        ..add(const AiWordDraftEvent.started()),
                  child: _AddWordAiDialogContent(onSave: onSave),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddWordAiDialogContent extends StatelessWidget {
  final Future<void> Function(Word updatedWord)? onSave;

  const _AddWordAiDialogContent({this.onSave});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AiWordDraftBloc, AiWordDraftState>(
      builder: (context, state) {
        if (_shouldShowForm(state)) {
          return AiWordForm(onSave: onSave);
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: AiModelSetupContent(state: state),
        );
      },
    );
  }

  bool _shouldShowForm(AiWordDraftState state) {
    return switch (state.setupStatus) {
      AiSetupStatus.installed ||
      AiSetupStatus.loadingModel ||
      AiSetupStatus.ready => true,
      AiSetupStatus.checking ||
      AiSetupStatus.failure => state.pendingInput != null,
      AiSetupStatus.initial ||
      AiSetupStatus.notInstalled ||
      AiSetupStatus.downloadConfirmationRequired ||
      AiSetupStatus.downloading ||
      AiSetupStatus.cancelled => false,
    };
  }
}
