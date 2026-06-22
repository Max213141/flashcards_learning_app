import 'dart:convert';

import 'package:flashcards_learning_app/entities/ai_word_draft.dart';

class AiWordDraftParser {
  const AiWordDraftParser();

  AiWordDraft parse(String response) {
    final decoded = jsonDecode(_extractJson(response));
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('AI response must be a JSON object');
    }
    return parseMap(decoded);
  }

  AiWordDraft parseMap(Map<String, dynamic> json) {
    final word = _requiredText(json, 'word');
    final translation = _requiredText(json, 'translation');

    return AiWordDraft(
      word: word,
      translation: translation,
      transcription: _optionalText(json['transcription']),
      partOfSpeech: _optionalText(json['partOfSpeech']),
      usage: _optionalText(json['usage']),
    );
  }

  String _extractJson(String response) {
    final trimmed = response.trim();
    if (trimmed.startsWith('{') && trimmed.endsWith('}')) {
      return trimmed;
    }

    final fenceMatch = RegExp(
      r'```(?:json)?\s*([\s\S]*?)\s*```',
      caseSensitive: false,
    ).firstMatch(trimmed);
    if (fenceMatch != null) {
      final fenced = fenceMatch.group(1)!.trim();
      if (fenced.startsWith('{') && fenced.endsWith('}')) {
        return fenced;
      }
    }

    final start = trimmed.indexOf('{');
    final end = trimmed.lastIndexOf('}');
    if (start >= 0 && end > start) {
      return trimmed.substring(start, end + 1);
    }

    throw const FormatException('AI response does not contain JSON');
  }

  String _requiredText(Map<String, dynamic> json, String key) {
    final value = _optionalText(json[key]);
    if (value == null) {
      throw FormatException('AI response is missing "$key"');
    }
    return value;
  }

  String? _optionalText(Object? value) {
    if (value == null) return null;
    if (value is! String) {
      throw const FormatException('AI response fields must be strings or null');
    }
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
