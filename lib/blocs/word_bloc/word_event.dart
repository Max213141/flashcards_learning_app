part of 'word_bloc.dart';

@freezed
class WordEvent with _$WordEvent {
  const factory WordEvent.started({required Word word}) = _Started;

  const factory WordEvent.addWord({required Word newWord}) = _AddWord;
  const factory WordEvent.refreshRequested({required int wordId}) =
      _RefreshRequested;
  const factory WordEvent.deleteRequested({int? wordId}) = _DeleteRequested;
  const factory WordEvent.statusConsumed() = _StatusConsumed;
}
