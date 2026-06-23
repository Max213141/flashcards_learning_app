part of 'ai_word_draft_bloc.dart';

@freezed
sealed class AiWordDraftEvent with _$AiWordDraftEvent {
  const factory AiWordDraftEvent.started() = _Started;
  const factory AiWordDraftEvent.languageSettingsChanged({
    required String sourceLanguage,
    required String targetLanguage,
  }) = _LanguageSettingsChanged;
  const factory AiWordDraftEvent.generateRequested({required String input}) =
      _GenerateRequested;
  const factory AiWordDraftEvent.downloadAccepted() = _DownloadAccepted;
  const factory AiWordDraftEvent.downloadCancelled() = _DownloadCancelled;
  const factory AiWordDraftEvent.statusConsumed() = _StatusConsumed;
}
