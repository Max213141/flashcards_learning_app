part of 'topic_detail_bloc.dart';

@freezed
class TopicDetailEvent with _$TopicDetailEvent {
  const factory TopicDetailEvent.started({
    required int topicId,
    required String topicName,
  }) = _Started;
  const factory TopicDetailEvent.reloadRequested() = _ReloadRequested;
  const factory TopicDetailEvent.addWordRequested({required Word newWord}) =
      _AddWordRequested;
  const factory TopicDetailEvent.importWordsRequested() = _ImportWordsRequested;
  const factory TopicDetailEvent.deleteTopicRequested() = _DeleteTopicRequested;
  const factory TopicDetailEvent.statusConsumed() = _StatusConsumed;
}
