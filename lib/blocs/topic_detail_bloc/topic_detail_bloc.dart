import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flashcards_learning_app/utils/picker_util.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_detail_event.dart';
part 'topic_detail_state.dart';
part 'topic_detail_bloc.freezed.dart';

class TopicDetailBloc extends Bloc<TopicDetailEvent, TopicDetailState> {
  TopicDetailBloc({
    required this.appDatabase,
    PickerUtil? pickerUtil,
  }) : _pickerUtil = pickerUtil ?? PickerUtil(),
       super(const TopicDetailState()) {
    on<_Started>(_onStarted);
    on<_ReloadRequested>(_onReloadRequested);
    on<_AddWordRequested>(_onAddWordRequested);
    on<_ImportWordsRequested>(_onImportWordsRequested);
    on<_DeleteTopicRequested>(_onDeleteTopicRequested);
    on<_StatusConsumed>(_onStatusConsumed);
  }

  final AppDatabase appDatabase;
  final PickerUtil _pickerUtil;

  Future<void> _onStarted(
    _Started event,
    Emitter<TopicDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        topicId: event.topicId,
        topicName: event.topicName,
        isLoading: true,
        message: null,
        status: TopicDetailStatus.loading,
      ),
    );
    await _loadWords(emit, markChanged: false);
  }

  Future<void> _onReloadRequested(
    _ReloadRequested event,
    Emitter<TopicDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        message: null,
        status: TopicDetailStatus.loading,
      ),
    );
    await _loadWords(emit, markChanged: true);
  }

  Future<void> _onAddWordRequested(
    _AddWordRequested event,
    Emitter<TopicDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        message: null,
        status: TopicDetailStatus.processing,
      ),
    );

    try {
      final added = await appDatabase.addWord(event.newWord);
      if (!added) {
        emit(
          state.copyWith(
            isLoading: false,
            status: TopicDetailStatus.failure,
            message: 'Не удалось добавить слово',
          ),
        );
        return;
      }
      await _loadWords(emit, markChanged: true);
    } catch (_) {
      emit(
        state.copyWith(
          isLoading: false,
          status: TopicDetailStatus.failure,
          message: 'Не удалось добавить слово',
        ),
      );
    }
  }

  Future<void> _onImportWordsRequested(
    _ImportWordsRequested event,
    Emitter<TopicDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        message: null,
        status: TopicDetailStatus.processing,
      ),
    );

    try {
      final pickedData = await _pickerUtil.pickJson();
      if (pickedData == null) {
        emit(
          state.copyWith(
            isLoading: false,
            status: _baseStatus(state),
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

      await appDatabase.insertWords(
        topicId: state.topicId,
        topicName: state.topicName,
        wordList: words,
      );
      await _loadWords(emit, markChanged: true);
    } on PlatformException catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          status: TopicDetailStatus.failure,
          message: 'File access error: ${e.message}',
        ),
      );
    } on FormatException catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          status: TopicDetailStatus.failure,
          message: e.message,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isLoading: false,
          status: TopicDetailStatus.failure,
          message: 'Failed to read JSON',
        ),
      );
    }
  }

  Future<void> _onDeleteTopicRequested(
    _DeleteTopicRequested event,
    Emitter<TopicDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        message: null,
        status: TopicDetailStatus.processing,
      ),
    );

    try {
      final deleted = await appDatabase.deleteTopicWithWords(state.topicId);
      if (!deleted) {
        emit(
          state.copyWith(
            isLoading: false,
            status: TopicDetailStatus.failure,
            message: 'Не удалось удалить тему',
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          isLoading: false,
          hasChanges: true,
          status: TopicDetailStatus.topicDeleted,
          message: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isLoading: false,
          status: TopicDetailStatus.failure,
          message: 'Не удалось удалить тему',
        ),
      );
    }
  }

  void _onStatusConsumed(
    _StatusConsumed event,
    Emitter<TopicDetailState> emit,
  ) {
    emit(
      state.copyWith(
        isLoading: false,
        status: _baseStatus(state),
        message: null,
      ),
    );
  }

  Future<void> _loadWords(
    Emitter<TopicDetailState> emit, {
    required bool markChanged,
  }) async {
    try {
      final words = await appDatabase.getWordsForTopic(state.topicId);
      final nextState = state.copyWith(
        words: words,
        isLoading: false,
        hasChanges: state.hasChanges || markChanged,
        message: null,
      );
      emit(nextState.copyWith(status: _baseStatus(nextState)));
    } catch (_) {
      emit(
        state.copyWith(
          isLoading: false,
          status: TopicDetailStatus.failure,
          message: 'Не удалось загрузить слова',
        ),
      );
    }
  }

  TopicDetailStatus _baseStatus(TopicDetailState state) {
    if (state.isLoading) return TopicDetailStatus.loading;
    return TopicDetailStatus.ready;
  }
}
