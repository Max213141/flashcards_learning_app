import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_event.dart';
part 'test_state.dart';
part 'test_bloc.freezed.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc({required this.appDatabase}) : super(const TestState.initial()) {
    on<_Started>(_onStarted);
    on<_ReloadRequested>(_onReloadRequested);
    on<_StatusConsumed>(_onStatusConsumed);
  }

  final AppDatabase appDatabase;

  Future<void> _onStarted(_Started event, Emitter<TestState> emit) async {
    emit(const TestState.loading());
    await _loadWords(emit, topicId: event.topicId);
  }

  Future<void> _onReloadRequested(
    _ReloadRequested event,
    Emitter<TestState> emit,
  ) async {
    emit(const TestState.loading());
    await _loadWords(emit, topicId: event.topicId);
  }

  void _onStatusConsumed(_StatusConsumed event, Emitter<TestState> emit) {
    emit(
      state.maybeWhen(
        loaded: (topicId, words) => TestState.loaded(topicId: topicId, words: words),
        orElse: () => const TestState.initial(),
      ),
    );
  }

  Future<void> _loadWords(
    Emitter<TestState> emit, {
    required int topicId,
  }) async {
    try {
      final words = await appDatabase.getWordsForTopic(topicId);
      emit(TestState.loaded(topicId: topicId, words: words));
    } catch (_) {
      emit(
        TestState.failure(
          topicId: topicId,
          message: 'Не удалось загрузить слова для практики',
        ),
      );
    }
  }
}
