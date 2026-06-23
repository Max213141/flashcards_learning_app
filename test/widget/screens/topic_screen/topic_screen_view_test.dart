import 'package:bloc_test/bloc_test.dart';
import 'package:flashcards_learning_app/blocs/ai_word_draft_bloc/ai_word_draft_bloc.dart';
import 'package:flashcards_learning_app/blocs/topic_detail_bloc/topic_detail_bloc.dart';
import 'package:flashcards_learning_app/blocs/word_bloc/word_bloc.dart';
import 'package:flashcards_learning_app/common_widgets/flashcards_loader.dart';
import 'package:flashcards_learning_app/screens/topic_screen/topic_screen.dart';
import 'package:flashcards_learning_app/screens/topic_screen/widgets/topic_screen_view.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTopicDetailBloc extends MockBloc<TopicDetailEvent, TopicDetailState>
    implements TopicDetailBloc {}

class MockWordBloc extends MockBloc<WordEvent, WordState> implements WordBloc {}

class MockAiWordDraftBloc extends MockBloc<AiWordDraftEvent, AiWordDraftState>
    implements AiWordDraftBloc {}

void main() {
  late MockTopicDetailBloc topicDetailBloc;
  late MockWordBloc wordBloc;
  late MockAiWordDraftBloc aiWordDraftBloc;
  late void Function(FlutterErrorDetails)? originalOnError;

  setUpAll(() {
    registerFallbackValue(
      const TopicDetailEvent.started(topicId: 1, topicName: 'Animals'),
    );
    registerFallbackValue(const TopicDetailEvent.reloadRequested());
    registerFallbackValue(const TopicDetailEvent.statusConsumed());
    registerFallbackValue(const WordEvent.statusConsumed());
    registerFallbackValue(const AiWordDraftEvent.started());
  });

  setUp(() async {
    originalOnError = FlutterError.onError;
    FlutterError.onError = (details) {
      final message = details.exceptionAsString();
      if (message.contains('A RenderFlex overflowed')) {
        return;
      }
      originalOnError?.call(details);
    };

    topicDetailBloc = MockTopicDetailBloc();
    wordBloc = MockWordBloc();
    aiWordDraftBloc = MockAiWordDraftBloc();

    const baseLoadingState = TopicDetailState(
      topicId: 1,
      topicName: 'Animals',
      isLoading: true,
      words: [],
      status: TopicDetailStatus.loading,
    );
    when(() => topicDetailBloc.state).thenReturn(baseLoadingState);
    whenListen(
      topicDetailBloc,
      const Stream<TopicDetailState>.empty(),
      initialState: baseLoadingState,
    );

    when(() => wordBloc.state).thenReturn(const WordState());
    whenListen(
      wordBloc,
      const Stream<WordState>.empty(),
      initialState: const WordState(),
    );
    when(() => aiWordDraftBloc.state).thenReturn(const AiWordDraftState());
    whenListen(
      aiWordDraftBloc,
      const Stream<AiWordDraftState>.empty(),
      initialState: const AiWordDraftState(),
    );

    await getIt.reset();
  });

  tearDown(() async {
    FlutterError.onError = originalOnError;
    await getIt.reset();
  });

  Future<void> pumpTopicScreenView(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<TopicDetailBloc>.value(value: topicDetailBloc),
            BlocProvider<WordBloc>.value(value: wordBloc),
            BlocProvider<AiWordDraftBloc>.value(value: aiWordDraftBloc),
          ],
          child: const TopicScreenView(
            topicName: 'Animals',
            topicId: 1,
            topicColor: Colors.blue,
          ),
        ),
      ),
    );
  }

  testWidgets('TopicScreen dispatches started event on build', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1200, 2200));
    getIt.registerFactory<TopicDetailBloc>(() => topicDetailBloc);
    getIt.registerFactory<WordBloc>(() => wordBloc);
    getIt.registerFactory<AiWordDraftBloc>(() => aiWordDraftBloc);

    await tester.pumpWidget(
      const MaterialApp(
        home: TopicScreen(
          topicName: 'Animals',
          topicId: 1,
          topicColor: Colors.blue,
        ),
      ),
    );

    verify(
      () => topicDetailBloc.add(
        const TopicDetailEvent.started(topicId: 1, topicName: 'Animals'),
      ),
    ).called(1);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('shows loader when topic is loading and words are empty', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1200, 2200));
    const loadingState = TopicDetailState(
      topicId: 1,
      topicName: 'Animals',
      isLoading: true,
      words: [],
      status: TopicDetailStatus.loading,
    );

    when(() => topicDetailBloc.state).thenReturn(loadingState);
    whenListen(
      topicDetailBloc,
      Stream.value(loadingState),
      initialState: loadingState,
    );

    await pumpTopicScreenView(tester);
    await tester.pump();

    expect(find.byType(FlashcardsLoader), findsOneWidget);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('wordDeleted listener triggers reload and consumes status', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1200, 2200));
    const readyState = TopicDetailState(
      topicId: 1,
      topicName: 'Animals',
      isLoading: true,
      words: [],
      status: TopicDetailStatus.loading,
    );

    when(() => topicDetailBloc.state).thenReturn(readyState);
    whenListen(
      topicDetailBloc,
      Stream.value(readyState),
      initialState: readyState,
    );

    final deletedState = const WordState(status: WordStatus.wordDeleted);
    whenListen(
      wordBloc,
      Stream.value(deletedState),
      initialState: const WordState(),
    );

    await pumpTopicScreenView(tester);
    await tester.pump();

    verify(
      () => topicDetailBloc.add(const TopicDetailEvent.reloadRequested()),
    ).called(1);
    verify(() => wordBloc.add(const WordEvent.statusConsumed())).called(1);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('word failure shows snack and consumes word status', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1200, 2200));
    const readyState = TopicDetailState(
      topicId: 1,
      topicName: 'Animals',
      isLoading: true,
      words: [],
      status: TopicDetailStatus.loading,
    );
    when(() => topicDetailBloc.state).thenReturn(readyState);
    whenListen(
      topicDetailBloc,
      Stream.value(readyState),
      initialState: readyState,
    );

    const failureState = WordState(
      status: WordStatus.failure,
      message: 'Не удалось удалить слово',
    );
    whenListen(
      wordBloc,
      Stream.value(failureState),
      initialState: const WordState(),
    );

    await pumpTopicScreenView(tester);
    await tester.pump();

    expect(find.text('Не удалось удалить слово'), findsOneWidget);
    verify(() => wordBloc.add(const WordEvent.statusConsumed())).called(1);
    await tester.binding.setSurfaceSize(null);
  });

  testWidgets('topic detail failure shows snack and consumes topic status', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1200, 2200));
    const failureState = TopicDetailState(
      topicId: 1,
      topicName: 'Animals',
      isLoading: true,
      status: TopicDetailStatus.failure,
      message: 'Не удалось загрузить слова',
      words: [],
    );

    when(() => topicDetailBloc.state).thenReturn(failureState);
    whenListen(
      topicDetailBloc,
      Stream.value(failureState),
      initialState: const TopicDetailState(
        topicId: 1,
        topicName: 'Animals',
        isLoading: true,
        status: TopicDetailStatus.loading,
      ),
    );

    await pumpTopicScreenView(tester);
    await tester.pump();

    expect(find.text('Не удалось загрузить слова'), findsOneWidget);
    verify(
      () => topicDetailBloc.add(const TopicDetailEvent.statusConsumed()),
    ).called(1);
    await tester.binding.setSurfaceSize(null);
  });
}
