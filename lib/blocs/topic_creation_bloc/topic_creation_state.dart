part of 'topic_creation_bloc.dart';

@freezed
sealed class TopicCreationState with _$TopicCreationState {
  const factory TopicCreationState({
    @Default('') String name,
    @Default(AppConst.yellowInt) int selectedColorValue,
    @Default(<Word>[]) List<Word> importedWords,
    @Default(<String>[]) List<String> topicSuggestions,
    @Default(false) bool isLoading,
    @Default(TopicCreationStatus.idle) TopicCreationStatus status,
    String? message,
  }) = _TopicCreationState;
}

enum TopicCreationStatus {
  idle,
  importingJson,
  ready,
  creating,
  success,
  failure,
}
