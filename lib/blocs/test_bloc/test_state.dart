part of 'test_bloc.dart';

@freezed
sealed class TestState with _$TestState {
  const factory TestState.initial() = _Initial;

  const factory TestState.loading() = _Loading;

  const factory TestState.loaded({
    required int topicId,
    required List<Word> words,
  }) = _Loaded;

  const factory TestState.failure({
    required int topicId,
    required String message,
  }) = _Failure;
}
