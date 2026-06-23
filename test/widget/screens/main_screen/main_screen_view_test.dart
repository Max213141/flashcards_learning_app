import 'package:bloc_test/bloc_test.dart';
import 'package:flashcards_learning_app/blocs/backup_bloc/backup_bloc.dart';
import 'package:flashcards_learning_app/blocs/goals_bloc/goals_bloc.dart';
import 'package:flashcards_learning_app/blocs/topic_bloc/topic_bloc.dart';
import 'package:flashcards_learning_app/common_widgets/flashcards_loader.dart';
import 'package:flashcards_learning_app/data/local/topic_summary.dart';
import 'package:flashcards_learning_app/screens/main_screen/main_screen.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/main_screen_view.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/sort_widget/sort_button_second_part.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/topics_list_widget.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTopicBloc extends MockBloc<TopicEvent, TopicState>
    implements TopicBloc {}

class MockBackupBloc extends MockBloc<BackupEvent, BackupState>
    implements BackupBloc {}

class MockGoalsBloc extends MockBloc<GoalsEvent, GoalsState>
    implements GoalsBloc {}

void main() {
  late MockTopicBloc topicBloc;
  late MockBackupBloc backupBloc;
  late MockGoalsBloc goalsBloc;

  setUpAll(() {
    registerFallbackValue(const TopicEvent.started());
    registerFallbackValue(const BackupEvent.statusConsumed());
    registerFallbackValue(const GoalsEvent.started());
  });

  setUp(() async {
    topicBloc = MockTopicBloc();
    backupBloc = MockBackupBloc();
    goalsBloc = MockGoalsBloc();

    when(() => topicBloc.state).thenReturn(const TopicState.initial());
    whenListen(
      topicBloc,
      const Stream<TopicState>.empty(),
      initialState: const TopicState.initial(),
    );

    when(() => backupBloc.state).thenReturn(const BackupState.idle());
    whenListen(
      backupBloc,
      const Stream<BackupState>.empty(),
      initialState: const BackupState.idle(),
    );

    when(() => goalsBloc.state).thenReturn(const GoalsState.initial());
    whenListen(
      goalsBloc,
      const Stream<GoalsState>.empty(),
      initialState: const GoalsState.initial(),
    );

    await getIt.reset();
  });

  tearDown(() async {
    await getIt.reset();
  });

  Future<void> pumpMainScreenView(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<TopicBloc>.value(value: topicBloc),
            BlocProvider<BackupBloc>.value(value: backupBloc),
            BlocProvider<GoalsBloc>.value(value: goalsBloc),
          ],
          child: const MainScreenView(),
        ),
      ),
    );
  }

  testWidgets('MainScreen wires providers and dispatches started events', (
    tester,
  ) async {
    getIt.registerFactory<TopicBloc>(() => topicBloc);
    getIt.registerFactory<BackupBloc>(() => backupBloc);
    getIt.registerFactory<GoalsBloc>(() => goalsBloc);

    await tester.pumpWidget(const MaterialApp(home: MainScreen()));

    verify(() => topicBloc.add(const TopicEvent.started())).called(1);
    verify(() => goalsBloc.add(const GoalsEvent.started())).called(1);
  });

  testWidgets('shows loader while topic state is initial', (tester) async {
    when(() => topicBloc.state).thenReturn(const TopicState.initial());
    whenListen(
      topicBloc,
      Stream.value(const TopicState.initial()),
      initialState: const TopicState.initial(),
    );

    await pumpMainScreenView(tester);
    await tester.pump();

    expect(find.byType(FlashcardsLoader), findsOneWidget);
  });

  testWidgets('renders topics list for loaded state', (tester) async {
    final loadedState = TopicState.loaded(
      selectedSort: TopicSortOption.createdDesc,
      topics: const [
        TopicSummary(
          id: 1,
          topicName: 'Animals',
          colorValue: 0xFFA89DEF,
          totalWords: 2,
          learnedWords: 1,
        ),
      ],
    );

    when(() => topicBloc.state).thenReturn(loadedState);
    whenListen(topicBloc, Stream.value(loadedState), initialState: loadedState);

    await pumpMainScreenView(tester);
    await tester.pump();

    expect(find.byType(TopicsListWidget), findsOneWidget);
  });

  testWidgets('shows error text for error state without previous topics', (
    tester,
  ) async {
    const errorState = TopicState.error(
      selectedSort: TopicSortOption.createdDesc,
      message: 'Не удалось загрузить темы',
      previousTopics: [],
    );

    when(() => topicBloc.state).thenReturn(errorState);
    whenListen(topicBloc, Stream.value(errorState), initialState: errorState);

    await pumpMainScreenView(tester);
    await tester.pump();

    expect(find.text('Не удалось загрузить темы'), findsOneWidget);
  });

  testWidgets('error with previous topics still renders topics list', (
    tester,
  ) async {
    const errorState = TopicState.error(
      selectedSort: TopicSortOption.createdDesc,
      message: 'Ошибка',
      previousTopics: [
        TopicSummary(
          id: 1,
          topicName: 'Travel',
          colorValue: 0xFFA89DEF,
          totalWords: 1,
          learnedWords: 0,
        ),
      ],
    );

    when(() => topicBloc.state).thenReturn(errorState);
    whenListen(topicBloc, Stream.value(errorState), initialState: errorState);

    await pumpMainScreenView(tester);
    await tester.pump();

    expect(find.byType(TopicsListWidget), findsOneWidget);
  });

  testWidgets('sort interaction dispatches TopicEvent.sortChanged', (
    tester,
  ) async {
    final loadedState = TopicState.loaded(
      selectedSort: TopicSortOption.createdDesc,
      topics: const [
        TopicSummary(
          id: 1,
          topicName: 'Animals',
          colorValue: 0xFFA89DEF,
          totalWords: 2,
          learnedWords: 1,
        ),
      ],
    );

    when(() => topicBloc.state).thenReturn(loadedState);
    whenListen(topicBloc, Stream.value(loadedState), initialState: loadedState);

    await pumpMainScreenView(tester);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(SortButtonSecondPart));
    await tester.pumpAndSettle();
    await tester.tap(find.text('By color'));
    await tester.pumpAndSettle();

    verify(
      () => topicBloc.add(
        const TopicEvent.sortChanged(sortOption: TopicSortOption.colorAsc),
      ),
    ).called(1);
  });

  testWidgets(
    'backup listener shows snack and dispatches status/reset events',
    (tester) async {
      final states = [
        const BackupState.exportSuccess(message: 'Экспорт готов'),
        const BackupState.restoreSuccess(
          restoredWordsCount: 2,
          message: 'Восстановлено слов: 2',
        ),
        const BackupState.failure(message: 'Ошибка восстановления'),
      ];

      whenListen(
        backupBloc,
        Stream.fromIterable(states),
        initialState: const BackupState.idle(),
      );

      final loadedState = TopicState.loaded(
        selectedSort: TopicSortOption.createdDesc,
        topics: const [
          TopicSummary(
            id: 1,
            topicName: 'Animals',
            colorValue: 0xFFA89DEF,
            totalWords: 2,
            learnedWords: 1,
          ),
        ],
      );
      when(() => topicBloc.state).thenReturn(loadedState);
      whenListen(
        topicBloc,
        Stream.value(loadedState),
        initialState: loadedState,
      );

      await pumpMainScreenView(tester);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      verify(
        () => backupBloc.add(const BackupEvent.statusConsumed()),
      ).called(3);
      verify(
        () => topicBloc.add(const TopicEvent.refreshRequested()),
      ).called(1);
    },
  );
}
