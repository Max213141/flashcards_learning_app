import 'package:bloc_test/bloc_test.dart';
import 'package:flashcards_learning_app/blocs/test_bloc/test_bloc.dart';
import 'package:flashcards_learning_app/common_widgets/flashcards_loader.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/screens/exam_screen/exam_screen.dart';
import 'package:flashcards_learning_app/screens/exam_screen/widgets/exam_screen_body_widget.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTestBloc extends MockBloc<TestEvent, TestState> implements TestBloc {}

void main() {
  late MockTestBloc testBloc;

  const words = [
    Word(id: 1, topicId: 1, word: 'cat', translation: 'кот'),
    Word(id: 2, topicId: 1, word: 'dog', translation: 'пес'),
  ];

  setUpAll(() {
    registerFallbackValue(const TestEvent.started(topicId: 1));
    registerFallbackValue(const TestEvent.statusConsumed());
  });

  setUp(() async {
    testBloc = MockTestBloc();

    when(() => testBloc.state).thenReturn(const TestState.initial());
    whenListen(
      testBloc,
      const Stream<TestState>.empty(),
      initialState: const TestState.initial(),
    );

    await getIt.reset();
    getIt.registerFactory<TestBloc>(() => testBloc);
  });

  tearDown(() async {
    await getIt.reset();
  });

  Future<void> pumpExamScreen(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 2200));
    await tester.pumpWidget(const MaterialApp(home: ExamScreen(topicId: 1)));
  }

  testWidgets('dispatches started event on build', (tester) async {
    await pumpExamScreen(tester);

    verify(() => testBloc.add(const TestEvent.started(topicId: 1))).called(1);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('shows loader for loading state', (tester) async {
    const loadingState = TestState.loading();
    when(() => testBloc.state).thenReturn(loadingState);
    whenListen(
      testBloc,
      Stream.value(loadingState),
      initialState: loadingState,
    );

    await pumpExamScreen(tester);
    await tester.pump();

    expect(find.byType(FlashcardsLoader), findsOneWidget);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('renders exam body for loaded state', (tester) async {
    const loadedState = TestState.loaded(topicId: 1, words: words);
    when(() => testBloc.state).thenReturn(loadedState);
    whenListen(testBloc, Stream.value(loadedState), initialState: loadedState);

    await pumpExamScreen(tester);
    await tester.pump();

    expect(find.text('Exam'), findsOneWidget);
    expect(find.byType(ExamScreenBodyWidget), findsOneWidget);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('failure listener shows snackbar and consumes status', (
    tester,
  ) async {
    const failureState = TestState.failure(
      topicId: 1,
      message: 'Не удалось загрузить слова для практики',
    );
    when(() => testBloc.state).thenReturn(failureState);
    whenListen(
      testBloc,
      Stream.value(failureState),
      initialState: failureState,
    );

    await pumpExamScreen(tester);
    await tester.pump();

    expect(find.text('Failed to load words for the exam'), findsOneWidget);
    verify(() => testBloc.add(const TestEvent.statusConsumed())).called(1);
    await tester.binding.setSurfaceSize(null);
  });
}
