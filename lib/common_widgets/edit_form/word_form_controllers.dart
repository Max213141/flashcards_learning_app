import 'package:flashcards_learning_app/entities/ai_word_draft.dart';
import 'package:flashcards_learning_app/entities/word.dart';
import 'package:flutter/material.dart';

class WordFormControllers {
  final TextEditingController learningWord = TextEditingController();
  final TextEditingController translation = TextEditingController();
  final TextEditingController transcription = TextEditingController();
  final TextEditingController partOfSpeech = TextEditingController();
  final TextEditingController usage = TextEditingController();

  WordFormControllers({Word? word}) {
    if (word == null) return;

    learningWord.text = word.word;
    translation.text = word.translation;
    transcription.text = word.transcription ?? '';
    partOfSpeech.text = word.partOfSpeech ?? '';
    usage.text = word.usage ?? '';
  }

  String get wordText => learningWord.text.trim();

  String get translationText => translation.text.trim();

  void applyDraft(AiWordDraft draft) {
    learningWord.text = draft.word;
    translation.text = draft.translation;
    transcription.text = draft.transcription ?? '';
    partOfSpeech.text = draft.partOfSpeech ?? '';
    usage.text = draft.usage ?? '';
  }

  Word toWord({Word? baseWord}) {
    final wordValue = wordText;
    final translationValue = translationText;
    final word =
        baseWord ?? Word(word: wordValue, translation: translationValue);

    return word.copyWith(
      word: wordValue,
      translation: translationValue,
      transcription: _normalizedOrNull(transcription.text),
      partOfSpeech: _normalizedOrNull(partOfSpeech.text),
      usage: _normalizedOrNull(usage.text),
    );
  }

  void dispose() {
    learningWord.dispose();
    translation.dispose();
    transcription.dispose();
    partOfSpeech.dispose();
    usage.dispose();
  }

  String? _normalizedOrNull(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
