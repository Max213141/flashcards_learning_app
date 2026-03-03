part of 'goals_bloc.dart';

@freezed
class GoalsEvent with _$GoalsEvent {
  const factory GoalsEvent.started() = _Started;
  const factory GoalsEvent.goalsUpdated({required UserGoals? goals}) =
      _GoalsUpdated;
  const factory GoalsEvent.progressUpdated({
    required WordsProgressStats progressStats,
  }) = _ProgressUpdated;
  const factory GoalsEvent.saveRequested({
    required String totalGoal,
    required String dailyGoal,
  }) = _SaveRequested;
  const factory GoalsEvent.midnightRefreshTriggered() = _MidnightRefreshTriggered;
  const factory GoalsEvent.failureOccurred({required String message}) =
      _FailureOccurred;
  const factory GoalsEvent.statusConsumed() = _StatusConsumed;
}
