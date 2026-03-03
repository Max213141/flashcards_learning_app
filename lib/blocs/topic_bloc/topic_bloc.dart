import 'dart:async';

import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/data/local/topic_summary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_event.dart';
part 'topic_state.dart';
part 'topic_bloc.freezed.dart';

class TopicBloc extends Bloc<TopicEvent, TopicState> {
  TopicBloc({required this.appDatabase}) : super(const TopicState.initial()) {
    on<_Started>(_onStarted);
    on<_SortChanged>(_onSortChanged);
    on<_RefreshRequested>(_onRefreshRequested);
    on<_TopicsUpdated>(_onTopicsUpdated);
    on<_SubscriptionFailed>(_onSubscriptionFailed);
  }

  final AppDatabase appDatabase;
  StreamSubscription<List<TopicSummary>>? _topicsSubscription;

  Future<void> _onStarted(_Started event, Emitter<TopicState> emit) async {
    await _subscribeToTopics(
      emit: emit,
      sortOption: state.selectedSort,
      previousTopics: const [],
    );
  }

  Future<void> _onSortChanged(
    _SortChanged event,
    Emitter<TopicState> emit,
  ) async {
    if (event.sortOption == state.selectedSort) return;
    await _subscribeToTopics(
      emit: emit,
      sortOption: event.sortOption,
      previousTopics: _currentTopics,
    );
  }

  Future<void> _onRefreshRequested(
    _RefreshRequested event,
    Emitter<TopicState> emit,
  ) async {
    await _subscribeToTopics(
      emit: emit,
      sortOption: state.selectedSort,
      previousTopics: _currentTopics,
    );
  }

  void _onTopicsUpdated(_TopicsUpdated event, Emitter<TopicState> emit) {
    if (event.selectedSort != state.selectedSort) return;
    emit(
      TopicState.loaded(
        selectedSort: event.selectedSort,
        topics: event.topics,
      ),
    );
  }

  void _onSubscriptionFailed(
    _SubscriptionFailed event,
    Emitter<TopicState> emit,
  ) {
    if (event.selectedSort != state.selectedSort) return;
    emit(
      TopicState.error(
        selectedSort: event.selectedSort,
        message: event.message,
        previousTopics: _currentTopics,
      ),
    );
  }

  List<TopicSummary> get _currentTopics => state.map(
    initial: (_) => const [],
    loading: (state) => state.previousTopics,
    loaded: (state) => state.topics,
    error: (state) => state.previousTopics,
  );

  Future<void> _subscribeToTopics({
    required Emitter<TopicState> emit,
    required TopicSortOption sortOption,
    required List<TopicSummary> previousTopics,
  }) async {
    emit(
      TopicState.loading(
        selectedSort: sortOption,
        previousTopics: previousTopics,
      ),
    );

    await _topicsSubscription?.cancel();
    _topicsSubscription = appDatabase
        .watchTopicSummaries(sortOption: sortOption)
        .listen(
          (topics) => add(
            TopicEvent.topicsUpdated(
              selectedSort: sortOption,
              topics: topics,
            ),
          ),
          onError: (_) => add(
            TopicEvent.subscriptionFailed(
              selectedSort: sortOption,
              message: 'Не удалось загрузить темы',
            ),
          ),
        );
  }

  @override
  Future<void> close() async {
    await _topicsSubscription?.cancel();
    return super.close();
  }
}
