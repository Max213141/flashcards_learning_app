class Word {
  static const Object _unset = Object();

  final int? id;
  final int? topicId;
  final String word;
  final String translation;
  final String? topic;
  final String? transcription;
  final String? partOfSpeech;
  final String? usage;
  final bool learned;

  const Word({
    this.id,
    this.topicId,
    required this.word,
    required this.translation,
    this.topic,
    this.transcription,
    this.partOfSpeech,
    this.usage,
    this.learned = false,
  });

  Word copyWith({
    Object? id = _unset,
    Object? topicId = _unset,
    String? word,
    String? translation,
    Object? topic = _unset,
    Object? transcription = _unset,
    Object? partOfSpeech = _unset,
    Object? usage = _unset,
    bool? learned,
  }) {
    return Word(
      id: identical(id, _unset) ? this.id : id as int?,
      topicId: identical(topicId, _unset) ? this.topicId : topicId as int?,
      word: word ?? this.word,
      translation: translation ?? this.translation,
      topic: identical(topic, _unset) ? this.topic : topic as String?,
      transcription: identical(transcription, _unset)
          ? this.transcription
          : transcription as String?,
      partOfSpeech: identical(partOfSpeech, _unset)
          ? this.partOfSpeech
          : partOfSpeech as String?,
      usage: identical(usage, _unset) ? this.usage : usage as String?,
      learned: learned ?? this.learned,
    );
  }

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'] as String,
      translation: json['translation'] as String,
      topic: json['topic'] as String?,
      transcription: json['transcription'] as String?,
      partOfSpeech: json['partOfSpeech'] as String?,
      usage: json['usage'] as String?,
      learned: (json['learned'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'translation': translation,
      if (topic != null) 'topic': topic,
      if (transcription != null) 'transcription': transcription,
      if (partOfSpeech != null) 'partOfSpeech': partOfSpeech,
      if (usage != null) 'usage': usage,
      'learned': learned,
    };
  }
}
