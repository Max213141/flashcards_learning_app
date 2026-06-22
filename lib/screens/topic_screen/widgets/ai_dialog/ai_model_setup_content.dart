import 'package:flashcards_learning_app/blocs/blocs.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/core/local_ai_model_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiModelSetupContent extends StatelessWidget {
  final AiWordDraftState state;

  const AiModelSetupContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final downloading = state.setupStatus == AiSetupStatus.downloading;
    final checking =
        state.setupStatus == AiSetupStatus.initial ||
        state.setupStatus == AiSetupStatus.checking;
    final failure = state.setupStatus == AiSetupStatus.failure;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (checking) ...[
            const SizedBox(height: 24),
            const Center(child: FlashcardsLoader()),
            const SizedBox(height: 24),
            Center(
              child: Text(
                'Проверяем локальную модель',
                style: AppConst.additionalText,
              ),
            ),
          ] else ...[
            Text('Нужна локальная модель', style: AppConst.h2),
            const SizedBox(height: 12),
            Text(
              '${LocalAiModelConfig.displayName} (~${LocalAiModelConfig.approximateSize}) будет скачана на устройство. После этого AI ассистент будет работать локально на устройстве',
              style: AppConst.text,
            ),
            if (failure && state.message != null) ...[
              const SizedBox(height: 12),
              Text(state.message!, style: AppConst.additionalText),
            ],
            if (downloading) ...[
              const SizedBox(height: 20),
              LinearProgressIndicator(value: state.downloadProgress / 100),
              const SizedBox(height: 8),
              Text(
                '${LocalAiModelConfig.displayName}: ${state.downloadProgress}%',
                style: AppConst.additionalText,
              ),
            ],
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CustomActionButton(
                    buttonText: downloading
                        ? 'Скачивание...'
                        : failure
                        ? 'Повторить'
                        : 'Скачать',
                    onTap: downloading
                        ? null
                        : () => context.read<AiWordDraftBloc>().add(
                            const AiWordDraftEvent.downloadAccepted(),
                          ),
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    if (downloading) {
                      context.read<AiWordDraftBloc>().add(
                        const AiWordDraftEvent.downloadCancelled(),
                      );
                      return;
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    downloading ? 'Отмена' : 'Не сейчас',
                    style: AppConst.text,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
