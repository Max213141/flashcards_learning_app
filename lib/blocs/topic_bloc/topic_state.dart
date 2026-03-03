part of 'topic_bloc.dart';

@freezed
sealed class TopicState with _$TopicState {
  const factory TopicState.initial({
    @Default(TopicSortOption.createdDesc) TopicSortOption selectedSort,
  }) = _Initial;

  const factory TopicState.loading({
    required TopicSortOption selectedSort,
    @Default(<TopicSummary>[]) List<TopicSummary> previousTopics,
  }) = _Loading;

  const factory TopicState.loaded({
    required TopicSortOption selectedSort,
    required List<TopicSummary> topics,
  }) = _Loaded;

  const factory TopicState.error({
    required TopicSortOption selectedSort,
    required String message,
    @Default(<TopicSummary>[]) List<TopicSummary> previousTopics,
  }) = _Error;
}
