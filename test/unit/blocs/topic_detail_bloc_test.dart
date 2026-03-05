import 'package:bloc_test/bloc_test.dart';
import 'package:flashcards_learning_app/blocs/topic_detail_bloc/topic_detail_bloc.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/test_words.dart';
import '../../mocks/mock_app_database.dart';

void main() {
  late MockAppDatabase appDatabase;
  late MockPickerUtil pickerUtil;

  setUpAll(() {
    registerFallbackValue(makeWord());
    registerFallbackValue(<Word>[]);
  });

  setUp(() {
    appDatabase = MockAppDatabase();
    pickerUtil = MockPickerUtil();
  });

  TopicDetailBloc buildBloc() {
    return TopicDetailBloc(appDatabase: appDatabase, pickerUtil: pickerUtil);
  }

  blocTest<TopicDetailBloc, TopicDetailState>(
    'started loads topic words',
    build: () {
      when(
        () => appDatabase.getWordsForTopic(10),
      ).thenAnswer((_) async => [makeWord(id: 1)]);
      return buildBloc();
    },
    act: (bloc) => bloc.add(
      const TopicDetailEvent.started(topicId: 10, topicName: 'Animals'),
    ),
    expect: () => [
      const TopicDetailState(
        topicId: 10,
        topicName: 'Animals',
        isLoading: true,
        status: TopicDetailStatus.loading,
      ),
      isA<TopicDetailState>()
          .having((s) => s.topicId, 'topicId', 10)
          .having((s) => s.status, 'status', TopicDetailStatus.ready)
          .having((s) => s.words.length, 'words', 1),
    ],
  );

  blocTest<TopicDetailBloc, TopicDetailState>(
    'reloadRequested marks hasChanges=true after load',
    build: () {
      when(
        () => appDatabase.getWordsForTopic(10),
      ).thenAnswer((_) async => [makeWord(id: 2)]);
      return buildBloc();
    },
    seed: () => const TopicDetailState(
      topicId: 10,
      topicName: 'Animals',
      status: TopicDetailStatus.ready,
    ),
    act: (bloc) => bloc.add(const TopicDetailEvent.reloadRequested()),
    expect: () => [
      const TopicDetailState(
        topicId: 10,
        topicName: 'Animals',
        isLoading: true,
        status: TopicDetailStatus.loading,
      ),
      isA<TopicDetailState>()
          .having((s) => s.status, 'status', TopicDetailStatus.ready)
          .having((s) => s.hasChanges, 'hasChanges', true)
          .having((s) => s.words.length, 'words', 1),
    ],
  );

  blocTest<TopicDetailBloc, TopicDetailState>(
    'addWord success reloads words and marks changes',
    build: () {
      when(() => appDatabase.addWord(any())).thenAnswer((_) async => true);
      when(
        () => appDatabase.getWordsForTopic(10),
      ).thenAnswer((_) async => [makeWord(id: 10)]);
      return buildBloc();
    },
    seed: () => const TopicDetailState(
      topicId: 10,
      topicName: 'Animals',
      status: TopicDetailStatus.ready,
    ),
    act: (bloc) => bloc.add(
      TopicDetailEvent.addWordRequested(newWord: makeWord(id: null)),
    ),
    expect: () => [
      const TopicDetailState(
        topicId: 10,
        topicName: 'Animals',
        isLoading: true,
        status: TopicDetailStatus.processing,
      ),
      isA<TopicDetailState>()
          .having((s) => s.status, 'status', TopicDetailStatus.ready)
          .having((s) => s.hasChanges, 'hasChanges', true)
          .having((s) => s.words.length, 'words', 1),
    ],
  );

  blocTest<TopicDetailBloc, TopicDetailState>(
    'addWord false result emits failure',
    build: () {
      when(() => appDatabase.addWord(any())).thenAnswer((_) async => false);
      return buildBloc();
    },
    seed: () => const TopicDetailState(
      topicId: 10,
      topicName: 'Animals',
      status: TopicDetailStatus.ready,
    ),
    act: (bloc) => bloc.add(
      TopicDetailEvent.addWordRequested(newWord: makeWord(id: null)),
    ),
    expect: () => const [
      TopicDetailState(
        topicId: 10,
        topicName: 'Animals',
        isLoading: true,
        status: TopicDetailStatus.processing,
      ),
      TopicDetailState(
        topicId: 10,
        topicName: 'Animals',
        status: TopicDetailStatus.failure,
        message: 'Не удалось добавить слово',
      ),
    ],
  );

  blocTest<TopicDetailBloc, TopicDetailState>(
    'importWordsRequested cancel returns to base status',
    build: () {
      when(() => pickerUtil.pickJson()).thenAnswer((_) async => null);
      return buildBloc();
    },
    seed: () => const TopicDetailState(
      topicId: 10,
      topicName: 'Animals',
      status: TopicDetailStatus.ready,
    ),
    act: (bloc) => bloc.add(const TopicDetailEvent.importWordsRequested()),
    expect: () => const [
      TopicDetailState(
        topicId: 10,
        topicName: 'Animals',
        isLoading: true,
        status: TopicDetailStatus.processing,
      ),
      TopicDetailState(
        topicId: 10,
        topicName: 'Animals',
        status: TopicDetailStatus.loading,
      ),
    ],
  );

  blocTest<TopicDetailBloc, TopicDetailState>(
    'importWordsRequested with invalid payload emits failure',
    build: () {
      when(() => pickerUtil.pickJson()).thenAnswer((_) async => {'bad': true});
      return buildBloc();
    },
    seed: () => const TopicDetailState(
      topicId: 10,
      topicName: 'Animals',
      status: TopicDetailStatus.ready,
    ),
    act: (bloc) => bloc.add(const TopicDetailEvent.importWordsRequested()),
    expect: () => const [
      TopicDetailState(
        topicId: 10,
        topicName: 'Animals',
        isLoading: true,
        status: TopicDetailStatus.processing,
      ),
      TopicDetailState(
        topicId: 10,
        topicName: 'Animals',
        status: TopicDetailStatus.failure,
        message: 'JSON must be a list of words',
      ),
    ],
  );

  blocTest<TopicDetailBloc, TopicDetailState>(
    'importWordsRequested success inserts and reloads words',
    build: () {
      when(() => pickerUtil.pickJson()).thenAnswer(
        (_) async => [
          {'word': 'cat', 'translation': 'кот', 'topic': 'Animals'},
          {'word': 'dog', 'translation': 'пес', 'topic': 'Animals'},
        ],
      );
      when(
        () => appDatabase.insertWords(
          topicId: any(named: 'topicId'),
          topicName: any(named: 'topicName'),
          wordList: any(named: 'wordList'),
        ),
      ).thenAnswer((_) async {});
      when(
        () => appDatabase.getWordsForTopic(10),
      ).thenAnswer((_) async => [makeWord(id: 44)]);
      return buildBloc();
    },
    seed: () => const TopicDetailState(
      topicId: 10,
      topicName: 'Animals',
      status: TopicDetailStatus.ready,
    ),
    act: (bloc) => bloc.add(const TopicDetailEvent.importWordsRequested()),
    expect: () => [
      const TopicDetailState(
        topicId: 10,
        topicName: 'Animals',
        isLoading: true,
        status: TopicDetailStatus.processing,
      ),
      isA<TopicDetailState>()
          .having((s) => s.status, 'status', TopicDetailStatus.ready)
          .having((s) => s.hasChanges, 'hasChanges', true)
          .having((s) => s.words.length, 'words', 1),
    ],
  );

  blocTest<TopicDetailBloc, TopicDetailState>(
    'importWordsRequested handles platform exception',
    build: () {
      when(
        () => pickerUtil.pickJson(),
      ).thenThrow(PlatformException(code: 'x', message: 'denied'));
      return buildBloc();
    },
    seed: () => const TopicDetailState(
      topicId: 10,
      topicName: 'Animals',
      status: TopicDetailStatus.ready,
    ),
    act: (bloc) => bloc.add(const TopicDetailEvent.importWordsRequested()),
    expect: () => const [
      TopicDetailState(
        topicId: 10,
        topicName: 'Animals',
        isLoading: true,
        status: TopicDetailStatus.processing,
      ),
      TopicDetailState(
        topicId: 10,
        topicName: 'Animals',
        status: TopicDetailStatus.failure,
        message: 'File access error: denied',
      ),
    ],
  );

  blocTest<TopicDetailBloc, TopicDetailState>(
    'deleteTopicRequested success emits topicDeleted',
    build: () {
      when(
        () => appDatabase.deleteTopicWithWords(10),
      ).thenAnswer((_) async => true);
      return buildBloc();
    },
    seed: () => const TopicDetailState(
      topicId: 10,
      topicName: 'Animals',
      status: TopicDetailStatus.ready,
    ),
    act: (bloc) => bloc.add(const TopicDetailEvent.deleteTopicRequested()),
    expect: () => const [
      TopicDetailState(
        topicId: 10,
        topicName: 'Animals',
        isLoading: true,
        status: TopicDetailStatus.processing,
      ),
      TopicDetailState(
        topicId: 10,
        topicName: 'Animals',
        hasChanges: true,
        status: TopicDetailStatus.topicDeleted,
      ),
    ],
  );

  blocTest<TopicDetailBloc, TopicDetailState>(
    'deleteTopicRequested failure emits error',
    build: () {
      when(
        () => appDatabase.deleteTopicWithWords(10),
      ).thenAnswer((_) async => false);
      return buildBloc();
    },
    seed: () => const TopicDetailState(
      topicId: 10,
      topicName: 'Animals',
      status: TopicDetailStatus.ready,
    ),
    act: (bloc) => bloc.add(const TopicDetailEvent.deleteTopicRequested()),
    expect: () => const [
      TopicDetailState(
        topicId: 10,
        topicName: 'Animals',
        isLoading: true,
        status: TopicDetailStatus.processing,
      ),
      TopicDetailState(
        topicId: 10,
        topicName: 'Animals',
        status: TopicDetailStatus.failure,
        message: 'Не удалось удалить тему',
      ),
    ],
  );

  blocTest<TopicDetailBloc, TopicDetailState>(
    'statusConsumed resets transient status to ready',
    build: buildBloc,
    seed: () => const TopicDetailState(
      topicId: 10,
      topicName: 'Animals',
      status: TopicDetailStatus.failure,
      message: 'x',
      isLoading: true,
    ),
    act: (bloc) => bloc.add(const TopicDetailEvent.statusConsumed()),
    expect: () => const [
      TopicDetailState(
        topicId: 10,
        topicName: 'Animals',
        status: TopicDetailStatus.loading,
      ),
    ],
  );
}
