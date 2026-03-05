import 'package:bloc_test/bloc_test.dart';
import 'package:flashcards_learning_app/blocs/word_editing_bloc/word_editing_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/test_words.dart';
import '../../mocks/mock_app_database.dart';

void main() {
  late MockAppDatabase appDatabase;

  setUpAll(() {
    registerFallbackValue(makeWord());
  });

  setUp(() {
    appDatabase = MockAppDatabase();
  });

  blocTest<WordEditingBloc, WordEditingState>(
    'started sets ready state',
    build: () => WordEditingBloc(appDatabase: appDatabase),
    act: (bloc) => bloc.add(WordEditingEvent.started(word: makeWord(id: 1))),
    expect: () => [
      isA<WordEditingState>()
          .having((s) => s.status, 'status', WordEditingStatus.ready)
          .having((s) => s.word?.id, 'word id', 1),
    ],
  );

  blocTest<WordEditingBloc, WordEditingState>(
    'saveRequested success emits saveSuccess',
    build: () {
      when(() => appDatabase.updateWord(any())).thenAnswer((_) async => true);
      return WordEditingBloc(appDatabase: appDatabase);
    },
    seed: () => WordEditingState(
      word: makeWord(id: 1),
      status: WordEditingStatus.ready,
    ),
    act: (bloc) => bloc.add(
      WordEditingEvent.saveRequested(
        updatedWord: makeWord(id: 1, word: 'updated'),
      ),
    ),
    expect: () => [
      isA<WordEditingState>()
          .having((s) => s.isSaving, 'isSaving', true)
          .having((s) => s.status, 'status', WordEditingStatus.ready),
      isA<WordEditingState>()
          .having((s) => s.status, 'status', WordEditingStatus.saveSuccess)
          .having((s) => s.word?.word, 'word', 'updated'),
    ],
  );

  blocTest<WordEditingBloc, WordEditingState>(
    'saveRequested failure emits error',
    build: () {
      when(() => appDatabase.updateWord(any())).thenAnswer((_) async => false);
      return WordEditingBloc(appDatabase: appDatabase);
    },
    act: (bloc) =>
        bloc.add(WordEditingEvent.saveRequested(updatedWord: makeWord(id: 1))),
    expect: () => const [
      WordEditingState(isSaving: true, status: WordEditingStatus.ready),
      WordEditingState(
        status: WordEditingStatus.failure,
        message: 'Не удалось сохранить изменения',
      ),
    ],
  );

  blocTest<WordEditingBloc, WordEditingState>(
    'toggleLearnedRequested to true sets learnedAt',
    build: () {
      when(() => appDatabase.updateWord(any())).thenAnswer((_) async => true);
      return WordEditingBloc(appDatabase: appDatabase);
    },
    act: (bloc) => bloc.add(
      WordEditingEvent.toggleLearnedRequested(
        word: makeWord(id: 1, learned: false),
      ),
    ),
    expect: () => [
      const WordEditingState(isSaving: true, status: WordEditingStatus.ready),
      isA<WordEditingState>()
          .having((s) => s.status, 'status', WordEditingStatus.wordUpdated)
          .having((s) => s.word?.learned, 'learned', true)
          .having((s) => s.word?.learnedAt != null, 'learnedAt', true),
    ],
  );

  blocTest<WordEditingBloc, WordEditingState>(
    'toggleLearnedRequested to false clears learnedAt',
    build: () {
      when(() => appDatabase.updateWord(any())).thenAnswer((_) async => true);
      return WordEditingBloc(appDatabase: appDatabase);
    },
    act: (bloc) => bloc.add(
      WordEditingEvent.toggleLearnedRequested(
        word: makeWord(id: 1, learned: true, learnedAt: DateTime(2025, 1, 1)),
      ),
    ),
    expect: () => [
      const WordEditingState(isSaving: true, status: WordEditingStatus.ready),
      isA<WordEditingState>()
          .having((s) => s.status, 'status', WordEditingStatus.wordUpdated)
          .having((s) => s.word?.learned, 'learned', false)
          .having((s) => s.word?.learnedAt, 'learnedAt', isNull),
    ],
  );

  blocTest<WordEditingBloc, WordEditingState>(
    'toggleLearnedRequested with null id emits failure',
    build: () => WordEditingBloc(appDatabase: appDatabase),
    act: (bloc) => bloc.add(
      WordEditingEvent.toggleLearnedRequested(word: makeWord(id: null)),
    ),
    expect: () => const [
      WordEditingState(
        status: WordEditingStatus.failure,
        message: 'Не удалось обновить статус слова',
      ),
    ],
  );

  blocTest<WordEditingBloc, WordEditingState>(
    'statusConsumed returns ready when word exists',
    build: () => WordEditingBloc(appDatabase: appDatabase),
    seed: () => WordEditingState(
      word: makeWord(id: 1),
      status: WordEditingStatus.failure,
      message: 'x',
      isSaving: true,
    ),
    act: (bloc) => bloc.add(const WordEditingEvent.statusConsumed()),
    expect: () => [
      isA<WordEditingState>()
          .having((s) => s.status, 'status', WordEditingStatus.ready)
          .having((s) => s.word?.id, 'word id', 1),
    ],
  );
}
