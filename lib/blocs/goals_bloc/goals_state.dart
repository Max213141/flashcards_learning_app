part of 'goals_bloc.dart';

@freezed
sealed class GoalsState with _$GoalsState {
  const factory GoalsState.initial({
    UserGoals? currentGoals,
    WordsProgressStats? progressStats,
    @Default('') String totalGoalInput,
    @Default('') String dailyGoalInput,
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default(GoalsStatus.initial) GoalsStatus status,
    String? message,
  }) = _Initial;
}

enum GoalsStatus {
  initial,
  loading,
  readyWithoutGoals,
  readyWithGoals,
  saving,
  saveSuccess,
  failure,
}
