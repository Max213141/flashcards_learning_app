# App Database (Drift)

This document describes the current Drift-based local database and the backup/restore behavior implemented around it.

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
- `topic_id` (int, nullable, FK -> `topics.id`)
- `word` (text, required)
- `translation` (text, required)
- `topic_name` (text, required)
- `transcription` (text, nullable)
- `part_of_speech` (text, nullable)
- `usage` (text, nullable)
- `learned` (bool, default `false`)
- `learned_at` (datetime, nullable)

### UserGoalsTable

- `id` (int, primary key; singleton row uses `1`)
- `overall_goal` (int, required)
- `daily_goal` (int, required)

## Schema / Migration

- Current schema version: `1`

## Query / Helper Methods

- `createTopic(Topic topic)`
  Inserts a topic using the `Topic` entity.

- `watchTopicSummaries({TopicSortOption sortOption = TopicSortOption.createdDesc})`
  Streams topic aggregates for the main screen:
  - total words per topic
  - learned words per topic
  - supports sorting by created desc, title asc, color asc

- `createTopicIfMissing(String topicName)`
  Returns existing topic id by exact name or creates a new topic.

- `insertWords({required int topicId, required String topicName, required List<Word> wordList})`
  Batch-inserts words for a topic.
  Behavior:
  - trims required text fields
  - persists optional fields (`transcription`, `partOfSpeech`, `usage`)
  - persists optional `learnedAt`
  - converts blank optional strings to `null`

- `createTopicWithWords({required Topic topic, required List<Word> words})`
  Transactionally creates a topic and all of its words.

- `getTopicName(int topicId)`
  Returns topic name or `null`.

- `getWordById(int wordId)`
  Returns one `Word` with topic metadata, optional fields, and `learnedAt`.

- `getWordsForTopic(int topicId)`
  Returns all words for a topic, including `learnedAt`.

- `getAllWordsWithTopicName()`
  Returns all words for backup/export.
  Behavior:
  - includes topic name and optional fields
  - includes `learnedAt`
  - uses `COALESCE(NULLIF(TRIM(w.topic_name), ''), t.name)` so export falls back to topic table name if duplicated `topic_name` is blank
  - normalizes blank optional strings to `null`

- `deleteWordById(int id)`
  Deletes a single word by id.

- `addWord(Word newWord)`
  Inserts a new word.
  Behavior:
  - requires `topicId`
  - resolves topic name from `newWord.topic` or DB if needed
  - trims required text fields
  - persists optional `learnedAt`
  - normalizes optional fields to `null` when empty

- `updateWord(Word updatedWord)`
  Updates an existing word by id.
  Behavior:
  - trims required text fields
  - persists optional fields
  - persists optional `learnedAt`
  - allows clearing optional fields by writing `null`
  - updates duplicated `topic_name` when a non-empty topic string is provided

- `deleteTopicWithWords(int topicId)`
  Transactionally deletes all words in the topic, then deletes the topic row.

- `saveUserGoals(UserGoals goals)`
  Upserts the singleton user-goals row.

- `getUserGoals()`
  Returns stored user goals or `null`.

- `watchUserGoals()`
  Streams the singleton user-goals row for reactive UI updates.

- `getWordsProgressStats()`
  Returns:
  - `totalWords`
  - `learnedWords`

- `watchWordsProgressStats()`
  Streams:
  - `totalWords`
  - `learnedWords`
  - `learnedToday`
    Behavior:
  - `learnedToday` is computed from `words.learned_at`
  - counts rows where `learned_at` is between local start-of-day and the next midnight
  - returns zero values correctly when the `words` table is empty

- `restoreFromBackupJson(List<Map<String, dynamic>> backupJson)`
  Full database restore / replace operation.
  Behavior:
  - runs inside a transaction
  - fully clears:
    - `words`
    - `topics`
    - `user_goals_table`
  - creates topics from unique JSON `topic` values
  - uses default topic color `0xFFA89DEF` (lavender)
  - uses fallback topic name `Без темы` when JSON topic is missing/blank
  - inserts words linked to the newly created topic ids
  - validates required `word` and `translation` fields
  - accepts `learned` as:
    - `bool`
    - numeric `0` / non-zero
    - string `"true"`, `"false"`, `"1"`, `"0"`
  - accepts optional `learnedAt` as an ISO-8601 string when `learned = true`
  - returns restored word count

## Internal Normalization Rules

- `_normalizeNullableText(String? value)`
  - trims string values
  - converts blank strings to `null`

This helper is used by insert, update, export-read, and restore flows to keep optional text fields clean.

## Notes

- The SQLite file is stored as `flashcards.sqlite` in the app documents directory.
- Topic name is intentionally duplicated in `words.topic_name` for simple reads / export.
- Overall learning progress is inferred from `words.learned`.
- Daily learning progress is inferred from `words.learned_at`.
- The `Word` entity used by the DB includes:
  - `id`, `topicId`, `word`, `translation`, `topic`, `learned`, `learnedAt`
  - optional `transcription`, `partOfSpeech`, `usage`

## Related UI Flows

- Main screen backup export uses `getAllWordsWithTopicName()`.
- Main screen restore uses `restoreFromBackupJson(...)`.
- Topic screen create/edit flows use `addWord(...)` and `updateWord(...)`.
- Main-screen app bar uses `watchUserGoals()` and `watchWordsProgressStats()` for reactive overall/daily goal progress.
