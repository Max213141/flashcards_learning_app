import 'package:bloc_test/bloc_test.dart';
import 'package:flashcards_learning_app/blocs/word_bloc/word_bloc.dart';
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

  blocTest<WordBloc, WordState>(
    'started sets ready state',
    build: () => WordBloc(appDatabase: appDatabase),
    act: (bloc) => bloc.add(WordEvent.started(word: makeWord(id: 1))),
    expect: () => [
      isA<WordState>()
          .having((s) => s.status, 'status', WordStatus.ready)
          .having((s) => s.word?.id, 'word id', 1),
    ],
  );

  blocTest<WordBloc, WordState>(
    'addWord success emits wordAdded',
    build: () {
      when(() => appDatabase.addWord(any())).thenAnswer((_) async => true);
      return WordBloc(appDatabase: appDatabase);
    },
    act: (bloc) => bloc.add(WordEvent.addWord(newWord: makeWord(id: null))),
    expect: () => const [
      WordState(isLoading: true, status: WordStatus.saving),
      WordState(status: WordStatus.wordAdded),
    ],
  );

  blocTest<WordBloc, WordState>(
    'addWord failure emits error',
    build: () {
      when(() => appDatabase.addWord(any())).thenAnswer((_) async => false);
      return WordBloc(appDatabase: appDatabase);
    },
    act: (bloc) => bloc.add(WordEvent.addWord(newWord: makeWord(id: null))),
    expect: () => const [
      WordState(isLoading: true, status: WordStatus.saving),
      WordState(
        status: WordStatus.failure,
        message: 'Не удалось создать слово',
      ),
    ],
  );

  blocTest<WordBloc, WordState>(
    'refreshRequested success updates word and hasChanges',
    build: () {
      when(
        () => appDatabase.getWordById(1),
      ).thenAnswer((_) async => makeWord(id: 1, word: 'new'));
      return WordBloc(appDatabase: appDatabase);
    },
    act: (bloc) => bloc.add(const WordEvent.refreshRequested(wordId: 1)),
    expect: () => [
      const WordState(isLoading: true, status: WordStatus.saving),
      isA<WordState>()
          .having((s) => s.status, 'status', WordStatus.ready)
          .having((s) => s.word?.word, 'word', 'new')
          .having((s) => s.hasChanges, 'hasChanges', true),
    ],
  );

  blocTest<WordBloc, WordState>(
    'refreshRequested null result emits failure',
    build: () {
      when(() => appDatabase.getWordById(1)).thenAnswer((_) async => null);
      return WordBloc(appDatabase: appDatabase);
    },
    act: (bloc) => bloc.add(const WordEvent.refreshRequested(wordId: 1)),
    expect: () => const [
      WordState(isLoading: true, status: WordStatus.saving),
      WordState(
        status: WordStatus.failure,
        message: 'Не удалось обновить слово',
      ),
    ],
  );

  blocTest<WordBloc, WordState>(
    'deleteRequested with explicit id success emits wordDeleted',
    build: () {
      when(() => appDatabase.deleteWordById(5)).thenAnswer((_) async => 1);
      return WordBloc(appDatabase: appDatabase);
    },
    act: (bloc) => bloc.add(const WordEvent.deleteRequested(wordId: 5)),
    expect: () => const [
      WordState(isLoading: true, status: WordStatus.saving),
      WordState(hasChanges: true, status: WordStatus.wordDeleted),
    ],
  );

  blocTest<WordBloc, WordState>(
    'deleteRequested with missing id emits failure',
    build: () => WordBloc(appDatabase: appDatabase),
    act: (bloc) => bloc.add(const WordEvent.deleteRequested()),
    expect: () => const [
      WordState(
        status: WordStatus.failure,
        message: 'Невозможно удалить слово',
      ),
    ],
  );

  blocTest<WordBloc, WordState>(
    'statusConsumed from ready word returns ready',
    build: () => WordBloc(appDatabase: appDatabase),
    seed: () => WordState(word: makeWord(id: 1), status: WordStatus.failure),
    act: (bloc) => bloc.add(const WordEvent.statusConsumed()),
    expect: () => [
      isA<WordState>()
          .having((s) => s.status, 'status', WordStatus.ready)
          .having((s) => s.word?.id, 'word id', 1),
    ],
  );
}
