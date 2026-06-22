import 'package:flashcards_learning_app/entities/ai_word_draft.dart';

abstract interface class LocalAiWordDraftService {
  Future<AiWordDraft> generateWordDraft({
    required String input,
    required String sourceLanguage,
    required String targetLanguage,
  });
}
