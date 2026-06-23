import 'package:bloc_test/bloc_test.dart';
import 'package:flashcards_learning_app/blocs/goals_bloc/goals_bloc.dart';
import 'package:flashcards_learning_app/common_widgets/flashcards_loader.dart';
import 'package:flashcards_learning_app/common_widgets/pop_up_box.dart';
import 'package:flashcards_learning_app/entities/user_goals.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/app_bar_customized_widget.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/goals_dialog_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGoalsBloc extends MockBloc<GoalsEvent, GoalsState>
    implements GoalsBloc {}

void main() {
  late MockGoalsBloc goalsBloc;

  setUpAll(() {
    registerFallbackValue(const GoalsEvent.started());
  });

  setUp(() {
    goalsBloc = MockGoalsBloc();
    when(() => goalsBloc.state).thenReturn(const GoalsState.initial());
    whenListen(
      goalsBloc,
      const Stream<GoalsState>.empty(),
      initialState: const GoalsState.initial(),
    );
  });

  Future<void> pumpWidgetUnderTest(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<GoalsBloc>.value(
            value: goalsBloc,
            child: const AppBarCustomizedWidget(),
          ),
        ),
      ),
    );
  }

  testWidgets('shows loader when goals state is loading and has no data', (
    tester,
  ) async {
    const loadingState = GoalsState.initial(
      isLoading: true,
      status: GoalsStatus.loading,
    );
    when(() => goalsBloc.state).thenReturn(loadingState);
    whenListen(
      goalsBloc,
      Stream.value(loadingState),
      initialState: loadingState,
    );

    await pumpWidgetUnderTest(tester);
    await tester.pump();

    expect(find.byType(FlashcardsLoader), findsOneWidget);
  });

  testWidgets('renders call to set goals when current goals are missing', (
    tester,
  ) async {
    const stateWithoutGoals = GoalsState.initial(
      status: GoalsStatus.readyWithoutGoals,
    );
    when(() => goalsBloc.state).thenReturn(stateWithoutGoals);
    whenListen(
      goalsBloc,
      Stream.value(stateWithoutGoals),
      initialState: stateWithoutGoals,
    );

    await pumpWidgetUnderTest(tester);
    await tester.pump();

    expect(find.text('Set your goals!'), findsOneWidget);
    expect(find.text('Daily \ngoal'), findsNothing);
  });

  testWidgets('renders overall and daily progress when goals exist', (
    tester,
  ) async {
    const stateWithGoals = GoalsState.initial(
      currentGoals: UserGoals(overallGoal: 100, dailyGoal: 10),
      progressStats: (totalWords: 40, learnedWords: 25, learnedToday: 3),
      status: GoalsStatus.readyWithGoals,
    );
    when(() => goalsBloc.state).thenReturn(stateWithGoals);
    whenListen(
      goalsBloc,
      Stream.value(stateWithGoals),
      initialState: stateWithGoals,
    );

    await pumpWidgetUnderTest(tester);
    await tester.pump();

    expect(find.text('Overall \nprogress'), findsOneWidget);
    expect(find.text('Daily \ngoal'), findsOneWidget);
    expect(find.text('25%'), findsOneWidget);
    expect(find.text('Set your goals!'), findsNothing);
  });

  testWidgets('tap opens goals dialog popup', (tester) async {
    const stateWithGoals = GoalsState.initial(
      currentGoals: UserGoals(overallGoal: 50, dailyGoal: 5),
      progressStats: (totalWords: 10, learnedWords: 5, learnedToday: 1),
      status: GoalsStatus.readyWithGoals,
    );
    when(() => goalsBloc.state).thenReturn(stateWithGoals);
    whenListen(
      goalsBloc,
      Stream.value(stateWithGoals),
      initialState: stateWithGoals,
    );

    await pumpWidgetUnderTest(tester);
    await tester.pump();

    await tester.tap(find.byType(AppBarCustomizedWidget));
    await tester.pumpAndSettle();

    expect(find.byType(PopUpBox), findsOneWidget);
    expect(find.byType(GoalsDialogBodyWidget), findsOneWidget);
    expect(find.text('Learning goals'), findsOneWidget);
  });
}
