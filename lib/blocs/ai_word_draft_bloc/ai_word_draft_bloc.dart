import 'package:flashcards_learning_app/entities/ai_word_draft.dart';
import 'package:flashcards_learning_app/core/interfaces/ai/local_ai_model_manager.dart';
import 'package:flashcards_learning_app/core/interfaces/ai/local_ai_word_draft_service.dart';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_word_draft_event.dart';
part 'ai_word_draft_state.dart';
part 'ai_word_draft_bloc.freezed.dart';

class AiWordDraftBloc extends Bloc<AiWordDraftEvent, AiWordDraftState> {
  AiWordDraftBloc({
    required LocalAiModelManager modelManager,
    required LocalAiWordDraftService wordDraftService,
  }) : _modelManager = modelManager,
       _wordDraftService = wordDraftService,
       super(const AiWordDraftState()) {
    on<_Started>(_onStarted);
    on<_GenerateRequested>(_onGenerateRequested);
    on<_DownloadAccepted>(_onDownloadAccepted);
    on<_DownloadCancelled>(_onDownloadCancelled);
    on<_StatusConsumed>(_onStatusConsumed);
  }

  final LocalAiModelManager _modelManager;
  final LocalAiWordDraftService _wordDraftService;

  Future<void> _onStarted(
    _Started event,
    Emitter<AiWordDraftState> emit,
  ) async {
    emit(state.copyWith(setupStatus: AiSetupStatus.checking, message: null));

    try {
      final installed = await _modelManager.isInstalled();
      emit(
        state.copyWith(
          setupStatus: installed
              ? AiSetupStatus.installed
              : AiSetupStatus.notInstalled,
          message: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          setupStatus: AiSetupStatus.failure,
          message: 'Не удалось проверить локальную AI модель',
        ),
      );
    }
  }

  Future<void> _onGenerateRequested(
    _GenerateRequested event,
    Emitter<AiWordDraftState> emit,
  ) async {
    final input = event.input.trim();
    if (input.isEmpty) {
      emit(
        state.copyWith(
          generationStatus: AiGenerationStatus.failure,
          message: 'Введите слово или фразу',
        ),
      );
      return;
    }

    final sourceLanguage = event.sourceLanguage.trim().isEmpty
        ? 'auto'
        : event.sourceLanguage.trim();
    final targetLanguage = event.targetLanguage.trim().isEmpty
        ? 'русский'
        : event.targetLanguage.trim();

    emit(
      state.copyWith(
        setupStatus: AiSetupStatus.checking,
        generationStatus: AiGenerationStatus.idle,
        draft: null,
        message: null,
        pendingInput: input,
        pendingSourceLanguage: sourceLanguage,
        pendingTargetLanguage: targetLanguage,
      ),
    );

    try {
      final installed = await _modelManager.isInstalled();
      if (!installed) {
        emit(
          state.copyWith(
            setupStatus: AiSetupStatus.downloadConfirmationRequired,
            message: null,
          ),
        );
        return;
      }

      await _activateAndGenerate(
        emit,
        input: input,
        sourceLanguage: sourceLanguage,
        targetLanguage: targetLanguage,
      );
    } catch (_) {
      emit(
        state.copyWith(
          setupStatus: AiSetupStatus.failure,
          generationStatus: AiGenerationStatus.failure,
          message: 'Не удалось подготовить локальную AI модель',
        ),
      );
    }
  }

  Future<void> _onDownloadAccepted(
    _DownloadAccepted event,
    Emitter<AiWordDraftState> emit,
  ) async {
    final input = state.pendingInput;
    final sourceLanguage = state.pendingSourceLanguage;
    final targetLanguage = state.pendingTargetLanguage;
    final shouldGenerate =
        input != null && sourceLanguage != null && targetLanguage != null;

    emit(
      state.copyWith(
        setupStatus: AiSetupStatus.downloading,
        downloadProgress: 0,
        message: null,
      ),
    );

    try {
      await _modelManager.install(
        onProgress: (progress) {
          if (emit.isDone) return;
          emit(
            state.copyWith(
              setupStatus: AiSetupStatus.downloading,
              downloadProgress: progress.clamp(0, 100),
              message: null,
            ),
          );
        },
      );

      emit(
        state.copyWith(
          setupStatus: AiSetupStatus.installed,
          downloadProgress: 100,
          message: null,
        ),
      );

      if (shouldGenerate) {
        await _activateAndGenerate(
          emit,
          input: input,
          sourceLanguage: sourceLanguage,
          targetLanguage: targetLanguage,
        );
      }
    } catch (error) {
      if (CancelToken.isCancel(error)) {
        emit(
          state.copyWith(
            setupStatus: AiSetupStatus.cancelled,
            generationStatus: AiGenerationStatus.idle,
            message: null,
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          setupStatus: AiSetupStatus.failure,
          generationStatus: AiGenerationStatus.failure,
          message: 'Не удалось скачать локальную AI модель',
        ),
      );
    }
  }

  void _onDownloadCancelled(
    _DownloadCancelled event,
    Emitter<AiWordDraftState> emit,
  ) {
    _modelManager.cancelInstall();
    emit(
      state.copyWith(
        setupStatus: AiSetupStatus.cancelled,
        generationStatus: AiGenerationStatus.idle,
        message: null,
      ),
    );
  }

  void _onStatusConsumed(
    _StatusConsumed event,
    Emitter<AiWordDraftState> emit,
  ) {
    emit(
      state.copyWith(
        setupStatus: _baseSetupStatus(state),
        generationStatus: AiGenerationStatus.idle,
        draft: null,
        message: null,
      ),
    );
  }

  Future<void> _activateAndGenerate(
    Emitter<AiWordDraftState> emit, {
    required String input,
    required String sourceLanguage,
    required String targetLanguage,
  }) async {
    emit(
      state.copyWith(
        setupStatus: AiSetupStatus.loadingModel,
        generationStatus: AiGenerationStatus.idle,
        message: null,
      ),
    );

    try {
      await _modelManager.activateInstalledModel();
    } catch (_) {
      emit(
        state.copyWith(
          setupStatus: AiSetupStatus.failure,
          generationStatus: AiGenerationStatus.failure,
          message: 'Не удалось загрузить локальную AI модель',
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        setupStatus: AiSetupStatus.ready,
        generationStatus: AiGenerationStatus.generating,
        message: null,
      ),
    );

    try {
      final draft = await _wordDraftService.generateWordDraft(
        input: input,
        sourceLanguage: sourceLanguage,
        targetLanguage: targetLanguage,
      );
      emit(
        state.copyWith(
          setupStatus: AiSetupStatus.ready,
          generationStatus: AiGenerationStatus.success,
          draft: draft,
          message: null,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          setupStatus: AiSetupStatus.ready,
          generationStatus: AiGenerationStatus.failure,
          draft: null,
          message: 'Не удалось создать черновик слова',
        ),
      );
    }
  }

  AiSetupStatus _baseSetupStatus(AiWordDraftState state) {
    return switch (state.setupStatus) {
      AiSetupStatus.ready ||
      AiSetupStatus.loadingModel ||
      AiSetupStatus.installed => AiSetupStatus.ready,
      AiSetupStatus.downloadConfirmationRequired ||
      AiSetupStatus.downloading ||
      AiSetupStatus.cancelled ||
      AiSetupStatus.notInstalled => AiSetupStatus.notInstalled,
      AiSetupStatus.checking ||
      AiSetupStatus.failure ||
      AiSetupStatus.initial => AiSetupStatus.initial,
    };
  }
}
