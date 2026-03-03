import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flashcards_learning_app/utils/picker_util.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_creation_event.dart';
part 'topic_creation_state.dart';
part 'topic_creation_bloc.freezed.dart';

class TopicCreationBloc extends Bloc<TopicCreationEvent, TopicCreationState> {
  TopicCreationBloc({
    required this.appDatabase,
    PickerUtil? pickerUtil,
  }) : _pickerUtil = pickerUtil ?? PickerUtil(),
       super(const TopicCreationState()) {
    on<_NameChanged>(_onNameChanged);
    on<_ColorChanged>(_onColorChanged);
    on<_TopicSuggestionSelected>(_onTopicSuggestionSelected);
    on<_JsonImportRequested>(_onJsonImportRequested);
    on<_CreateSubmitted>(_onCreateSubmitted);
    on<_StatusConsumed>(_onStatusConsumed);
    on<_ResetRequested>(_onResetRequested);
  }

  final AppDatabase appDatabase;
  final PickerUtil _pickerUtil;

  void _onNameChanged(_NameChanged event, Emitter<TopicCreationState> emit) {
    emit(
      state.copyWith(
        name: event.name,
        status: _baseStatus(event.name),
        message: null,
      ),
    );
  }

  void _onColorChanged(_ColorChanged event, Emitter<TopicCreationState> emit) {
    emit(state.copyWith(selectedColorValue: event.colorValue));
  }

  void _onTopicSuggestionSelected(
    _TopicSuggestionSelected event,
    Emitter<TopicCreationState> emit,
  ) {
    emit(
      state.copyWith(
        name: event.name,
        status: _baseStatus(event.name),
        message: null,
      ),
    );
  }

  Future<void> _onJsonImportRequested(
    _JsonImportRequested event,
    Emitter<TopicCreationState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        status: TopicCreationStatus.importingJson,
        message: null,
      ),
    );

    try {
      final pickedData = await _pickerUtil.pickJson();
      if (pickedData == null) {
        emit(
          state.copyWith(
            isLoading: false,
            status: _baseStatus(state.name),
            message: null,
          ),
        );
        return;
      }

      if (pickedData is! List) {
        throw const FormatException('JSON must be a list of words');
      }

      final words = pickedData.map<Word>((item) {
        if (item is! Map) {
          throw const FormatException(
            'Each JSON item must be an object with word data',
          );
        }
        return Word.fromJson(item.map((key, value) => MapEntry('$key', value)));
      }).toList();

      final topicNames =
          words
              .map((word) => (word.topic ?? '').trim())
              .where((topic) => topic.isNotEmpty)
              .toSet()
              .toList()
            ..sort();

      final nextName =
          state.name.trim().isEmpty && topicNames.isNotEmpty
              ? topicNames.first
              : state.name;

      emit(
        state.copyWith(
          name: nextName,
          importedWords: words,
          topicSuggestions: topicNames,
          isLoading: false,
          status: _baseStatus(nextName),
          message: null,
        ),
      );
    } on PlatformException catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          status: TopicCreationStatus.failure,
          message: 'File access error: ${e.message}',
        ),
      );
    } on FormatException catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          status: TopicCreationStatus.failure,
          message: e.message,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isLoading: false,
          status: TopicCreationStatus.failure,
          message: 'Failed to read JSON',
        ),
      );
    }
  }

  Future<void> _onCreateSubmitted(
    _CreateSubmitted event,
    Emitter<TopicCreationState> emit,
  ) async {
    final name = state.name.trim();
    if (name.isEmpty) {
      emit(
        state.copyWith(
          status: TopicCreationStatus.failure,
          message: 'Введите название темы',
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        isLoading: true,
        status: TopicCreationStatus.creating,
        message: null,
      ),
    );

    try {
      final topic = Topic(topicName: name, colorValue: state.selectedColorValue);
      final words = state.importedWords
          .map((word) => word.copyWith(topic: name))
          .toList();

      await appDatabase.createTopicWithWords(topic: topic, words: words);

      emit(
        state.copyWith(
          isLoading: false,
          status: TopicCreationStatus.success,
          message: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isLoading: false,
          status: TopicCreationStatus.failure,
          message: 'Failed to create topic',
        ),
      );
    }
  }

  void _onStatusConsumed(
    _StatusConsumed event,
    Emitter<TopicCreationState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: false,
        status: _baseStatus(state.name),
        message: null,
      ),
    );
  }

  void _onResetRequested(
    _ResetRequested event,
    Emitter<TopicCreationState> emit,
  ) {
    emit(const TopicCreationState());
  }

  TopicCreationStatus _baseStatus(String name) {
    return name.trim().isEmpty
        ? TopicCreationStatus.idle
        : TopicCreationStatus.ready;
  }
}
