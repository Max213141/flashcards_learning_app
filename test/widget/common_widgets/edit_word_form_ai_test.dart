import 'package:bloc_test/bloc_test.dart';
import 'package:flashcards_learning_app/entities/ai_word_draft.dart';
import 'package:flashcards_learning_app/core/interfaces/ai/local_ai_model_manager.dart';
import 'package:flashcards_learning_app/core/interfaces/ai/local_ai_word_draft_service.dart';
import 'package:flashcards_learning_app/blocs/ai_word_draft_bloc/ai_word_draft_bloc.dart';
import 'package:flashcards_learning_app/common_widgets/edit_form/ai_word_form.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flashcards_learning_app/screens/topic_screen/widgets/ai_dialog/add_word_ai_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalAiModelManager extends Mock implements LocalAiModelManager {}

class MockLocalAiWordDraftService extends Mock
    implements LocalAiWordDraftService {}

class MockAiWordDraftBloc extends MockBloc<AiWordDraftEvent, AiWordDraftState>
    implements AiWordDraftBloc {}

void main() {
  late MockLocalAiModelManager modelManager;
  late MockLocalAiWordDraftService wordDraftService;

  setUp(() {
    modelManager = MockLocalAiModelManager();
    wordDraftService = MockLocalAiWordDraftService();
  });

  testWidgets('AI success fills form and save returns reviewed word', (
    tester,
  ) async {
    Word? savedWord;
    when(() => modelManager.isInstalled()).thenAnswer((_) async => true);
    when(() => modelManager.activateInstalledModel()).thenAnswer((_) async {});
    when(
      () => wordDraftService.generateWordDraft(
        input: 'bonjour',
        sourceLanguage: 'auto',
        targetLanguage: 'русский',
      ),
    ).thenAnswer(
      (_) async => const AiWordDraft(
        word: 'bonjour',
        translation: 'привет',
        transcription: 'бонжур',
        partOfSpeech: 'междометие',
        usage: 'Bonjour ! - Привет!',
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider(
            create: (_) => AiWordDraftBloc(
              modelManager: modelManager,
              wordDraftService: wordDraftService,
            ),
            child: AiWordForm(onSave: (word) async => savedWord = word),
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField).first, 'bonjour');
    await tester.tap(find.text('Сгенерировать перевод'));
    await tester.pumpAndSettle();

    expect(find.text('привет'), findsOneWidget);

    await tester.tap(find.text('Сохранить'));
    await tester.pumpAndSettle();

    final result = savedWord;
    expect(result, isNotNull);
    expect(result!.word, 'bonjour');
    expect(result.translation, 'привет');
    expect(result.transcription, 'бонжур');
    expect(result.partOfSpeech, 'междометие');
    expect(result.usage, 'Bonjour ! - Привет!');
  });

  testWidgets('AI generation uses edited language settings', (tester) async {
    when(() => modelManager.isInstalled()).thenAnswer((_) async => true);
    when(() => modelManager.activateInstalledModel()).thenAnswer((_) async {});
    when(
      () => wordDraftService.generateWordDraft(
        input: 'hello',
        sourceLanguage: 'английский',
        targetLanguage: 'немецкий',
      ),
    ).thenAnswer(
      (_) async => const AiWordDraft(word: 'hello', translation: 'hallo'),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider(
            create: (_) => AiWordDraftBloc(
              modelManager: modelManager,
              wordDraftService: wordDraftService,
            ),
            child: const AiWordForm(),
          ),
        ),
      ),
    );

    final fields = find.byType(TextFormField);
    await tester.enterText(fields.at(0), 'hello');
    await tester.enterText(fields.at(2), 'английский');
    await tester.enterText(fields.at(3), 'немецкий');
    await tester.tap(find.text('Сгенерировать перевод'));
    await tester.pumpAndSettle();

    verify(
      () => wordDraftService.generateWordDraft(
        input: 'hello',
        sourceLanguage: 'английский',
        targetLanguage: 'немецкий',
      ),
    ).called(1);
    expect(find.text('hallo'), findsOneWidget);
  });

  testWidgets('AI dialog uses remembered language settings from bloc', (
    tester,
  ) async {
    final aiWordDraftBloc = MockAiWordDraftBloc();
    const rememberedState = AiWordDraftState(
      setupStatus: AiSetupStatus.installed,
      sourceLanguage: 'английский',
      targetLanguage: 'немецкий',
    );
    when(() => aiWordDraftBloc.state).thenReturn(rememberedState);
    whenListen(
      aiWordDraftBloc,
      const Stream<AiWordDraftState>.empty(),
      initialState: rememberedState,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<AiWordDraftBloc>.value(
          value: aiWordDraftBloc,
          child: const AddWordAIDialog(),
        ),
      ),
    );

    expect(find.text('английский'), findsOneWidget);
    expect(find.text('немецкий'), findsOneWidget);
  });
}
