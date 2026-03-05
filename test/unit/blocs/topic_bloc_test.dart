import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flashcards_learning_app/blocs/topic_bloc/topic_bloc.dart';
import 'package:flashcards_learning_app/data/local/topic_summary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/stream_controller_helpers.dart';
import '../../helpers/test_words.dart';
import '../../mocks/mock_app_database.dart';

void main() {
  late MockAppDatabase appDatabase;
  late StreamController<List<TopicSummary>> createdDescController;
  late StreamController<List<TopicSummary>> titleAscController;

  setUp(() {
    appDatabase = MockAppDatabase();
    createdDescController = StreamController<List<TopicSummary>>.broadcast();
    titleAscController = StreamController<List<TopicSummary>>.broadcast();

    when(
      () => appDatabase.watchTopicSummaries(
        sortOption: TopicSortOption.createdDesc,
      ),
    ).thenAnswer((_) => createdDescController.stream);

    when(
      () =>
          appDatabase.watchTopicSummaries(sortOption: TopicSortOption.titleAsc),
    ).thenAnswer((_) => titleAscController.stream);
  });

  tearDown(() async {
    await closeControllers([createdDescController, titleAscController]);
  });

  blocTest<TopicBloc, TopicState>(
    'started emits loading then loaded when stream returns topics',
    build: () => TopicBloc(appDatabase: appDatabase),
    act: (bloc) async {
      bloc.add(const TopicEvent.started());
      await Future<void>.delayed(Duration.zero);
      createdDescController.add([makeTopicSummary(id: 1)]);
    },
    expect: () => [
      const TopicState.loading(selectedSort: TopicSortOption.createdDesc),
      isA<TopicState>()
          .having((s) => s.selectedSort, 'sort', TopicSortOption.createdDesc)
          .having(
            (s) => s.maybeMap(
              loaded: (state) => state.topics.length,
              orElse: () => -1,
            ),
            'topics',
            1,
          ),
    ],
  );

  blocTest<TopicBloc, TopicState>(
    'sortChanged with same option emits nothing',
    build: () => TopicBloc(appDatabase: appDatabase),
    seed: () => TopicState.loaded(
      selectedSort: TopicSortOption.createdDesc,
      topics: [makeTopicSummary(id: 1)],
    ),
    act: (bloc) {
      bloc.add(
        const TopicEvent.sortChanged(sortOption: TopicSortOption.createdDesc),
      );
    },
    expect: () => <TopicState>[],
  );

  blocTest<TopicBloc, TopicState>(
    'sortChanged with different option reloads and listens to new stream',
    build: () => TopicBloc(appDatabase: appDatabase),
    seed: () => TopicState.loaded(
      selectedSort: TopicSortOption.createdDesc,
      topics: [makeTopicSummary(id: 1)],
    ),
    act: (bloc) async {
      bloc.add(
        const TopicEvent.sortChanged(sortOption: TopicSortOption.titleAsc),
      );
      await Future<void>.delayed(Duration.zero);
      titleAscController.add([makeTopicSummary(id: 2, topicName: 'A')]);
    },
    expect: () => [
      isA<TopicState>()
          .having(
            (s) => s.selectedSort,
            'selectedSort',
            TopicSortOption.titleAsc,
          )
          .having(
            (s) => s.maybeMap(
              loading: (state) => state.previousTopics.length,
              orElse: () => -1,
            ),
            'previousTopics',
            1,
          ),
      isA<TopicState>()
          .having(
            (s) => s.selectedSort,
            'selectedSort',
            TopicSortOption.titleAsc,
          )
          .having(
            (s) => s.maybeMap(
              loaded: (state) => state.topics.length,
              orElse: () => -1,
            ),
            'topics',
            1,
          ),
    ],
  );

  blocTest<TopicBloc, TopicState>(
    'refreshRequested keeps previous topics during loading',
    build: () => TopicBloc(appDatabase: appDatabase),
    seed: () => TopicState.loaded(
      selectedSort: TopicSortOption.createdDesc,
      topics: [makeTopicSummary(id: 1)],
    ),
    act: (bloc) async {
      bloc.add(const TopicEvent.refreshRequested());
      await Future<void>.delayed(Duration.zero);
      createdDescController.add([makeTopicSummary(id: 3)]);
    },
    expect: () => [
      isA<TopicState>()
          .having(
            (s) => s.selectedSort,
            'selectedSort',
            TopicSortOption.createdDesc,
          )
          .having(
            (s) => s.maybeMap(
              loading: (state) => state.previousTopics.length,
              orElse: () => -1,
            ),
            'previousTopics',
            1,
          ),
      isA<TopicState>()
          .having(
            (s) => s.selectedSort,
            'selectedSort',
            TopicSortOption.createdDesc,
          )
          .having(
            (s) => s.maybeMap(
              loaded: (state) => state.topics.length,
              orElse: () => -1,
            ),
            'topics',
            1,
          ),
    ],
  );

  blocTest<TopicBloc, TopicState>(
    'stream error emits error state with previous topics',
    build: () => TopicBloc(appDatabase: appDatabase),
    seed: () => TopicState.loaded(
      selectedSort: TopicSortOption.createdDesc,
      topics: [makeTopicSummary(id: 11)],
    ),
    act: (bloc) async {
      bloc.add(const TopicEvent.refreshRequested());
      await Future<void>.delayed(Duration.zero);
      createdDescController.addError(Exception('boom'));
    },
    expect: () => [
      isA<TopicState>()
          .having(
            (s) => s.selectedSort,
            'selectedSort',
            TopicSortOption.createdDesc,
          )
          .having(
            (s) => s.maybeMap(
              loading: (state) => state.previousTopics.length,
              orElse: () => -1,
            ),
            'previousTopics',
            1,
          ),
      isA<TopicState>()
          .having(
            (s) => s.selectedSort,
            'selectedSort',
            TopicSortOption.createdDesc,
          )
          .having(
            (s) =>
                s.maybeMap(error: (state) => state.message, orElse: () => ''),
            'message',
            'Не удалось загрузить темы',
          ),
    ],
  );
}
