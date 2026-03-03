part of 'test_bloc.dart';

@freezed
class TestEvent with _$TestEvent {
  const factory TestEvent.started({required int topicId}) = _Started;
  const factory TestEvent.reloadRequested({required int topicId}) = _ReloadRequested;
  const factory TestEvent.statusConsumed() = _StatusConsumed;
}
