import 'package:bloc_test/bloc_test.dart';
import 'package:flashcards_learning_app/blocs/word_bloc/word_bloc.dart';
import 'package:flashcards_learning_app/blocs/word_editing_bloc/word_editing_bloc.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/screens/word_definition_screen/widgets/word_definition_screen_body.dart';
import 'package:flashcards_learning_app/screens/word_definition_screen/widgets/word_definition_screen_view.dart';
import 'package:flashcards_learning_app/screens/word_definition_screen/word_definition_screen.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWordBloc extends MockBloc<WordEvent, WordState> implements WordBloc {}

class MockWordEditingBloc extends MockBloc<WordEditingEvent, WordEditingState>
    implements WordEditingBloc {}

void main() {
  late MockWordBloc wordBloc;
  late MockWordEditingBloc wordEditingBloc;

  const sampleWord = Word(
    id: 1,
    topicId: 10,
    word: 'cat',
    translation: 'кот',
    topic: 'Animals',
    transcription: '[kæt]',
    learned: false,
  );

  setUpAll(() {
    registerFallbackValue(WordEvent.started(word: sampleWord));
    registerFallbackValue(WordEvent.refreshRequested(wordId: 1));
    registerFallbackValue(const WordEvent.statusConsumed());
    registerFallbackValue(WordEditingEvent.started(word: sampleWord));
    registerFallbackValue(
      WordEditingEvent.toggleLearnedRequested(word: sampleWord),
    );
    registerFallbackValue(const WordEditingEvent.statusConsumed());
  });

  setUp(() async {
    wordBloc = MockWordBloc();
    wordEditingBloc = MockWordEditingBloc();

    when(
      () => wordBloc.state,
    ).thenReturn(const WordState(word: sampleWord, status: WordStatus.ready));
    whenListen(
      wordBloc,
      const Stream<WordState>.empty(),
      initialState: const WordState(word: sampleWord, status: WordStatus.ready),
    );

    when(() => wordEditingBloc.state).thenReturn(
      const WordEditingState(word: sampleWord, status: WordEditingStatus.ready),
    );
    whenListen(
      wordEditingBloc,
      const Stream<WordEditingState>.empty(),
      initialState: const WordEditingState(
        word: sampleWord,
        status: WordEditingStatus.ready,
      ),
    );

    await getIt.reset();
  });

  tearDown(() async {
    await getIt.reset();
  });

  Future<void> pumpScreenView(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 2200));
    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<WordBloc>.value(value: wordBloc),
            BlocProvider<WordEditingBloc>.value(value: wordEditingBloc),
          ],
          child: const WordDefinitionScreenView(
            initialWord: sampleWord,
            topicName: 'Animals',
            topicColor: Colors.blue,
          ),
        ),
      ),
    );
  }

  testWidgets(
    'WordDefinitionScreen wires providers and dispatches started events',
    (tester) async {
      await tester.binding.setSurfaceSize(const Size(1200, 2200));

      getIt.registerFactory<WordBloc>(() => wordBloc);
      getIt.registerFactory<WordEditingBloc>(() => wordEditingBloc);

      await tester.pumpWidget(
        const MaterialApp(
          home: WordDefinitionScreen(
            wordData: sampleWord,
            topicName: 'Animals',
            topicColor: Colors.blue,
          ),
        ),
      );

      verify(() => wordBloc.add(WordEvent.started(word: sampleWord))).called(1);
      verify(
        () => wordEditingBloc.add(WordEditingEvent.started(word: sampleWord)),
      ).called(1);

      await tester.binding.setSurfaceSize(null);
    },
  );

  testWidgets('renders word body from initial/current word', (tester) async {
    await pumpScreenView(tester);
    await tester.pump();

    expect(find.byType(WordDefinitionScreenBody), findsOneWidget);
    expect(find.text('cat'), findsOneWidget);
    expect(find.text('кот'), findsOneWidget);
    expect(find.text('Animals'), findsOneWidget);

    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('tapping knowledge button dispatches toggle learned event', (
    tester,
  ) async {
    await pumpScreenView(tester);
    await tester.pump();

    final knowledgeButton = find.byWidgetPredicate(
      (widget) =>
          widget is SvgPicture &&
          widget.bytesLoader.toString().contains('knowledge_button.svg'),
    );

    await tester.tap(knowledgeButton);
    await tester.pump();

    verify(
      () => wordEditingBloc.add(
        WordEditingEvent.toggleLearnedRequested(word: sampleWord),
      ),
    ).called(1);

    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('wordUpdated from editing triggers refresh and status consumed', (
    tester,
  ) async {
    whenListen(
      wordEditingBloc,
      Stream.value(
        const WordEditingState(
          word: sampleWord,
          status: WordEditingStatus.wordUpdated,
        ),
      ),
      initialState: const WordEditingState(
        word: sampleWord,
        status: WordEditingStatus.ready,
      ),
    );

    await pumpScreenView(tester);
    await tester.pump();

    verify(() => wordBloc.add(WordEvent.refreshRequested(wordId: 1))).called(1);
    verify(
      () => wordEditingBloc.add(const WordEditingEvent.statusConsumed()),
    ).called(1);

    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('word editing failure shows snack and consumes status', (
    tester,
  ) async {
    whenListen(
      wordEditingBloc,
      Stream.value(
        const WordEditingState(
          word: sampleWord,
          status: WordEditingStatus.failure,
          message: 'Не удалось обновить статус слова',
        ),
      ),
      initialState: const WordEditingState(
        word: sampleWord,
        status: WordEditingStatus.ready,
      ),
    );

    await pumpScreenView(tester);
    await tester.pump();

    expect(find.text('Не удалось обновить статус слова'), findsOneWidget);
    verify(
      () => wordEditingBloc.add(const WordEditingEvent.statusConsumed()),
    ).called(1);

    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('word bloc failure shows snack and consumes status', (
    tester,
  ) async {
    whenListen(
      wordBloc,
      Stream.value(
        const WordState(
          word: sampleWord,
          status: WordStatus.failure,
          message: 'Не удалось удалить слово',
        ),
      ),
      initialState: const WordState(word: sampleWord, status: WordStatus.ready),
    );

    await pumpScreenView(tester);
    await tester.pump();

    expect(find.text('Не удалось удалить слово'), findsOneWidget);
    verify(() => wordBloc.add(const WordEvent.statusConsumed())).called(1);

    await tester.binding.setSurfaceSize(null);
  });
}
