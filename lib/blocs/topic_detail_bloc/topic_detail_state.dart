part of 'topic_detail_bloc.dart';

@freezed
sealed class TopicDetailState with _$TopicDetailState {
  const factory TopicDetailState({
    @Default(0) int topicId,
    @Default('') String topicName,
    @Default(<Word>[]) List<Word> words,
    @Default(false) bool isLoading,
    @Default(false) bool hasChanges,
    @Default(TopicDetailStatus.initial) TopicDetailStatus status,
    String? message,
  }) = _TopicDetailState;
}

enum TopicDetailStatus { initial, loading, ready, processing, topicDeleted, failure }
