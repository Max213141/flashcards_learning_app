class AiWordDraft {
  final String word;
  final String translation;
  final String? transcription;
  final String? partOfSpeech;
  final String? usage;

  const AiWordDraft({
    required this.word,
    required this.translation,
    this.transcription,
    this.partOfSpeech,
    this.usage,
  });
}
