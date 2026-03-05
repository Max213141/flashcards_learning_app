import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flashcards_learning_app/blocs/goals_bloc/goals_bloc.dart';
import 'package:flashcards_learning_app/entities/user_goals.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/stream_controller_helpers.dart';
import '../../helpers/test_words.dart';
import '../../mocks/mock_app_database.dart';

void main() {
  late MockAppDatabase appDatabase;
  late StreamController<UserGoals?> goalsController;
  late StreamController<({int totalWords, int learnedWords, int learnedToday})>
  progressController;

  setUpAll(() {
    registerFallbackValue(const UserGoals(overallGoal: 1, dailyGoal: 1));
  });

  setUp(() {
    appDatabase = MockAppDatabase();
    goalsController = StreamController<UserGoals?>.broadcast();
    progressController =
        StreamController<
          ({int totalWords, int learnedWords, int learnedToday})
        >.broadcast();

    when(
      () => appDatabase.watchUserGoals(),
    ).thenAnswer((_) => goalsController.stream);
    when(
      () => appDatabase.watchWordsProgressStats(),
    ).thenAnswer((_) => progressController.stream);
    when(() => appDatabase.saveUserGoals(any())).thenAnswer((_) async {});
  });

  tearDown(() async {
    await closeControllers([goalsController, progressController]);
  });

  blocTest<GoalsBloc, GoalsState>(
    'started wires streams and reacts to updates',
    build: () => GoalsBloc(appDatabase: appDatabase),
    act: (bloc) async {
      bloc.add(const GoalsEvent.started());
      await Future<void>.delayed(Duration.zero);
      goalsController.add(makeUserGoals(overallGoal: 20, dailyGoal: 5));
      progressController.add((
        totalWords: 10,
        learnedWords: 3,
        learnedToday: 2,
      ));
    },
    expect: () => [
      const GoalsState.initial(isLoading: true, status: GoalsStatus.loading),
      isA<GoalsState>()
          .having((s) => s.status, 'status', GoalsStatus.readyWithGoals)
          .having((s) => s.currentGoals?.overallGoal, 'overall goal', 20)
          .having((s) => s.dailyGoalInput, 'daily input', '5'),
      isA<GoalsState>()
          .having((s) => s.status, 'status', GoalsStatus.readyWithGoals)
          .having((s) => s.progressStats?.learnedToday, 'learned today', 2),
    ],
  );

  blocTest<GoalsBloc, GoalsState>(
    'saveRequested with invalid inputs emits failure',
    build: () => GoalsBloc(appDatabase: appDatabase),
    act: (bloc) => bloc.add(
      const GoalsEvent.saveRequested(totalGoal: 'abc', dailyGoal: '2'),
    ),
    expect: () => const [
      GoalsState.initial(
        status: GoalsStatus.failure,
        message: 'Введите корректные значения целей',
      ),
    ],
  );

  blocTest<GoalsBloc, GoalsState>(
    'saveRequested with valid values emits saveSuccess',
    build: () => GoalsBloc(appDatabase: appDatabase),
    act: (bloc) => bloc.add(
      const GoalsEvent.saveRequested(totalGoal: '100', dailyGoal: '10'),
    ),
    expect: () => [
      GoalsState.initial(
        totalGoalInput: '100',
        dailyGoalInput: '10',
        isSaving: true,
        status: GoalsStatus.saving,
      ),
      isA<GoalsState>()
          .having((s) => s.status, 'status', GoalsStatus.saveSuccess)
          .having((s) => s.currentGoals?.overallGoal, 'overallGoal', 100)
          .having((s) => s.currentGoals?.dailyGoal, 'dailyGoal', 10),
    ],
  );

  blocTest<GoalsBloc, GoalsState>(
    'saveRequested DB error emits failure',
    build: () {
      when(() => appDatabase.saveUserGoals(any())).thenThrow(Exception('db'));
      return GoalsBloc(appDatabase: appDatabase);
    },
    act: (bloc) => bloc.add(
      const GoalsEvent.saveRequested(totalGoal: '100', dailyGoal: '10'),
    ),
    expect: () => const [
      GoalsState.initial(
        totalGoalInput: '100',
        dailyGoalInput: '10',
        isSaving: true,
        status: GoalsStatus.saving,
      ),
      GoalsState.initial(
        totalGoalInput: '100',
        dailyGoalInput: '10',
        status: GoalsStatus.failure,
        message: 'Не удалось сохранить цели обучения',
      ),
    ],
  );

  blocTest<GoalsBloc, GoalsState>(
    'statusConsumed clears message and returns base ready status',
    build: () => GoalsBloc(appDatabase: appDatabase),
    seed: () => const GoalsState.initial(
      currentGoals: UserGoals(overallGoal: 100, dailyGoal: 10),
      status: GoalsStatus.saveSuccess,
      message: 'ok',
      isSaving: true,
    ),
    act: (bloc) => bloc.add(const GoalsEvent.statusConsumed()),
    expect: () => const [
      GoalsState.initial(
        currentGoals: UserGoals(overallGoal: 100, dailyGoal: 10),
        status: GoalsStatus.readyWithGoals,
      ),
    ],
  );

  test('midnightRefreshTriggered subscribes to progress stream', () async {
    final bloc = GoalsBloc(appDatabase: appDatabase);
    bloc.add(const GoalsEvent.midnightRefreshTriggered());
    await Future<void>.delayed(Duration.zero);

    verify(() => appDatabase.watchWordsProgressStats()).called(1);
    await bloc.close();
  });
}
