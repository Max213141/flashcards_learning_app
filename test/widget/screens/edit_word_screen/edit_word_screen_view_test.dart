import 'package:bloc_test/bloc_test.dart';
import 'package:flashcards_learning_app/blocs/word_editing_bloc/word_editing_bloc.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/screens/edit_word_screen/edit_word_screen.dart';
import 'package:flashcards_learning_app/screens/edit_word_screen/widgets/edit_word_view.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWordEditingBloc extends MockBloc<WordEditingEvent, WordEditingState>
    implements WordEditingBloc {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route<dynamic> {}

void main() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  late MockWordEditingBloc wordEditingBloc;
  late MockNavigatorObserver navigatorObserver;

  const sampleWord = Word(
    id: 1,
    topicId: 10,
    word: 'cat',
    translation: 'кот',
    topic: 'Animals',
  );

  setUpAll(() {
    registerFallbackValue(WordEditingEvent.started(word: sampleWord));
    registerFallbackValue(
      WordEditingEvent.saveRequested(updatedWord: sampleWord),
    );
    registerFallbackValue(
      WordEditingEvent.toggleLearnedRequested(word: sampleWord),
    );
    registerFallbackValue(const WordEditingEvent.statusConsumed());
    registerFallbackValue(FakeRoute());
  });

  setUp(() async {
    wordEditingBloc = MockWordEditingBloc();
    navigatorObserver = MockNavigatorObserver();

    const readyState = WordEditingState(
      word: sampleWord,
      status: WordEditingStatus.ready,
    );
    when(() => wordEditingBloc.state).thenReturn(readyState);
    whenListen(
      wordEditingBloc,
      const Stream<WordEditingState>.empty(),
      initialState: readyState,
    );

    await getIt.reset();
  });

  tearDown(() async {
    await getIt.reset();
  });

  Future<void> pumpEditWordViewRoute(WidgetTester tester) async {
    await binding.setSurfaceSize(const Size(1200, 2200));

    await tester.pumpWidget(
      MaterialApp(
        navigatorObservers: [navigatorObserver],
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => BlocProvider<WordEditingBloc>.value(
                          value: wordEditingBloc,
                          child: const EditWordScreenView(word: sampleWord),
                        ),
                      ),
                    );
                  },
                  child: const Text('Open'),
                ),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
  }

  testWidgets('EditWordScreen dispatches started event on build', (
    tester,
  ) async {
    await binding.setSurfaceSize(const Size(1200, 2200));
    getIt.registerFactory<WordEditingBloc>(() => wordEditingBloc);

    await tester.pumpWidget(
      const MaterialApp(home: EditWordScreen(word: sampleWord)),
    );

    verify(
      () => wordEditingBloc.add(WordEditingEvent.started(word: sampleWord)),
    ).called(1);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('EditWordScreenView renders title and form save button', (
    tester,
  ) async {
    await binding.setSurfaceSize(const Size(1200, 2200));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WordEditingBloc>.value(
          value: wordEditingBloc,
          child: const EditWordScreenView(word: sampleWord),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Edit word'), findsOneWidget);
    expect(find.text('Save'), findsOneWidget);
    expect(find.text('Word to learn'), findsOneWidget);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('saveSuccess pops route and dispatches statusConsumed', (
    tester,
  ) async {
    const saveSuccessState = WordEditingState(
      word: sampleWord,
      status: WordEditingStatus.saveSuccess,
    );

    whenListen(
      wordEditingBloc,
      Stream.value(saveSuccessState),
      initialState: const WordEditingState(
        word: sampleWord,
        status: WordEditingStatus.ready,
      ),
    );

    await pumpEditWordViewRoute(tester);
    await tester.pumpAndSettle();

    verify(
      () => wordEditingBloc.add(const WordEditingEvent.statusConsumed()),
    ).called(1);
    verify(
      () => navigatorObserver.didPop(any(), any()),
    ).called(greaterThanOrEqualTo(1));
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('failure shows snackbar and dispatches statusConsumed', (
    tester,
  ) async {
    const failureState = WordEditingState(
      word: sampleWord,
      status: WordEditingStatus.failure,
      message: 'Не удалось сохранить изменения',
    );

    whenListen(
      wordEditingBloc,
      Stream.value(failureState),
      initialState: const WordEditingState(
        word: sampleWord,
        status: WordEditingStatus.ready,
      ),
    );

    await binding.setSurfaceSize(const Size(1200, 2200));
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<WordEditingBloc>.value(
            value: wordEditingBloc,
            child: const EditWordScreenView(word: sampleWord),
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Не удалось сохранить изменения'), findsOneWidget);
    verify(
      () => wordEditingBloc.add(const WordEditingEvent.statusConsumed()),
    ).called(1);
    await tester.binding.setSurfaceSize(null);
  });
}
