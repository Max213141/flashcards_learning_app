enum TopicSortOption { createdDesc, titleAsc, colorAsc }

class TopicSummary {
  final int id;
  final String topicName;
  final int? colorValue;
  final int totalWords;
  final int learnedWords;

  const TopicSummary({
    required this.id,
    required this.topicName,
    required this.colorValue,
    required this.totalWords,
    required this.learnedWords,
  });
}
