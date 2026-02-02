class Word {
  final String translation;
  final String word;
  final String? topic;

  const Word({required this.translation, required this.word, this.topic = ''});

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      translation: json['translation'] as String,
      word: json['word'] as String,
      topic: json["topic"],
    );
  }

  Map<String, dynamic> toJson() {
    return {'translation': translation, 'word': word, 'topic': topic ?? ''};
  }
}
