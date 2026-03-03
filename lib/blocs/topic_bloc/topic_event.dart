part of 'topic_bloc.dart';

@freezed
class TopicEvent with _$TopicEvent {
  const factory TopicEvent.started() = _Started;
  const factory TopicEvent.sortChanged({required TopicSortOption sortOption}) =
      _SortChanged;
  const factory TopicEvent.refreshRequested() = _RefreshRequested;
  const factory TopicEvent.topicsUpdated({
    required TopicSortOption selectedSort,
    required List<TopicSummary> topics,
  }) = _TopicsUpdated;
  const factory TopicEvent.subscriptionFailed({
    required TopicSortOption selectedSort,
    required String message,
  }) = _SubscriptionFailed;
}
