import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_event.dart';
part 'word_state.dart';
part 'word_bloc.freezed.dart';

class WordBloc extends Bloc<WordEvent, WordState> {
  final AppDatabase appDatabase;
  WordBloc({required this.appDatabase}) : super(const WordState()) {
    on<_Started>(_onStarted);
    on<_AddWord>(_onAddWord);
    on<_RefreshRequested>(_onRefreshRequested);
    on<_DeleteRequested>(_onDeleteRequested);
    on<_StatusConsumed>(_onStatusConsumed);
  }

  void _onStarted(_Started event, Emitter<WordState> emit) {
    emit(
      state.copyWith(
        word: event.word,
        isLoading: false,
        status: WordStatus.ready,
        message: null,
      ),
    );
  }

  Future<void> _onAddWord(_AddWord event, Emitter<WordState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
        status: WordStatus.saving,
        message: null,
      ),
    );
    try {
      final added = await appDatabase.addWord(event.newWord);
      if (added) {
        emit(
          state.copyWith(
            isLoading: false,
            status: WordStatus.wordAdded,
            message: null,
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          isLoading: false,
          status: WordStatus.failure,
          message: 'Не удалось создать слово',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          status: WordStatus.failure,
          message: 'Не удалось создать слово',
        ),
      );
    }
  }

  Future<void> _onRefreshRequested(
    _RefreshRequested event,
    Emitter<WordState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        status: WordStatus.saving,
        message: null,
      ),
    );
    try {
      final freshWord = await appDatabase.getWordById(event.wordId);
      if (freshWord == null) {
        emit(
          state.copyWith(
            isLoading: false,
            status: WordStatus.failure,
            message: 'Не удалось обновить слово',
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          word: freshWord,
          isLoading: false,
          hasChanges: true,
          status: WordStatus.ready,
          message: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isLoading: false,
          status: WordStatus.failure,
          message: 'Не удалось обновить слово',
        ),
      );
    }
  }

  Future<void> _onDeleteRequested(
    _DeleteRequested event,
    Emitter<WordState> emit,
  ) async {
    final id = event.wordId ?? state.word?.id;
    if (id == null) {
      emit(
        state.copyWith(
          status: WordStatus.failure,
          message: 'Невозможно удалить слово',
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        isLoading: true,
        status: WordStatus.saving,
        message: null,
      ),
    );

    try {
      final deletedCount = await appDatabase.deleteWordById(id);
      if (deletedCount <= 0) {
        emit(
          state.copyWith(
            isLoading: false,
            status: WordStatus.failure,
            message: 'Не удалось удалить слово',
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          isLoading: false,
          hasChanges: true,
          status: WordStatus.wordDeleted,
          message: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isLoading: false,
          status: WordStatus.failure,
          message: 'Не удалось удалить слово',
        ),
      );
    }
  }

  void _onStatusConsumed(_StatusConsumed event, Emitter<WordState> emit) {
    emit(
      state.copyWith(
        isLoading: false,
        status: state.word == null ? WordStatus.initial : WordStatus.ready,
        message: null,
      ),
    );
  }
}
