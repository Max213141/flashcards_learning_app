class Word {
  final String originWord;
  final String translatedWord;
  final String? topic;

  const Word({
    required this.originWord,
    required this.translatedWord,
    this.topic = '',
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      originWord: json['originWord'] as String,
      translatedWord: json['translatedWord'] as String,
      topic: json["topic"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'originWord': originWord,
      'translatedWord': translatedWord,
      'topic': topic ?? '',
    };
  }
}
