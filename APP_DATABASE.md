# App Database (Drift)

This document describes the Drift-based local database used by the app.

## Location
- Source: `/Users/maksimkupcov/Projects/flashcards_learning_app/lib/data/local/app_database.dart`
- Generated code: `app_database.g.dart` (via `build_runner`)

## Tables
### Topics
- `id` (int, auto-increment, primary key)
- `name` (text, required)
- `color_value` (int, nullable)

### Words
- `id` (int, auto-increment, primary key)
- `topic_id` (int, nullable, FK → `topics.id`)
- `word` (text, required)
- `translation` (text, required)
- `topic_name` (text, required)
- `learned` (bool, default `false`)

### UserGoalsTable
- `id` (int, primary key; singleton row uses `1`)
- `overall_goal` (int, required)
- `daily_goal` (int, required)

## Key Queries / Helpers
- `createTopic(Topic topic)`  
  Inserts a topic using the `Topic` model.

- `createTopicIfMissing(String topicName)`  
  Looks up a topic by name, returns existing id or inserts a new topic.

- `insertWords({required int topicId, required String topicName, required List<Word> wordList})`  
  Batch inserts words for a topic.

- `createTopicWithWords({Topic topic, List<Word> words})`  
  Transactional insert of a topic + its words.

- `getWordsForTopic(int topicId)`  
  Returns all words for a topic (used by topic screen).

- `getTopicName(int topicId)`  
  Returns the topic name or `null` if not found.

- `getWordById(int wordId)`  
  Returns a single word with topic metadata or `null`.

- `getAllWordsWithTopicName()`  
  Returns all words with topic names (used for backup/export).

- `addWord(Word newWord)`  
  Inserts a new word into `words` table.

- `deleteWordById(int id)`  
  Deletes a word by its primary key.

- `updateWord(Word updatedWord)`  
  Updates an existing word by id.

- `deleteTopicWithWords(int topicId)`  
  Transactionally deletes all words from a topic, then deletes the topic.

- `saveUserGoals(UserGoals goals)`  
  Upserts user goals into `user_goals_table` (singleton row).

- `getUserGoals()`  
  Returns stored user goals or `null`.

- `getWordsProgressStats()`  
  Returns total words and learned words counters.

- `watchTopicSummaries()`  
  Stream of aggregated topic info for the main list:
  - total words per topic
  - learned words per topic
  - ordered by newest first

## Notes
- The DB file is stored at `flashcards.sqlite` inside the app documents directory.
- Topic color is stored as nullable ARGB int (`color_value`).
- Topic name is duplicated in `words.topic_name` for quick reads.
- Learning progress is inferred from `words.learned`.
