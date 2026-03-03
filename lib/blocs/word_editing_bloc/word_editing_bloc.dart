import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_editing_event.dart';
part 'word_editing_state.dart';
part 'word_editing_bloc.freezed.dart';

class WordEditingBloc extends Bloc<WordEditingEvent, WordEditingState> {
  WordEditingBloc({required this.appDatabase})
    : super(const WordEditingState()) {
    on<_Started>(_onStarted);
    on<_SaveRequested>(_onSaveRequested);
    on<_ToggleLearnedRequested>(_onToggleLearnedRequested);
    on<_StatusConsumed>(_onStatusConsumed);
  }

  final AppDatabase appDatabase;

  void _onStarted(_Started event, Emitter<WordEditingState> emit) {
    emit(
      state.copyWith(
        word: event.word,
        isSaving: false,
        status: WordEditingStatus.ready,
        message: null,
      ),
    );
  }

  Future<void> _onSaveRequested(
    _SaveRequested event,
    Emitter<WordEditingState> emit,
  ) async {
    emit(
      state.copyWith(
        isSaving: true,
        status: WordEditingStatus.ready,
        message: null,
      ),
    );

    try {
      final updated = await appDatabase.updateWord(event.updatedWord);
      if (!updated) {
        emit(
          state.copyWith(
            isSaving: false,
            status: WordEditingStatus.failure,
            message: 'Не удалось сохранить изменения',
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          word: event.updatedWord,
          isSaving: false,
          status: WordEditingStatus.saveSuccess,
          message: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isSaving: false,
          status: WordEditingStatus.failure,
          message: 'Не удалось сохранить изменения',
        ),
      );
    }
  }

  Future<void> _onToggleLearnedRequested(
    _ToggleLearnedRequested event,
    Emitter<WordEditingState> emit,
  ) async {
    final id = event.word.id;
    if (id == null) {
      emit(
        state.copyWith(
          status: WordEditingStatus.failure,
          message: 'Не удалось обновить статус слова',
        ),
      );
      return;
    }

    final nextValue = !event.word.learned;
    final updatedWord = event.word.copyWith(
      learned: nextValue,
      learnedAt: nextValue ? DateTime.now() : null,
    );

    emit(
      state.copyWith(
        isSaving: true,
        status: WordEditingStatus.ready,
        message: null,
      ),
    );

    try {
      final updated = await appDatabase.updateWord(updatedWord);
      if (!updated) {
        emit(
          state.copyWith(
            isSaving: false,
            status: WordEditingStatus.failure,
            message: 'Не удалось обновить статус слова',
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          word: updatedWord,
          isSaving: false,
          status: WordEditingStatus.wordUpdated,
          message: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isSaving: false,
          status: WordEditingStatus.failure,
          message: 'Не удалось обновить статус слова',
        ),
      );
    }
  }

  void _onStatusConsumed(_StatusConsumed event, Emitter<WordEditingState> emit) {
    emit(
      state.copyWith(
        isSaving: false,
        status: state.word == null
            ? WordEditingStatus.initial
            : WordEditingStatus.ready,
        message: null,
      ),
    );
  }
}
