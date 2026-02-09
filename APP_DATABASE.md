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
- `learned` (bool, default `false`)

## Key Queries / Helpers
- `createTopic(Topic topic)`  
  Inserts a topic using the `Topic` model.

- `createTopicIfMissing(String topicName)`  
  Looks up a topic by name, returns existing id or inserts a new topic.

- `insertWords(int topicId, List<Word> wordList)`  
  Batch inserts words for a topic.

- `createTopicWithWords({Topic topic, List<Word> words})`  
  Transactional insert of a topic + its words.

- `insertImportedWords(List<Word> words)`  
  Groups by `word.topic` and inserts words under matching/created topics.

- `getWordsForTopic(int topicId)`  
  Returns all words for a topic (used by topic screen).

- `getTopicName(int topicId)`  
  Returns the topic name or `null` if not found.

- `deleteWordById(int id)`  
  Deletes a word by its primary key.

- `watchTopicSummaries()`  
  Stream of aggregated topic info for the main list:
  - total words per topic
  - learned words per topic
  - ordered by newest first

## Notes
- The DB file is stored at `flashcards.sqlite` inside the app documents directory.
- Topic color is stored as nullable ARGB int (`color_value`).
- Progress is currently inferred from `words.learned` (no separate progress table yet).
