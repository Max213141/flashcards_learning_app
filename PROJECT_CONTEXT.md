# Project Context (Flashcards Learning App)

This document is the working reference for further development. It captures the current project structure, implemented UI flows, and the target feature set described by the owner.

## Product Summary
- Flutter app for learning languages with flashcards.
- Each flashcard has:
  - Front: word in the target language (the one the user wants to learn).
  - Back: translation in the user's native language.
- Target functionality:
  - Create topics by importing a JSON file chosen from the filesystem.
  - Create topics and word pairs manually.
  - Edit existing words inside topics.
  - Track learning progress.
  - Backup/restore all existing data.

## Current State (as of 2026-02-08)
- UI is largely prototyped.
- Persistence layer is now wired via Drift (SQLite) with topics/words tables.
- Main screen reads topics from the local DB and updates via a stream.
- JSON import is implemented in the "Create Topic" popup (file picker + parsing).
- Topic/Test screens still load words from `assets/mock_data.json`.
- No global state management beyond local widget state.
- Navigation uses `auto_route`.

## App Structure
Entry:
- `lib/main.dart`: creates `AppRouter`, runs `MyApp`.
- `lib/my_app.dart`: `MaterialApp.router` + app theme.

Routing:
- `lib/router/app_router.dart` + generated `app_router.gr.dart`.
- Routes:
  - `MainRoute` → main topics list.
  - `TopicRoute` → topic detail + words list.
  - `TestRoute` → practice/test screen with flashcard flip.
  - `EditWordRoute` → word edit form.

Screens:
- `lib/screens/main_screen/main_screen.dart`
  - Uses `AppBarWidget` stats header.
  - Topics list is driven by a DB stream.
  - Floating action button opens "Create Topic" popup.
- `lib/screens/topic_screen/topic_screen.dart`
  - Loads words from `assets/mock_data.json`.
  - Displays topic summary, progress, and list of words (slidable).
  - "Practice" and "Exam" buttons navigate to test screen.
- `lib/screens/test_screen/test_screen.dart`
  - Loads words from `assets/mock_data.json`.
  - Displays flip-card and usage section.
- `lib/screens/edit_word_screen/edit_word_screen.dart`
  - Form for word editing (controllers, no submit logic).
- `lib/screens/word_definition_screen/word_definition_screen.dart`
  - Detailed word view (currently static text in widget tree).

Entities:
- `lib/entities/word.dart`
  - `Word` model includes `id`, `topicId`, `word`, `translation`, `topic`, `learned`.
  - JSON mapping used by import, topic/test screens.
- `lib/entities/topic.dart`
  - `Topic` model with `topicName` and optional `colorValue` (ARGB int).

Data / Persistence:
- `lib/data/local/app_database.dart`
  - Drift DB with `Topics` and `Words` tables.
  - Helpers for topic creation and inserting imported words.
  - `watchTopicSummaries()` returns a stream for the main topics list.
- `lib/data/local/topic_summary.dart`
  - DTO for topic list aggregation (total/learned words).

Shared UI:
- `lib/design/colors.dart`: color palette + text styles.
- `lib/common_widgets/*`: reusable buttons, progress UI.
- `lib/common_widgets/app_bar.dart`: stats header widget used on main screen.
- `lib/utils/*`: card clipping, custom painters, swipe/flip utilities.
- `lib/screens/main_screen/widgets/create_topic_popup.dart`: topic creation popup.

Assets:
- `assets/mock_data.json`: current word list seed.
- `assets/iconss/*`: SVG icons.
- `fonts/*`: Jost font family.

Dependencies:
- `auto_route`, `auto_route_generator`
- `flutter_svg`
- `flutter_slidable`
- `drift`, `drift_flutter`, `drift_dev`
- `path`, `path_provider`
- `file_picker`

## Gaps vs Target Features
Not yet implemented:
- Backup/restore of all data.
- Full CRUD flows wired to DB (edit/delete topics/words).
- Progress tracking data model and UI wiring.
- Routing parameters (topic IDs, word IDs).
- Business logic separation (repository/service layer).

## Data Model (current + direction)
- Topic (current):
  - `id`, `topicName`, `colorValue` (nullable ARGB int).
- Word (current):
  - `id`, `topicId`, `word`, `translation`, `topic`, `learned`.
This can be extended later to include:
- Topic:
  - `id`, `title`, `createdAt`, `updatedAt`
  - `source` (manual or imported file)
  - `stats` (progress, total words, mastered count)
- Word:
  - `id`, `topicId`
  - `word` (target language)
  - `translation` (native language)
  - Optional: `transcription`, `lexicalCategory`, `usage`, `notes`
- Progress:
  - `wordId`, `status` (new/learning/mastered)
  - `lastReviewedAt`, `reviewCount`

## Implementation Notes (for future work)
- Replace `assets/mock_data.json` usage in topic/test screens with DB-backed repos.
- Pass topic and word identifiers through routes (`auto_route` args).
- Add repository/service layer to separate UI from DB.
- Use a state management solution when flows grow (e.g., Riverpod, Bloc, or a minimal notifier).
- Add error handling and empty states for all data screens.
- Extract strings for localization if multi-language UI is expected.

## JSON Import Expectations (owner request)
- User selects a JSON file from filesystem.
- File defines topics and word pairs.
- Import should create or merge topics based on chosen strategy.
- Implemented in "Create Topic" popup; suggestions list auto-fills topic name.

## Backup/Restore Expectations (owner request)
- Backup: export all topics, words, and progress into a JSON file.
- Restore: import backup JSON and replace or merge data.

## Suggested Next Steps
1. Run Drift codegen: `flutter pub run build_runner build --delete-conflicting-outputs`.
2. Wire Topic/Test screens to DB instead of `assets/mock_data.json`.
3. Add edit/delete flows for topics and words.
4. Implement backup/export and restore flows.
5. Connect progress tracking to test/practice screens.
