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
  - add word drafts with a local AI assistant
  - practice words from a topic
  - backup all words to JSON
  - restore backup JSON by fully replacing local data

## Current State (as of 2026-06-22)

- Local persistence is implemented with Drift (SQLite).
- Main screen topic list is DB-backed and driven by a stream.
- Topic screen is DB-backed and loads words by `topicId`.
- Test screen is DB-backed and loads words by `topicId`.
- Single-word create/edit flows are wired to the database.
- Topic screen has separate manual and AI-assisted add-word flows.
- Manual word creation, topic creation/JSON import, and backup restore dialogs now include reusable in-dialog info panels.
- Local AI setup is implemented with `flutter_gemma` and an explicit just-in-time model download step.
- Current local AI model is `Gemma 4 E2B` (`gemma-4-E2B-it.litertlm`, `ModelType.gemma4`, about `2.6GB`).
- AI-generated drafts fill the add-word form only after user review; DB saving still goes through `TopicDetailBloc.addWordRequested`.
- Backup export is implemented from current DB data.
- Backup restore is implemented as a full replace operation (delete existing local data, recreate topics + words from backup JSON).
- Main-screen goal widgets are now reactive and update from DB streams.
- Feature workflows use `flutter_bloc` blocs registered through `get_it`.
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
  - Topic creation and restore dialogs expose top-right info panels. The JSON import panel includes a copyable AI prompt and warns users to fill source language, target language, and topic placeholders before use.

- `lib/screens/main_screen/widgets/app_bar_customized_widget.dart`
  - Reads user goals from `AppDatabase.watchUserGoals()`
  - Reads overall + daily progress from `AppDatabase.watchWordsProgressStats()`
  - Refreshes the daily-progress stream again at local midnight so the daily counter resets without reopening the screen

- `lib/screens/topic_screen/topic_screen.dart`
  - Loads words from `AppDatabase.getWordsForTopic(topicId)`
  - Supports:
    - add single word
    - add word with local AI assistant
    - import words from JSON into current topic
    - edit word
    - delete word
    - delete topic
  - Recomputes progress from `Word.learned`
  - Manual add-word dialog includes a top-right info panel explaining required word/translation fields and optional additional fields.

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
  - Schema version: `1`
  - Migrations are intentionally not active yet because the app has not been released; during development, test devices are cleared/reinstalled after local schema changes instead.
  - Previous local schema iterations added optional word fields:
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

## Local AI Word Draft Feature

- The local AI feature is additive. Manual add/edit flows must keep working without any downloaded model.
- `lib/screens/topic_screen/widgets/topic_screen_view.dart`
  - exposes separate FAB menu actions for manual word add and AI assistant add.
  - reuses the topic-screen `AiWordDraftBloc` when opening `AddWordAIDialog`, so source/target language settings survive dialog close/reopen while the topic screen remains alive.
- `lib/screens/topic_screen/widgets/add_word_dialog.dart`
  - simple manual add-word dialog using `EditWordForm`.
- `lib/screens/topic_screen/widgets/add_word_ai_dialog.dart`
  - consumes the topic-screen `AiWordDraftBloc` before showing the AI word form.
  - model presence is checked by `TopicScreenView` dispatching `AiWordDraftEvent.started()` when the dialog opens.
  - if the model is missing, shows in-dialog download content with model name, size, local privacy note, progress bar, cancel, and retry.
  - when the model is installed/ready, shows `AiWordForm`.
- `lib/common_widgets/edit_form/edit_word_form.dart`
  - manual-only word form.
- `lib/common_widgets/edit_form/ai_word_form.dart`
  - AI-assisted word form shown after model setup.
  - lets the user enter source/target languages and generate a draft.
  - applies successful AI draft values to shared word fields.
- `lib/common_widgets/edit_form/edit_form_fields.dart`
  - shared word field UI used by both manual and AI forms.
- `lib/common_widgets/edit_form/word_form_controllers.dart`
  - shared controller lifecycle, draft application, normalization, and `Word` mapping.
- `lib/common_widgets/edit_form/ai_drafts_controls.dart`
  - post-setup AI controls only; model download UI belongs to `AddWordAIDialog`.
  - owns the visible source/target language text controllers and syncs changes into `AiWordDraftBloc` state so language settings are remembered while the AI assistant flow is active.
- `lib/core/local_ai_model_config.dart`
  - central model metadata: display name, approximate size, file name, download URL, model type, and file type.
- `lib/ai/flutter_gemma_model_manager.dart`
  - checks install status, configures Android foreground download notification, requests notification permission where needed, installs/cancels the model, activates the installed model, and performs best-effort cleanup for incomplete model installs.
  - `cleanupIncompleteInstall()` only runs when the configured model is not installed; it uses `flutter_gemma` storage cleanup and exact configured-model deletion so partial/corrupt model files do not keep consuming device storage after failed or cancelled downloads.
- `lib/ai/flutter_gemma_word_draft_service.dart`
  - loads the active model with GPU preference and CPU fallback.
  - prompts for strict JSON and retries once with a repair prompt if parsing fails.
- `lib/entities/ai_word_draft.dart` and `lib/utils/ai_word_draft_parser.dart`
  - internal draft DTO plus JSON validation/normalization.

Failure behavior:

- Download failure keeps the add form unavailable and allows retry.
- Before each model download attempt, the bloc asks the model manager to clean any previous incomplete install.
- Download failure and downloader-reported cancellation trigger incomplete-install cleanup before returning to failure/cancelled setup state.
- User cancellation returns to setup state without generating.
- Model load or generation failure is surfaced as a snackbar/form message and does not affect manual add flow.
- User-entered text and model output should not be logged to analytics/crash reporting.

## Reference Documents

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
    - `info_button_stack.dart`
    - `edit_form/edit_word_form.dart`
    - `edit_form/edit_form_fields.dart`
    - `edit_form/ai_word_form.dart`
    - popup and action widgets

- `lib/common_widgets/info_button_stack.dart`
  - reusable wrapper for dialog content with a top-right info button

- `lib/common_widgets/edit_form/`
  - contains shared manual and AI-assisted word form pieces:
    - `edit_word_form.dart`
    - `ai_word_form.dart`
    - `edit_form_fields.dart`
    - `ai_drafts_controls.dart`
    - `word_form_controllers.dart`

- `lib/screens/main_screen/widgets/`
  - contains topic list UI, sort widgets, create-topic popup, restore confirmation body, and their info-panel widgets

- `lib/screens/topic_screen/widgets/add_word_info_widget/`
  - contains the manual add-word info panel and row widget

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
- `flutter_bloc`, `bloc`
- `get_it`
- `flutter_gemma`
- `background_downloader`

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
- There is still no repository/service layer between blocs and Drift.
- The app bar uses nested `StreamBuilder`s plus a timer-based midnight refresh; this works, but it is still widget-driven state rather than a dedicated reactive view model.
- Local AI model size is large (`~2.6GB`), so first setup needs a clear user consent and reliable foreground download behavior.
- Local AI is text-only; vision/image support is out of scope for the current iteration.
- Some screens/widgets outside the touched flows may still need documentation cleanup.

## Uncommitted Workspace Notes

- There are many additional uncommitted UI and Android/iOS changes in the workspace besides the DB/backup work.
- This document is aligned to the current DB and backup/restore related code paths, not a full audit of every modified file in the repo.

## Suggested Next Steps

1. Run Drift/codegen if `app_database.dart` changes again: `flutter pub run build_runner build --delete-conflicting-outputs`.
2. Decide whether backup/restore should preserve user goals and topic colors.
3. Add tests for backup export and full restore validation.
4. Consider moving DB orchestration out of blocs into a repository/service layer.
5. Measure local AI model download/load behavior on target devices.
