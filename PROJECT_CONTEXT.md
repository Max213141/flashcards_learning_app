# Project Context (Flashcards Learning App)

This document is the working reference for current development. It reflects the latest uncommitted app state in the workspace.

## Product Summary

- Flutter app for learning languages with flashcards.
- Each flashcard contains:
  - front: target-language word
  - back: translation
- Current core feature set:
  - create topics
  - import words from JSON
  - add/edit/delete words inside a topic
  - practice words from a topic
  - backup all words to JSON
  - restore backup JSON by fully replacing local data

## Current State (as of 2026-02-28)

- Local persistence is implemented with Drift (SQLite).
- Main screen topic list is DB-backed and driven by a stream.
- Topic screen is DB-backed and loads words by `topicId`.
- Test screen is DB-backed and loads words by `topicId`.
- Single-word create/edit flows are wired to the database.
- Backup export is implemented from current DB data.
- Backup restore is implemented as a full replace operation (delete existing local data, recreate topics + words from backup JSON).
- Main-screen goal widgets are now reactive and update from DB streams.
- No app-wide state management layer is used; screens rely on local widget state and DB reads.
- Navigation uses `auto_route`.

## App Structure

Entry:

- `lib/main.dart`: app entry point
- `lib/my_app.dart`: `MaterialApp.router` setup

Routing:

- `lib/router/app_router.dart`
- `lib/router/app_router.gr.dart`
- Routes currently in active use include:
  - `MainRoute`
  - `TopicRoute`
  - `TestRoute`
  - `EditWordRoute`

## Key Screens

- `lib/screens/main_screen/main_screen.dart`
  - Reads topic summaries from `AppDatabase.watchTopicSummaries(...)`
  - Supports sorting topic list
  - Exports backup JSON
  - Restores backup JSON after confirmation dialog
  - Opens topic-creation popup from the FAB menu

- `lib/screens/main_screen/widgets/app_bar_customized_widget.dart`
  - Reads user goals from `AppDatabase.watchUserGoals()`
  - Reads overall + daily progress from `AppDatabase.watchWordsProgressStats()`
  - Refreshes the daily-progress stream again at local midnight so the daily counter resets without reopening the screen

- `lib/screens/topic_screen/topic_screen.dart`
  - Loads words from `AppDatabase.getWordsForTopic(topicId)`
  - Supports:
    - add single word
    - import words from JSON into current topic
    - edit word
    - delete word
    - delete topic
  - Recomputes progress from `Word.learned`

- `lib/screens/test_screen/test_screen.dart`
  - Loads words from DB using `topicId`
  - No longer depends on `assets/mock_data.json` for the main topic practice flow

- `lib/screens/edit_word_screen/edit_word_screen.dart`
  - Uses shared `EditWordForm`
  - Saves changes through `AppDatabase.updateWord(...)`

- `lib/screens/word_definition_screen/word_definition_screen.dart`
  - Additional word details UI
  - Toggling the learned state is now the main place that sets or clears `Word.learnedAt`

## Entities

- `lib/entities/word.dart`
  - Fields:
    - `id`
    - `topicId`
    - `word`
    - `translation`
    - `topic`
    - `transcription` (optional)
    - `partOfSpeech` (optional)
    - `usage` (optional)
    - `learned`
    - `learnedAt` (optional)
  - `copyWith(...)` uses an internal `_unset` sentinel so nullable fields can be explicitly cleared to `null`
  - JSON mapping is used for import/export flows
  - `learnedAt` is serialized as an ISO-8601 string when present

- `lib/entities/topic.dart`
  - Fields:
    - `id`
    - `topicName`
    - `colorValue`

## Data / Persistence

- `lib/data/local/app_database.dart`
  - Drift DB with:
    - `Topics`
    - `Words`
    - `UserGoalsTable`
  - Schema version: `3`
  - Migrations add optional word fields:
    - `transcription`
    - `part_of_speech`
    - `usage`
    - `learned_at`
  - DB methods now cover:
    - topic creation
    - topic summaries with sorting
    - batch word insert
    - add/update/delete word
    - delete topic with its words
    - reactive user goals stream
    - reactive overall + daily progress stream
    - backup export reads
    - full backup restore / replace
  - Daily progress is based on `words.learned_at` for the current local day

- `lib/data/local/topic_summary.dart`
  - DTO for main-screen topic list aggregation

- Detailed DB reference:
  - `/Users/maksimkupcov/Projects/flashcards_learning_app/APP_DATABASE.md`

- Detailed Bloc reference:
  - `/Users/maksimkupcov/Projects/flashcards_learning_app/BLOCS_CONTEXT.md`

- Detailed Test reference:
  - `/Users/maksimkupcov/Projects/flashcards_learning_app/TESTS_CONTEXT.md`

## Shared UI

- `lib/common_widgets/widgets.dart`
  - central exports for shared widgets
  - now exports:
    - `edit_form/edit_word_form.dart`
    - `edit_form/edit_form_fields.dart`
    - popup and action widgets

- `lib/common_widgets/edit_form/`
  - contains the word edit form split into:
    - `edit_word_form.dart`
    - `edit_form_fields.dart`

- `lib/screens/main_screen/widgets/`
  - contains topic list UI, sort widgets, create-topic popup, and restore confirmation body

## Assets

- `assets/iconss/*`
- `fonts/*`

## Dependencies

- `auto_route`, `auto_route_generator`
- `flutter_svg`
- `flutter_slidable`
- `drift`, `drift_flutter`, `drift_dev`
- `path`, `path_provider`
- `file_picker`

## Backup / Restore Behavior

- Backup:
  - exports all words from DB as JSON
  - includes required fields:
    - `word`
    - `translation`
    - `learned`
  - includes optional fields only when non-empty:
    - `topic`
    - `transcription`
    - `partOfSpeech`
    - `usage`
    - `learnedAt`

- Restore:
  - user confirms destructive action first
  - user picks a JSON file
  - app fully clears local DB data
  - topics are recreated from JSON `topic` names with default lavender color
  - words are inserted and linked to recreated topic ids
  - main topic stream is refreshed after restore

## Known Gaps / Risks

- Backup restore currently clears `user_goals_table` as part of the full DB replace.
- Topic colors are not preserved by backup/restore; restored topics use the default lavender color.
- There is still no repository/service layer between UI and Drift.
- The app bar uses nested `StreamBuilder`s plus a timer-based midnight refresh; this works, but it is still widget-driven state rather than a dedicated reactive view model.
- Some screens/widgets outside the touched flows may still need documentation cleanup.

## Uncommitted Workspace Notes

- There are many additional uncommitted UI and Android/iOS changes in the workspace besides the DB/backup work.
- This document is aligned to the current DB and backup/restore related code paths, not a full audit of every modified file in the repo.

## Suggested Next Steps

1. Run Drift/codegen if `app_database.dart` changes again: `flutter pub run build_runner build --delete-conflicting-outputs`.
2. Decide whether backup/restore should preserve user goals and topic colors.
3. Add tests for backup export and full restore validation.
4. Consider moving DB orchestration out of widgets into a repository/service layer.
