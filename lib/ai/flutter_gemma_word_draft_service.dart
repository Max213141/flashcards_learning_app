import 'dart:convert';

import 'package:flashcards_learning_app/utils/ai_word_draft_parser.dart';
import 'package:flashcards_learning_app/core/interfaces/ai/local_ai_word_draft_service.dart';
import 'package:flashcards_learning_app/core/local_ai_model_config.dart';
import 'package:flashcards_learning_app/entities/ai_word_draft.dart';
import 'package:flutter_gemma/flutter_gemma.dart';

class FlutterGemmaWordDraftService implements LocalAiWordDraftService {
  final AiWordDraftParser _parser;

  FlutterGemmaWordDraftService({
    AiWordDraftParser parser = const AiWordDraftParser(),
  }) : _parser = parser;

  @override
  Future<AiWordDraft> generateWordDraft({
    required String input,
    required String sourceLanguage,
    required String targetLanguage,
  }) async {
    final prompt = _buildPrompt(
      input: input,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
    );
    final firstResponse = await _generate(prompt);
    try {
      return _parser.parse(firstResponse);
    } on FormatException {
      final repairedResponse = await _generate(
        _buildRepairPrompt(firstResponse),
      );
      return _parser.parse(repairedResponse);
    }
  }

  Future<String> _generate(String prompt) async {
    final model = await _getActiveModel();
    final chat = await model.createChat(
      temperature: 0.2,
      topK: 1,
      modelType: LocalAiModelConfig.modelType,
      isThinking: false,
      supportsFunctionCalls: false,
    );
    await chat.addQueryChunk(Message.text(text: prompt, isUser: true));
    final response = await chat.generateChatResponse();
    return switch (response) {
      TextResponse(:final token) => token,
      FunctionCallResponse(:final args) => _parserCompatibleJson(args),
      ParallelFunctionCallResponse(:final calls) when calls.isNotEmpty =>
        _parserCompatibleJson(calls.first.args),
      ThinkingResponse(:final content) => content,
      ParallelFunctionCallResponse() => '',
    };
  }

  Future<InferenceModel> _getActiveModel() async {
    try {
      return await FlutterGemma.getActiveModel(
        maxTokens: 2048,
        preferredBackend: PreferredBackend.gpu,
      );
    } catch (_) {
      return FlutterGemma.getActiveModel(
        maxTokens: 2048,
        preferredBackend: PreferredBackend.cpu,
      );
    }
  }

  String _buildPrompt({
    required String input,
    required String sourceLanguage,
    required String targetLanguage,
  }) {
    return '''
You create flashcard data for a language learning app.

Input:
- Text: "$input"
- Source language: "$sourceLanguage"
- Target language: "$targetLanguage"

Return only valid JSON with this exact shape:
{
  "word": "source word or phrase",
  "translation": "target-language translation",
  "transcription": "optional transcription or null",
  "partOfSpeech": "optional part of speech or null",
  "usage": "one short example sentence plus translation or null"
}

Rules:
- "word" must stay in the source language.
- "translation" must be in the target language.
- "usage" should contain one short example sentence and its translation.
- Use null for unknown optional values.
- Do not include markdown.
- Do not include explanations outside JSON.
''';
  }

  String _buildRepairPrompt(String invalidResponse) {
    return '''
Convert the following response into only valid JSON with this exact shape:
{
  "word": "source word or phrase",
  "translation": "target-language translation",
  "transcription": "optional transcription or null",
  "partOfSpeech": "optional part of speech or null",
  "usage": "one short example sentence plus translation or null"
}

Response:
$invalidResponse
''';
  }

  String _parserCompatibleJson(Map<String, dynamic> args) {
    return jsonEncode(args);
  }
}
