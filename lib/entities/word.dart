class Word {
  final int? id;
  final int? topicId;
  final String word;
  final String translation;
  final String? topic;
  final bool learned;

  const Word({
    this.id,
    this.topicId,
    required this.word,
    required this.translation,
    this.topic,
    this.learned = false,
  });

  Word copyWith({
    int? id,
    int? topicId,
    String? word,
    String? translation,
    String? topic,
    bool? learned,
  }) {
    return Word(
      id: id ?? this.id,
      topicId: topicId ?? this.topicId,
      word: word ?? this.word,
      translation: translation ?? this.translation,
      topic: topic ?? this.topic,
      learned: learned ?? this.learned,
    );
  }

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'] as String,
      translation: json['translation'] as String,
      topic: json['topic'] as String?,
      learned: (json['learned'] as bool?) ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'translation': translation,
      if (topic != null) 'topic': topic,
      'learned': learned,
    };
  }
}
