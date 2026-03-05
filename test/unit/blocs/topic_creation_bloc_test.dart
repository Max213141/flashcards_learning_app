import 'package:bloc_test/bloc_test.dart';
import 'package:flashcards_learning_app/blocs/topic_creation_bloc/topic_creation_bloc.dart';
import 'package:flashcards_learning_app/entities/topic.dart';
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
    registerFallbackValue(makeTopic());
    registerFallbackValue(<Word>[]);
  });

  setUp(() {
    appDatabase = MockAppDatabase();
    pickerUtil = MockPickerUtil();
  });

  TopicCreationBloc buildBloc() {
    return TopicCreationBloc(appDatabase: appDatabase, pickerUtil: pickerUtil);
  }

  blocTest<TopicCreationBloc, TopicCreationState>(
    'nameChanged moves state to ready',
    build: buildBloc,
    act: (bloc) =>
        bloc.add(const TopicCreationEvent.nameChanged(name: 'Travel')),
    expect: () => const [
      TopicCreationState(name: 'Travel', status: TopicCreationStatus.ready),
    ],
  );

  blocTest<TopicCreationBloc, TopicCreationState>(
    'colorChanged updates selected color',
    build: buildBloc,
    act: (bloc) =>
        bloc.add(const TopicCreationEvent.colorChanged(colorValue: 123)),
    expect: () => const [TopicCreationState(selectedColorValue: 123)],
  );

  blocTest<TopicCreationBloc, TopicCreationState>(
    'jsonImportRequested with null data returns to base status',
    build: buildBloc,
    setUp: () {
      when(() => pickerUtil.pickJson()).thenAnswer((_) async => null);
    },
    act: (bloc) => bloc.add(const TopicCreationEvent.jsonImportRequested()),
    expect: () => const [
      TopicCreationState(
        isLoading: true,
        status: TopicCreationStatus.importingJson,
      ),
      TopicCreationState(),
    ],
  );

  blocTest<TopicCreationBloc, TopicCreationState>(
    'jsonImportRequested handles invalid top-level json',
    build: buildBloc,
    setUp: () {
      when(() => pickerUtil.pickJson()).thenAnswer((_) async => {'bad': true});
    },
    act: (bloc) => bloc.add(const TopicCreationEvent.jsonImportRequested()),
    expect: () => const [
      TopicCreationState(
        isLoading: true,
        status: TopicCreationStatus.importingJson,
      ),
      TopicCreationState(
        status: TopicCreationStatus.failure,
        message: 'JSON must be a list of words',
      ),
    ],
  );

  blocTest<TopicCreationBloc, TopicCreationState>(
    'jsonImportRequested parses words and suggestions',
    build: buildBloc,
    setUp: () {
      when(() => pickerUtil.pickJson()).thenAnswer(
        (_) async => [
          {'word': 'cat', 'translation': 'кот', 'topic': 'Animals'},
          {'word': 'dog', 'translation': 'пес', 'topic': 'Animals'},
          {'word': 'run', 'translation': 'бежать', 'topic': 'Verbs'},
        ],
      );
    },
    act: (bloc) => bloc.add(const TopicCreationEvent.jsonImportRequested()),
    expect: () => [
      const TopicCreationState(
        isLoading: true,
        status: TopicCreationStatus.importingJson,
      ),
      isA<TopicCreationState>()
          .having((s) => s.status, 'status', TopicCreationStatus.ready)
          .having((s) => s.name, 'name', 'Animals')
          .having((s) => s.topicSuggestions, 'suggestions', [
            'Animals',
            'Verbs',
          ])
          .having((s) => s.importedWords.length, 'words count', 3),
    ],
  );

  blocTest<TopicCreationBloc, TopicCreationState>(
    'createSubmitted validates empty name',
    build: buildBloc,
    act: (bloc) => bloc.add(const TopicCreationEvent.createSubmitted()),
    expect: () => const [
      TopicCreationState(
        status: TopicCreationStatus.failure,
        message: 'Введите название темы',
      ),
    ],
  );

  blocTest<TopicCreationBloc, TopicCreationState>(
    'createSubmitted creates topic and imported words',
    build: buildBloc,
    seed: () => TopicCreationState(
      name: 'Travel',
      importedWords: [
        makeWord(topic: 'OldName'),
        makeWord(id: 2, topic: null),
      ],
      status: TopicCreationStatus.ready,
    ),
    setUp: () {
      when(
        () => appDatabase.createTopicWithWords(
          topic: any(named: 'topic'),
          words: any(named: 'words'),
        ),
      ).thenAnswer((_) async => 1);
    },
    act: (bloc) => bloc.add(const TopicCreationEvent.createSubmitted()),
    expect: () => [
      isA<TopicCreationState>().having(
        (s) => s.status,
        'creating status',
        TopicCreationStatus.creating,
      ),
      isA<TopicCreationState>().having(
        (s) => s.status,
        'success status',
        TopicCreationStatus.success,
      ),
    ],
    verify: (_) {
      final call = verify(
        () => appDatabase.createTopicWithWords(
          topic: captureAny(named: 'topic'),
          words: captureAny(named: 'words'),
        ),
      ).captured;

      final topic = call.first as Topic;
      final words = call.last as List<Word>;

      expect(topic.topicName, 'Travel');
      expect(words.length, 2);
      expect(words[0].topic, 'Travel');
      expect(words[1].topic, 'Travel');
    },
  );

  blocTest<TopicCreationBloc, TopicCreationState>(
    'createSubmitted handles DB failure',
    build: buildBloc,
    seed: () => const TopicCreationState(
      name: 'Travel',
      status: TopicCreationStatus.ready,
    ),
    setUp: () {
      when(
        () => appDatabase.createTopicWithWords(
          topic: any(named: 'topic'),
          words: any(named: 'words'),
        ),
      ).thenThrow(Exception('db down'));
    },
    act: (bloc) => bloc.add(const TopicCreationEvent.createSubmitted()),
    expect: () => [
      isA<TopicCreationState>().having(
        (s) => s.status,
        'creating status',
        TopicCreationStatus.creating,
      ),
      isA<TopicCreationState>()
          .having(
            (s) => s.status,
            'failure status',
            TopicCreationStatus.failure,
          )
          .having((s) => s.message, 'message', 'Failed to create topic'),
    ],
  );

  blocTest<TopicCreationBloc, TopicCreationState>(
    'statusConsumed resets transient state',
    build: buildBloc,
    seed: () => const TopicCreationState(
      name: 'Travel',
      status: TopicCreationStatus.failure,
      message: 'x',
      isLoading: true,
    ),
    act: (bloc) => bloc.add(const TopicCreationEvent.statusConsumed()),
    expect: () => const [
      TopicCreationState(name: 'Travel', status: TopicCreationStatus.ready),
    ],
  );

  blocTest<TopicCreationBloc, TopicCreationState>(
    'resetRequested returns default state',
    build: buildBloc,
    seed: () => const TopicCreationState(
      name: 'Travel',
      status: TopicCreationStatus.success,
    ),
    act: (bloc) => bloc.add(const TopicCreationEvent.resetRequested()),
    expect: () => const [TopicCreationState()],
  );

  blocTest<TopicCreationBloc, TopicCreationState>(
    'jsonImportRequested handles platform exception',
    build: buildBloc,
    setUp: () {
      when(
        () => pickerUtil.pickJson(),
      ).thenThrow(PlatformException(message: 'denied', code: 'x'));
    },
    act: (bloc) => bloc.add(const TopicCreationEvent.jsonImportRequested()),
    expect: () => const [
      TopicCreationState(
        isLoading: true,
        status: TopicCreationStatus.importingJson,
      ),
      TopicCreationState(
        status: TopicCreationStatus.failure,
        message: 'File access error: denied',
      ),
    ],
  );
}
