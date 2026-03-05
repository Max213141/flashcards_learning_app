import 'package:flashcards_learning_app/data/local/topic_summary.dart';
import 'package:flashcards_learning_app/entities/topic.dart';
import 'package:flashcards_learning_app/entities/user_goals.dart';
import 'package:flashcards_learning_app/entities/word.dart';

Word makeWord({
  int? id = 1,
  int? topicId = 10,
  String word = 'hello',
  String translation = 'привет',
  String? topic = 'General',
  String? transcription,
  String? partOfSpeech,
  String? usage,
  bool learned = false,
  DateTime? learnedAt,
}) {
  return Word(
    id: id,
    topicId: topicId,
    word: word,
    translation: translation,
    topic: topic,
    transcription: transcription,
    partOfSpeech: partOfSpeech,
    usage: usage,
    learned: learned,
    learnedAt: learnedAt,
  );
}

Topic makeTopic({
  int? id = 10,
  String topicName = 'General',
  int? colorValue = 0xFFA89DEF,
}) {
  return Topic(id: id, topicName: topicName, colorValue: colorValue);
}

TopicSummary makeTopicSummary({
  int id = 10,
  String topicName = 'General',
  int? colorValue = 0xFFA89DEF,
  int totalWords = 5,
  int learnedWords = 2,
}) {
  return TopicSummary(
    id: id,
    topicName: topicName,
    colorValue: colorValue,
    totalWords: totalWords,
    learnedWords: learnedWords,
  );
}

UserGoals makeUserGoals({int overallGoal = 100, int dailyGoal = 10}) {
  return UserGoals(overallGoal: overallGoal, dailyGoal: dailyGoal);
}
