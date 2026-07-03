# Flashcards Learning App

Flutter mobile app for learning languages with topic-based flashcards.

## Core Features

- Create topics and manage words inside each topic.
- Add, edit, and delete flashcards.
- Practice words from a topic.
- Track learned words and daily progress.
- Import words from JSON.
- Export and restore a full local JSON backup.
- Generate word drafts locally with an on-device AI model.
- In-dialog info panels explain topic creation, JSON import prompts, backup restore, and manual word creation.

## In-Dialog Help

Several dialogs include a top-right info button powered by `InfoButtonStack`.
These panels document required/optional fields and risky flows inline. The JSON
import panel also provides a copyable AI prompt and clearly marks the source
language, target language, and topic placeholders that users must fill before
generating a file.

## Local AI Word Drafts

The app has an additive local-AI flow for creating flashcard drafts. Manual word creation still works without downloading a model.

- Entry point: `lib/screens/topic_screen/widgets/add_word_ai_dialog.dart`
- Form: `lib/common_widgets/edit_form/ai_word_form.dart`
- Shared manual fields: `lib/common_widgets/edit_form/edit_form_fields.dart`
- Shared form controllers/mapping: `lib/common_widgets/edit_form/word_form_controllers.dart`
- Bloc: `lib/blocs/ai_word_draft_bloc/ai_word_draft_bloc.dart`
- Model config: `lib/core/local_ai_model_config.dart`

Current model:

- `Gemma 4 E2B`
- artifact: `gemma-4-E2B-it.litertlm`
- type: `ModelType.gemma4`
- approximate size: `2.6GB`
- downloaded just in time from Hugging Face through `flutter_gemma`

Flow:

1. User taps the separate AI assistant action from the topic screen.
2. `AddWordAIDialog` checks whether the model exists on device.
3. If missing, the dialog shows explicit download content with model size, privacy note, progress, and cancel/retry controls.
4. After install, the AI form is shown.
5. User enters a word or phrase and requests an AI draft.
6. The AI draft fills the form, but the user reviews/edits before saving.
7. Save reuses the existing topic word add path; AI output is never written directly to DB.

## Development Notes

- Local persistence uses Drift/SQLite.
- State management uses `flutter_bloc` and `get_it`.
- Navigation uses `auto_route`.
- The local AI feature uses `flutter_gemma` and `background_downloader`.
- Android foreground download setup is required for large model downloads.

Useful project docs:

- `PROJECT_CONTEXT.md`
- `BLOCS_CONTEXT.md`
- `TESTS_CONTEXT.md`
- `APP_DATABASE.md`
