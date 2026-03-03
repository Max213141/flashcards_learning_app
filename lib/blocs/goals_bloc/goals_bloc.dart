import 'dart:async';

import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'goals_event.dart';
part 'goals_state.dart';
part 'goals_bloc.freezed.dart';

typedef WordsProgressStats = ({int totalWords, int learnedWords, int learnedToday});

class GoalsBloc extends Bloc<GoalsEvent, GoalsState> {
  GoalsBloc({required this.appDatabase}) : super(const GoalsState.initial()) {
    on<_Started>(_onStarted);
    on<_GoalsUpdated>(_onGoalsUpdated);
    on<_ProgressUpdated>(_onProgressUpdated);
    on<_SaveRequested>(_onSaveRequested);
    on<_MidnightRefreshTriggered>(_onMidnightRefreshTriggered);
    on<_FailureOccurred>(_onFailureOccurred);
    on<_StatusConsumed>(_onStatusConsumed);
  }

  final AppDatabase appDatabase;
  StreamSubscription<UserGoals?>? _goalsSubscription;
  StreamSubscription<WordsProgressStats>? _progressSubscription;
  Timer? _midnightRefreshTimer;

  Future<void> _onStarted(_Started event, Emitter<GoalsState> emit) async {
    emit(state.copyWith(isLoading: true, status: GoalsStatus.loading, message: null));

    await _goalsSubscription?.cancel();
    _goalsSubscription = appDatabase.watchUserGoals().listen(
      (goals) => add(GoalsEvent.goalsUpdated(goals: goals)),
      onError: (_) => add(
        const GoalsEvent.failureOccurred(
          message: 'Не удалось загрузить цели обучения',
        ),
      ),
    );

    await _subscribeToProgress();
    _scheduleMidnightRefresh();
  }

  void _onGoalsUpdated(_GoalsUpdated event, Emitter<GoalsState> emit) {
    final nextState = state.copyWith(
      currentGoals: event.goals,
      totalGoalInput: event.goals?.overallGoal.toString() ?? '',
      dailyGoalInput: event.goals?.dailyGoal.toString() ?? '',
      isLoading: false,
      message: null,
    );
    emit(nextState.copyWith(status: _baseStatus(nextState)));
  }

  void _onProgressUpdated(_ProgressUpdated event, Emitter<GoalsState> emit) {
    final nextState = state.copyWith(
      progressStats: event.progressStats,
      isLoading: false,
      message: null,
    );
    emit(nextState.copyWith(status: _baseStatus(nextState)));
  }

  Future<void> _onSaveRequested(
    _SaveRequested event,
    Emitter<GoalsState> emit,
  ) async {
    final totalGoal = int.tryParse(event.totalGoal.trim());
    final dailyGoal = int.tryParse(event.dailyGoal.trim());

    if (totalGoal == null || dailyGoal == null) {
      emit(
        state.copyWith(
          status: GoalsStatus.failure,
          message: 'Введите корректные значения целей',
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        totalGoalInput: event.totalGoal,
        dailyGoalInput: event.dailyGoal,
        isSaving: true,
        status: GoalsStatus.saving,
        message: null,
      ),
    );

    try {
      final goals = UserGoals(overallGoal: totalGoal, dailyGoal: dailyGoal);
      await appDatabase.saveUserGoals(goals);
      emit(
        state.copyWith(
          currentGoals: goals,
          totalGoalInput: event.totalGoal,
          dailyGoalInput: event.dailyGoal,
          isSaving: false,
          status: GoalsStatus.saveSuccess,
          message: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isSaving: false,
          status: GoalsStatus.failure,
          message: 'Не удалось сохранить цели обучения',
        ),
      );
    }
  }

  Future<void> _onMidnightRefreshTriggered(
    _MidnightRefreshTriggered event,
    Emitter<GoalsState> emit,
  ) async {
    await _subscribeToProgress();
    _scheduleMidnightRefresh();
  }

  void _onFailureOccurred(_FailureOccurred event, Emitter<GoalsState> emit) {
    emit(
      state.copyWith(
        isLoading: false,
        isSaving: false,
        status: GoalsStatus.failure,
        message: event.message,
      ),
    );
  }

  void _onStatusConsumed(_StatusConsumed event, Emitter<GoalsState> emit) {
    final nextState = state.copyWith(isSaving: false, message: null);
    emit(nextState.copyWith(status: _baseStatus(nextState)));
  }

  Future<void> _subscribeToProgress() async {
    await _progressSubscription?.cancel();
    _progressSubscription = appDatabase.watchWordsProgressStats().listen(
      (stats) => add(GoalsEvent.progressUpdated(progressStats: stats)),
      onError: (_) => add(
        const GoalsEvent.failureOccurred(
          message: 'Не удалось загрузить прогресс обучения',
        ),
      ),
    );
  }

  void _scheduleMidnightRefresh() {
    _midnightRefreshTimer?.cancel();
    final now = DateTime.now();
    final nextMidnight = DateTime(now.year, now.month, now.day + 1);
    final delay = nextMidnight.difference(now);
    _midnightRefreshTimer = Timer(
      delay,
      () => add(const GoalsEvent.midnightRefreshTriggered()),
    );
  }

  GoalsStatus _baseStatus(GoalsState state) {
    if (state.isLoading) return GoalsStatus.loading;
    if (state.currentGoals == null) return GoalsStatus.readyWithoutGoals;
    return GoalsStatus.readyWithGoals;
  }

  @override
  Future<void> close() async {
    _midnightRefreshTimer?.cancel();
    await _goalsSubscription?.cancel();
    await _progressSubscription?.cancel();
    return super.close();
  }
}
