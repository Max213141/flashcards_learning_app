import 'package:bloc_test/bloc_test.dart';
import 'package:flashcards_learning_app/entities/ai_word_draft.dart';
import 'package:flashcards_learning_app/core/interfaces/ai/local_ai_model_manager.dart';
import 'package:flashcards_learning_app/core/interfaces/ai/local_ai_word_draft_service.dart';
import 'package:flashcards_learning_app/blocs/ai_word_draft_bloc/ai_word_draft_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gemma/flutter_gemma.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalAiModelManager extends Mock implements LocalAiModelManager {}

class MockLocalAiWordDraftService extends Mock
    implements LocalAiWordDraftService {}

void main() {
  late MockLocalAiModelManager modelManager;
  late MockLocalAiWordDraftService wordDraftService;

  const draft = AiWordDraft(
    word: 'bonjour',
    translation: 'привет',
    transcription: 'бонжур',
    partOfSpeech: 'междометие',
    usage: 'Bonjour ! - Привет!',
  );

  AiWordDraftBloc buildBloc() {
    return AiWordDraftBloc(
      modelManager: modelManager,
      wordDraftService: wordDraftService,
    );
  }

  setUp(() {
    modelManager = MockLocalAiModelManager();
    wordDraftService = MockLocalAiWordDraftService();
    when(
      () => modelManager.cleanupIncompleteInstall(),
    ).thenAnswer((_) async {});
  });

  blocTest<AiWordDraftBloc, AiWordDraftState>(
    'languageSettingsChanged remembers source and target languages',
    build: buildBloc,
    act: (bloc) => bloc.add(
      const AiWordDraftEvent.languageSettingsChanged(
        sourceLanguage: 'fr',
        targetLanguage: 'ru',
      ),
    ),
    expect: () => [
      isA<AiWordDraftState>()
          .having((s) => s.sourceLanguage, 'sourceLanguage', 'fr')
          .having((s) => s.targetLanguage, 'targetLanguage', 'ru'),
    ],
  );

  blocTest<AiWordDraftBloc, AiWordDraftState>(
    'generateRequested asks for download confirmation when model is missing',
    build: () {
      when(() => modelManager.isInstalled()).thenAnswer((_) async => false);
      return buildBloc();
    },
    seed: () =>
        const AiWordDraftState(sourceLanguage: 'fr', targetLanguage: 'ru'),
    act: (bloc) =>
        bloc.add(const AiWordDraftEvent.generateRequested(input: 'bonjour')),
    expect: () => [
      isA<AiWordDraftState>()
          .having((s) => s.setupStatus, 'setupStatus', AiSetupStatus.checking)
          .having((s) => s.pendingInput, 'pendingInput', 'bonjour')
          .having((s) => s.pendingSourceLanguage, 'sourceLanguage', 'fr')
          .having((s) => s.pendingTargetLanguage, 'targetLanguage', 'ru'),
      isA<AiWordDraftState>().having(
        (s) => s.setupStatus,
        'setupStatus',
        AiSetupStatus.downloadConfirmationRequired,
      ),
    ],
  );

  blocTest<AiWordDraftBloc, AiWordDraftState>(
    'generateRequested activates installed model and emits generated draft',
    build: () {
      when(() => modelManager.isInstalled()).thenAnswer((_) async => true);
      when(
        () => modelManager.activateInstalledModel(),
      ).thenAnswer((_) async {});
      when(
        () => wordDraftService.generateWordDraft(
          input: 'bonjour',
          sourceLanguage: 'fr',
          targetLanguage: 'ru',
        ),
      ).thenAnswer((_) async => draft);
      return buildBloc();
    },
    seed: () =>
        const AiWordDraftState(sourceLanguage: 'fr', targetLanguage: 'ru'),
    act: (bloc) =>
        bloc.add(const AiWordDraftEvent.generateRequested(input: 'bonjour')),
    expect: () => [
      isA<AiWordDraftState>().having(
        (s) => s.setupStatus,
        'setupStatus',
        AiSetupStatus.checking,
      ),
      isA<AiWordDraftState>().having(
        (s) => s.setupStatus,
        'setupStatus',
        AiSetupStatus.loadingModel,
      ),
      isA<AiWordDraftState>()
          .having((s) => s.setupStatus, 'setupStatus', AiSetupStatus.ready)
          .having(
            (s) => s.generationStatus,
            'generationStatus',
            AiGenerationStatus.generating,
          ),
      isA<AiWordDraftState>()
          .having((s) => s.setupStatus, 'setupStatus', AiSetupStatus.ready)
          .having(
            (s) => s.generationStatus,
            'generationStatus',
            AiGenerationStatus.success,
          )
          .having((s) => s.draft?.translation, 'translation', 'привет'),
    ],
  );

  blocTest<AiWordDraftBloc, AiWordDraftState>(
    'downloadAccepted reports progress then generates draft',
    build: () {
      when(
        () => modelManager.install(onProgress: any(named: 'onProgress')),
      ).thenAnswer((invocation) async {
        final onProgress =
            invocation.namedArguments[#onProgress] as void Function(int);
        onProgress(45);
      });
      when(
        () => modelManager.activateInstalledModel(),
      ).thenAnswer((_) async {});
      when(
        () => wordDraftService.generateWordDraft(
          input: 'bonjour',
          sourceLanguage: 'fr',
          targetLanguage: 'ru',
        ),
      ).thenAnswer((_) async => draft);
      return buildBloc();
    },
    seed: () => const AiWordDraftState(
      setupStatus: AiSetupStatus.downloadConfirmationRequired,
      pendingInput: 'bonjour',
      pendingSourceLanguage: 'fr',
      pendingTargetLanguage: 'ru',
    ),
    act: (bloc) => bloc.add(const AiWordDraftEvent.downloadAccepted()),
    expect: () => [
      isA<AiWordDraftState>()
          .having(
            (s) => s.setupStatus,
            'setupStatus',
            AiSetupStatus.downloading,
          )
          .having((s) => s.downloadProgress, 'progress', 0),
      isA<AiWordDraftState>()
          .having(
            (s) => s.setupStatus,
            'setupStatus',
            AiSetupStatus.downloading,
          )
          .having((s) => s.downloadProgress, 'progress', 45),
      isA<AiWordDraftState>()
          .having((s) => s.setupStatus, 'setupStatus', AiSetupStatus.installed)
          .having((s) => s.downloadProgress, 'progress', 100),
      isA<AiWordDraftState>().having(
        (s) => s.setupStatus,
        'setupStatus',
        AiSetupStatus.loadingModel,
      ),
      isA<AiWordDraftState>().having(
        (s) => s.generationStatus,
        'generationStatus',
        AiGenerationStatus.generating,
      ),
      isA<AiWordDraftState>()
          .having(
            (s) => s.generationStatus,
            'generationStatus',
            AiGenerationStatus.success,
          )
          .having((s) => s.draft?.word, 'word', 'bonjour'),
    ],
  );

  blocTest<AiWordDraftBloc, AiWordDraftState>(
    'downloadAccepted installs model without generating when no input is pending',
    build: () {
      when(
        () => modelManager.install(onProgress: any(named: 'onProgress')),
      ).thenAnswer((invocation) async {
        final onProgress =
            invocation.namedArguments[#onProgress] as void Function(int);
        onProgress(40);
      });
      return buildBloc();
    },
    seed: () => const AiWordDraftState(setupStatus: AiSetupStatus.notInstalled),
    act: (bloc) => bloc.add(const AiWordDraftEvent.downloadAccepted()),
    expect: () => [
      isA<AiWordDraftState>()
          .having(
            (s) => s.setupStatus,
            'setupStatus',
            AiSetupStatus.downloading,
          )
          .having((s) => s.downloadProgress, 'progress', 0),
      isA<AiWordDraftState>()
          .having(
            (s) => s.setupStatus,
            'setupStatus',
            AiSetupStatus.downloading,
          )
          .having((s) => s.downloadProgress, 'progress', 40),
      isA<AiWordDraftState>()
          .having((s) => s.setupStatus, 'setupStatus', AiSetupStatus.installed)
          .having((s) => s.downloadProgress, 'progress', 100)
          .having(
            (s) => s.generationStatus,
            'generationStatus',
            AiGenerationStatus.idle,
          ),
    ],
    verify: (_) {
      verify(() => modelManager.cleanupIncompleteInstall()).called(1);
      verifyNever(() => modelManager.activateInstalledModel());
      verifyNever(
        () => wordDraftService.generateWordDraft(
          input: any(named: 'input'),
          sourceLanguage: any(named: 'sourceLanguage'),
          targetLanguage: any(named: 'targetLanguage'),
        ),
      );
    },
  );

  blocTest<AiWordDraftBloc, AiWordDraftState>(
    'download failure emits failure',
    build: () {
      when(
        () => modelManager.install(onProgress: any(named: 'onProgress')),
      ).thenThrow(Exception('network'));
      return buildBloc();
    },
    seed: () => const AiWordDraftState(
      setupStatus: AiSetupStatus.downloadConfirmationRequired,
      pendingInput: 'bonjour',
      pendingSourceLanguage: 'fr',
      pendingTargetLanguage: 'ru',
    ),
    act: (bloc) => bloc.add(const AiWordDraftEvent.downloadAccepted()),
    expect: () => [
      isA<AiWordDraftState>().having(
        (s) => s.setupStatus,
        'setupStatus',
        AiSetupStatus.downloading,
      ),
      isA<AiWordDraftState>()
          .having((s) => s.setupStatus, 'setupStatus', AiSetupStatus.failure)
          .having(
            (s) => s.generationStatus,
            'generationStatus',
            AiGenerationStatus.failure,
          ),
    ],
    verify: (_) {
      verify(() => modelManager.cleanupIncompleteInstall()).called(2);
    },
  );

  blocTest<AiWordDraftBloc, AiWordDraftState>(
    'download cancellation cleans incomplete install and emits cancelled',
    build: () {
      when(
        () => modelManager.install(onProgress: any(named: 'onProgress')),
      ).thenThrow(DownloadCancelledException('cancelled', null));
      return buildBloc();
    },
    seed: () => const AiWordDraftState(
      setupStatus: AiSetupStatus.downloadConfirmationRequired,
    ),
    act: (bloc) => bloc.add(const AiWordDraftEvent.downloadAccepted()),
    expect: () => [
      isA<AiWordDraftState>().having(
        (s) => s.setupStatus,
        'setupStatus',
        AiSetupStatus.downloading,
      ),
      isA<AiWordDraftState>().having(
        (s) => s.setupStatus,
        'setupStatus',
        AiSetupStatus.cancelled,
      ),
    ],
    verify: (_) {
      verify(() => modelManager.cleanupIncompleteInstall()).called(2);
    },
  );

  blocTest<AiWordDraftBloc, AiWordDraftState>(
    'downloadCancelled cancels manager and emits cancelled',
    build: () {
      when(() => modelManager.cancelInstall()).thenReturn(null);
      return buildBloc();
    },
    act: (bloc) => bloc.add(const AiWordDraftEvent.downloadCancelled()),
    expect: () => [
      isA<AiWordDraftState>().having(
        (s) => s.setupStatus,
        'setupStatus',
        AiSetupStatus.cancelled,
      ),
    ],
    verify: (_) {
      verify(() => modelManager.cancelInstall()).called(1);
    },
  );
}
