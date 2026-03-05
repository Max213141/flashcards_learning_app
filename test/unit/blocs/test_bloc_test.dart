import 'package:bloc_test/bloc_test.dart';
import 'package:flashcards_learning_app/blocs/test_bloc/test_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/test_words.dart';
import '../../mocks/mock_app_database.dart';

void main() {
  late MockAppDatabase appDatabase;

  setUp(() {
    appDatabase = MockAppDatabase();
  });

  blocTest<TestBloc, TestState>(
    'started loads words successfully',
    build: () {
      when(
        () => appDatabase.getWordsForTopic(10),
      ).thenAnswer((_) async => [makeWord(id: 1), makeWord(id: 2)]);
      return TestBloc(appDatabase: appDatabase);
    },
    act: (bloc) => bloc.add(const TestEvent.started(topicId: 10)),
    expect: () => [
      const TestState.loading(),
      isA<TestState>()
          .having(
            (s) => s.maybeWhen(loaded: (id, _) => id, orElse: () => -1),
            'topicId',
            10,
          )
          .having(
            (s) => s.maybeWhen(
              loaded: (_, words) => words.length,
              orElse: () => -1,
            ),
            'words',
            2,
          ),
    ],
  );

  blocTest<TestBloc, TestState>(
    'reloadRequested loads words successfully',
    build: () {
      when(
        () => appDatabase.getWordsForTopic(7),
      ).thenAnswer((_) async => [makeWord(id: 3)]);
      return TestBloc(appDatabase: appDatabase);
    },
    act: (bloc) => bloc.add(const TestEvent.reloadRequested(topicId: 7)),
    expect: () => [
      const TestState.loading(),
      isA<TestState>()
          .having(
            (s) => s.maybeWhen(loaded: (id, _) => id, orElse: () => -1),
            'topicId',
            7,
          )
          .having(
            (s) => s.maybeWhen(
              loaded: (_, words) => words.length,
              orElse: () => -1,
            ),
            'words',
            1,
          ),
    ],
  );

  blocTest<TestBloc, TestState>(
    'load failure emits failure state',
    build: () {
      when(() => appDatabase.getWordsForTopic(10)).thenThrow(Exception('db'));
      return TestBloc(appDatabase: appDatabase);
    },
    act: (bloc) => bloc.add(const TestEvent.started(topicId: 10)),
    expect: () => const [
      TestState.loading(),
      TestState.failure(
        topicId: 10,
        message: 'Не удалось загрузить слова для практики',
      ),
    ],
  );

  blocTest<TestBloc, TestState>(
    'statusConsumed from loaded emits no new state',
    build: () => TestBloc(appDatabase: appDatabase),
    seed: () => TestState.loaded(topicId: 10, words: [makeWord(id: 1)]),
    act: (bloc) => bloc.add(const TestEvent.statusConsumed()),
    expect: () => <TestState>[],
  );

  blocTest<TestBloc, TestState>(
    'statusConsumed from non-loaded resets to initial',
    build: () => TestBloc(appDatabase: appDatabase),
    seed: () => const TestState.failure(topicId: 1, message: 'x'),
    act: (bloc) => bloc.add(const TestEvent.statusConsumed()),
    expect: () => const [TestState.initial()],
  );
}
