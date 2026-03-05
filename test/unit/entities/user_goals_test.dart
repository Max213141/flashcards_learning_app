import 'package:flashcards_learning_app/entities/user_goals.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('constructs with expected values', () {
    const goals = UserGoals(overallGoal: 100, dailyGoal: 15);

    expect(goals.overallGoal, 100);
    expect(goals.dailyGoal, 15);
  });
}
