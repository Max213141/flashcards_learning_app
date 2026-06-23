import 'package:bloc_test/bloc_test.dart';
import 'package:flashcards_learning_app/blocs/test_bloc/test_bloc.dart';
import 'package:flashcards_learning_app/common_widgets/flashcards_loader.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/screens/test_screen/test_screen.dart';
import 'package:flashcards_learning_app/screens/test_screen/widgets/test_screen_body_widget.dart';
import 'package:flashcards_learning_app/screens/test_screen/widgets/test_screen_view.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTestBloc extends MockBloc<TestEvent, TestState> implements TestBloc {}

void main() {
  final testerBinding = TestWidgetsFlutterBinding.ensureInitialized();
  late MockTestBloc testBloc;

  const sampleWord = Word(
    id: 1,
    topicId: 1,
    word: 'cat',
    translation: 'кот',
    usage: 'A cat sleeps on the sofa.',
  );

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
  });

  tearDown(() async {
    await getIt.reset();
  });

  Future<void> pumpTestScreenView(WidgetTester tester) async {
    await testerBinding.setSurfaceSize(const Size(1200, 2200));
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<TestBloc>.value(
          value: testBloc,
          child: const TestScreenView(topicId: 1, topicColor: Colors.blue),
        ),
      ),
    );
  }

  testWidgets('TestScreen dispatches started event on build', (tester) async {
    await testerBinding.setSurfaceSize(const Size(1200, 2200));
    getIt.registerFactory<TestBloc>(() => testBloc);

    await tester.pumpWidget(
      const MaterialApp(home: TestScreen(topicId: 1, topicColor: Colors.blue)),
    );

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

    await pumpTestScreenView(tester);
    await tester.pump();

    expect(find.byType(FlashcardsLoader), findsOneWidget);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('renders TestScreenBodyWidget for loaded state', (tester) async {
    const loadedState = TestState.loaded(topicId: 1, words: [sampleWord]);
    when(() => testBloc.state).thenReturn(loadedState);
    whenListen(testBloc, Stream.value(loadedState), initialState: loadedState);

    await pumpTestScreenView(tester);
    await tester.pump();

    expect(find.byType(TestScreenBodyWidget), findsOneWidget);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('failure listener shows snack and consumes status', (
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

    await pumpTestScreenView(tester);
    await tester.pump();

    expect(
      find.text('Не удалось загрузить слова для практики'),
      findsOneWidget,
    );
    verify(() => testBloc.add(const TestEvent.statusConsumed())).called(1);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('TestScreenBodyWidget renders progress and usage section', (
    tester,
  ) async {
    await testerBinding.setSurfaceSize(const Size(1200, 2200));
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TestScreenBodyWidget(
            wordList: [sampleWord],
            topicId: 1,
            topicColor: Colors.blue,
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(LinearProgressIndicator), findsOneWidget);
    expect(find.text('Word in use'), findsOneWidget);
    expect(find.text('A cat sleeps on the sofa.'), findsNothing);
    await tester.binding.setSurfaceSize(null);
  });
}
