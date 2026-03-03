part of 'word_editing_bloc.dart';

@freezed
class WordEditingEvent with _$WordEditingEvent {
  const factory WordEditingEvent.started({required Word? word}) = _Started;
  const factory WordEditingEvent.saveRequested({required Word updatedWord}) =
      _SaveRequested;
  const factory WordEditingEvent.toggleLearnedRequested({required Word word}) =
      _ToggleLearnedRequested;
  const factory WordEditingEvent.statusConsumed() = _StatusConsumed;
}
