part of 'ai_word_draft_bloc.dart';

@freezed
sealed class AiWordDraftState with _$AiWordDraftState {
  const factory AiWordDraftState({
    @Default(AiSetupStatus.initial) AiSetupStatus setupStatus,
    @Default(AiGenerationStatus.idle) AiGenerationStatus generationStatus,
    @Default(0) int downloadProgress,
    AiWordDraft? draft,
    String? message,
    String? pendingInput,
    String? pendingSourceLanguage,
    String? pendingTargetLanguage,
  }) = _AiWordDraftState;
}

enum AiSetupStatus {
  initial,
  checking,
  notInstalled,
  downloadConfirmationRequired,
  downloading,
  installed,
  loadingModel,
  ready,
  failure,
  cancelled,
}

enum AiGenerationStatus { idle, generating, success, failure }
