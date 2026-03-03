part of 'word_bloc.dart';

@freezed
sealed class WordState with _$WordState {
  const factory WordState({
    Word? word,
    @Default(false) bool isLoading,
    @Default(false) bool hasChanges,
    @Default(WordStatus.initial) WordStatus status,
    String? message,
  }) = _WordState;
}

enum WordStatus { initial, ready, saving, wordAdded, wordDeleted, failure }
