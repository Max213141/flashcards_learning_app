part of 'word_editing_bloc.dart';

@freezed
sealed class WordEditingState with _$WordEditingState {
  const factory WordEditingState({
    Word? word,
    @Default(false) bool isSaving,
    @Default(WordEditingStatus.initial) WordEditingStatus status,
    String? message,
  }) = _WordEditingState;
}

enum WordEditingStatus { initial, ready, saveSuccess, wordUpdated, failure }
