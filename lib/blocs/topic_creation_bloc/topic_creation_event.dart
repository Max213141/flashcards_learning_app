part of 'topic_creation_bloc.dart';

@freezed
class TopicCreationEvent with _$TopicCreationEvent {
  const factory TopicCreationEvent.nameChanged({required String name}) =
      _NameChanged;

  const factory TopicCreationEvent.colorChanged({required int colorValue}) =
      _ColorChanged;

  const factory TopicCreationEvent.topicSuggestionSelected({
    required String name,
  }) = _TopicSuggestionSelected;

  const factory TopicCreationEvent.jsonImportRequested() = _JsonImportRequested;

  const factory TopicCreationEvent.createSubmitted() = _CreateSubmitted;

  const factory TopicCreationEvent.statusConsumed() = _StatusConsumed;

  const factory TopicCreationEvent.resetRequested() = _ResetRequested;
}
