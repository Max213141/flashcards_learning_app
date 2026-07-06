# Bloc Layer Context

This file documents the current bloc layer used by the app. It reflects the active uncommitted workspace state, including topic/word workflows, backup/restore, goals, locale switching, tests, and local AI setup/generation.

## General Rules

- All feature blocs are intended to be created through `getIt`.
- Feature blocs are registered as factories and provided at the nearest feature boundary.
- UI keeps navigation, dialogs, and snackbars.
- Blocs own database access, JSON parsing, subscriptions, timers, and workflow orchestration.
- Transient success and failure effects are reset with `statusConsumed()` where needed.

## TopicBloc

**Purpose**

Owns the `MainScreen` topic list and sorting state.

**Main responsibilities**

- Subscribes to `AppDatabase.watchTopicSummaries(...)`
- Tracks the selected sort option
- Re-subscribes when sort changes
- Re-subscribes on explicit refresh
- Preserves previous list data during reload

**Events**

- `started()`: initializes the topic stream subscription
- `sortChanged(sortOption)`: switches the sort and re-subscribes
- `refreshRequested()`: forces re-subscription with current sort
- `topicsUpdated(selectedSort, topics)`: internal event emitted from the stream listener
- `subscriptionFailed(selectedSort, message)`: internal event emitted from stream errors

**States**

- `initial(selectedSort)`
- `loading(selectedSort, previousTopics)`
- `loaded(selectedSort, topics)`
- `error(selectedSort, message, previousTopics)`

**Main logic**

- On `started`, the bloc subscribes using the default or current sort.
- On `sortChanged`, it cancels the previous subscription and starts a new one.
- Stream emissions are converted into explicit `loaded` states.
- Stream failures are converted into explicit `error` states.
- The bloc cancels its `StreamSubscription` in `close()`.

## TopicCreationBloc

**Purpose**

Owns the create-topic dialog flow on `MainScreen`.

**Main responsibilities**

- Manages topic name and selected color
- Imports words from JSON
- Extracts topic name suggestions from imported words
- Creates a topic and optionally creates imported words in that topic

**Events**

- `nameChanged(name)`: updates the topic name
- `colorChanged(colorValue)`: updates the selected color int
- `topicSuggestionSelected(name)`: applies a suggested name from imported JSON
- `jsonImportRequested()`: picks and parses a JSON file
- `createSubmitted()`: validates and creates the topic
- `statusConsumed()`: clears transient success or failure state
- `resetRequested()`: resets the form to defaults

**State**

Single state object with:

- `name`
- `selectedColorValue`
- `importedWords`
- `topicSuggestions`
- `isLoading`
- `status`
- `message`

**Statuses**

- `idle`
- `importingJson`
- `ready`
- `creating`
- `success`
- `failure`

**Main logic**

- Validates that topic name is not empty before creation.
- Uses `PickerUtil.pickJson()` for import.
- Validates that imported JSON is a list of objects.
- Converts JSON items to `Word`.
- Extracts unique non-empty topic names and can prefill the form name.
- Calls `AppDatabase.createTopicWithWords(...)`.
- Keeps dialog side effects in UI; the UI reacts to `success` and `failure`.

## BackupBloc

**Purpose**

Owns backup export and restore workflows for `MainScreen`.

**Main responsibilities**

- Exports all words to a JSON backup file
- Restores words from a picked JSON backup file
- Normalizes backup JSON payloads

**Events**

- `exportRequested()`: starts backup export
- `restoreRequested()`: starts backup restore
- `statusConsumed()`: returns the bloc to idle after UI consumes the effect

**States**

- `idle()`
- `processing(operation)`
- `exportSuccess(message)`
- `restoreSuccess(restoredWordsCount, message)`
- `failure(message)`

**Operations**

- `export`
- `restore`

**Main logic**

- On export, fetches all words with topics from `AppDatabase.getAllWordsWithTopicName()`.
- Serializes words into a normalized backup JSON shape.
- Uses `FilePicker.platform.saveFile(...)` and writes the resulting file.
- On restore, uses `PickerUtil.pickJson()`.
- Validates that the payload is a list of maps.
- Calls `AppDatabase.restoreFromBackupJson(...)`.
- Emits explicit success states so UI can show snackbars and refresh topic data.

## GoalsBloc

**Purpose**

Owns the `MainScreen` header goals and learning progress flow.

**Main responsibilities**

- Subscribes to saved user goals
- Subscribes to words progress statistics
- Refreshes progress subscription after midnight to keep daily progress correct
- Saves edited goals from the dialog

**Events**

- `started()`: starts subscriptions and schedules midnight refresh
- `goalsUpdated(goals)`: internal event emitted from goals stream updates
- `progressUpdated(progressStats)`: internal event emitted from progress stream updates
- `saveRequested(totalGoal, dailyGoal)`: validates and saves user goals
- `midnightRefreshTriggered()`: internal timed refresh event
- `failureOccurred(message)`: internal event for stream failures
- `statusConsumed()`: clears transient status after UI handles it

**State**

Single state object with:

- `currentGoals`
- `progressStats`
- `totalGoalInput`
- `dailyGoalInput`
- `isLoading`
- `isSaving`
- `status`
- `message`

**Statuses**

- `initial`
- `loading`
- `readyWithoutGoals`
- `readyWithGoals`
- `saving`
- `saveSuccess`
- `failure`

**Main logic**

- Subscribes to `AppDatabase.watchUserGoals()`.
- Subscribes to `AppDatabase.watchWordsProgressStats()`.
- Maintains a `Timer` that fires at the next midnight and re-subscribes to refresh daily counters.
- Parses dialog inputs to integers before saving.
- Calls `AppDatabase.saveUserGoals(...)`.
- Cancels both stream subscriptions and the timer in `close()`.

## LocaleBloc

**Purpose**

Owns the app-wide selected UI locale.

**Main responsibilities**

- Loads the persisted locale from `AppLocalePreferences`
- Persists user-selected locale changes
- Emits the active `Locale` so `MaterialApp.router` rebuilds with the selected l10n
- Falls back to the default English locale for unsupported language codes

**Events**

- `started()`: loads the currently stored locale from preferences
- `localeChanged(locale)`: validates, persists, and emits a newly selected locale

**State**

Single state object with:

- `locale`

**Main logic**

- The bloc starts with an injected initial locale, usually the value read in `main.dart` before `runApp`.
- `MyApp` provides `LocaleBloc` above `MaterialApp.router` and reads `state.locale` for the `locale` property.
- `AppLocalePreferences.supportedLocaleOrDefault(...)` normalizes locales and limits supported language codes to English and Russian.
- Selecting the already-active locale emits no new state.

**UI integration**

- `MainScreenView` exposes `LanguageSwitchButton` in the app bar.
- `LanguageSwitchButton` dispatches `LocaleEvent.localeChanged(...)`.
- The popup is styled with `AppConst` colors and rounded borders; local `Theme` overrides remove the default grey Material splash/highlight while pressing menu items.

## TopicDetailBloc

**Purpose**

Owns the `TopicScreen` topic-specific workflow.

**Main responsibilities**

- Loads all words for a topic
- Reloads after changes
- Adds a word to the topic
- Imports words into the topic from JSON
- Deletes the topic and its words
- Tracks whether the screen has changes

**Events**

- `started(topicId, topicName)`: initializes the feature
- `reloadRequested()`: reloads the topic words
- `addWordRequested(newWord)`: adds a single word
- `importWordsRequested()`: imports words from JSON
- `deleteTopicRequested()`: deletes the topic
- `statusConsumed()`: clears transient state after UI handles it

**State**

Single state object with:

- `topicId`
- `topicName`
- `words`
- `isLoading`
- `hasChanges`
- `status`
- `message`

**Statuses**

- `initial`
- `loading`
- `ready`
- `processing`
- `topicDeleted`
- `failure`

**Main logic**

- Loads words with `AppDatabase.getWordsForTopic(topicId)`.
- Adds words with `AppDatabase.addWord(...)`.
- Imports JSON through `PickerUtil.pickJson()` and converts items to `Word`.
- Inserts imported words with `AppDatabase.insertWords(...)`.
- Deletes the topic with `AppDatabase.deleteTopicWithWords(topicId)`.
- Sets `hasChanges` when the topic content changes or the topic is deleted.
- Leaves navigation after topic deletion to the UI layer.

## AiWordDraftBloc

**Purpose**

Owns local AI model setup and AI word draft generation for the add-word AI assistant flow.
The bloc is provided at the `TopicScreen` boundary and reused by `AddWordAIDialog`
with `BlocProvider.value`, so source/target language settings survive dialog
close/reopen while the topic screen stays mounted.

**Main responsibilities**

- Checks whether the configured local model is installed on device.
- Drives the setup-first AI dialog state before the AI form is shown.
- Downloads the model with determinate progress and cancellation support.
- Requests best-effort cleanup of incomplete local model installs before retrying downloads and after failed/cancelled download attempts.
- Activates the installed model before generation.
- Generates an `AiWordDraft` from user input and language settings.
- Keeps AI output as a draft only; final DB saving remains a user-reviewed form save through `TopicDetailBloc.addWordRequested`.

**Events**

- `started()`: checks whether the local model is installed.
- `languageSettingsChanged(sourceLanguage, targetLanguage)`: remembers the current source/target language fields while the AI form is active.
- `generateRequested(input)`: prepares the model and generates a draft for the entered word or phrase using the remembered source/target language settings from state.
- `downloadAccepted()`: starts model download. This supports both setup-only download from `AddWordAIDialog` and download-then-generate when a generation request is already pending.
- `downloadCancelled()`: cancels the in-flight model download if present.
- `statusConsumed()`: clears transient draft/message state after UI consumes it.

**State**

Single state object with:

- `setupStatus`
- `generationStatus`
- `downloadProgress`
- `sourceLanguage`
- `targetLanguage`
- `draft`
- `message`
- `pendingInput`
- `pendingSourceLanguage`
- `pendingTargetLanguage`

**Setup statuses**

- `initial`
- `checking`
- `notInstalled`
- `downloadConfirmationRequired`
- `downloading`
- `installed`
- `loadingModel`
- `ready`
- `failure`
- `cancelled`

**Generation statuses**

- `idle`
- `generating`
- `success`
- `failure`

**Main logic**

- On `started`, calls `LocalAiModelManager.isInstalled()`.
- If installed, emits `installed`; the dialog can show the AI form.
- If missing, emits `notInstalled`; the dialog shows model setup content.
- On `languageSettingsChanged`, stores source and target language input in bloc state. Defaults are `auto` and `русский`.
- On `generateRequested`, trims remembered source/target languages, falls back to defaults for empty values, stores the normalized values in both visible language state and pending generation state, then checks model availability.
- Before `downloadAccepted` starts a new install, calls `LocalAiModelManager.cleanupIncompleteInstall()` so stale partial files from an earlier unfinished download are removed when possible.
- On setup-only `downloadAccepted`, installs the model and emits `installed` without triggering generation.
- On generation `downloadAccepted`, installs the model and continues into activation/generation with the pending input.
- During download, progress callbacks emit `downloading(progress)`.
- If the install future fails or reports cancellation, calls `cleanupIncompleteInstall()` before emitting `failure` or `cancelled`.
- On generation, activates the model through `LocalAiModelManager.activateInstalledModel()`, then calls `LocalAiWordDraftService.generateWordDraft(...)`.
- Successful generation emits `success(draft)`; the UI applies draft fields to the form and then consumes the status.
- Failure states use user-facing Russian messages and do not block manual word creation.

**UI integration**

- `TopicScreen` provides `AiWordDraftBloc` for the topic feature lifetime.
- `TopicScreenView` opens `AddWordAIDialog` with the existing bloc instance:
  - starts each dialog-open setup check with `started()`
  - keeps source/target language settings across dialog close/reopen
- `AddWordAIDialog` owns setup UI:
  - shows download explanation/progress/cancel/retry while the model is missing
  - shows `AiWordForm` after install/ready state
- `AiWordForm` owns post-setup draft generation UI.
- `AiDraftControls` should not own model download controls; it is only for language inputs and the generate action after setup.

## WordBloc

**Purpose**

Owns non-editing word feature operations.

**Main responsibilities**

- Initializes the word details feature with the current word
- Adds a new word
- Refreshes a word from the database after edits
- Deletes a word

**Events**

- `started(word)`: seeds the bloc with the current word
- `addWord(newWord)`: adds a word
- `refreshRequested(wordId)`: reloads the current word by id
- `deleteRequested(wordId?)`: deletes a word by explicit id or current state word id
- `statusConsumed()`: resets transient status

**State**

Single state object with:

- `word`
- `isLoading`
- `hasChanges`
- `status`
- `message`

**Statuses**

- `initial`
- `ready`
- `saving`
- `wordAdded`
- `wordDeleted`
- `failure`

**Main logic**

- Uses `AppDatabase.addWord(...)` for creation.
- Uses `AppDatabase.getWordById(...)` for refresh after edits.
- Uses `AppDatabase.deleteWordById(...)` for deletion.
- Marks `hasChanges` when refresh succeeds with a new value or deletion succeeds.
- Keeps editing and learned-status toggling out of this bloc.

## WordEditingBloc

**Purpose**

Owns word mutation workflows.

**Main responsibilities**

- Initializes edit state for a word
- Saves edited word fields
- Toggles the learned flag and `learnedAt`

**Events**

- `started(word)`: seeds the editing state
- `saveRequested(updatedWord)`: saves edited word data
- `toggleLearnedRequested(word)`: flips learned state and persists it
- `statusConsumed()`: resets transient status

**State**

Single state object with:

- `word`
- `isSaving`
- `status`
- `message`

**Statuses**

- `initial`
- `ready`
- `saveSuccess`
- `wordUpdated`
- `failure`

**Main logic**

- Saves edited words through `AppDatabase.updateWord(...)`.
- For learned toggles, creates an updated copy of the word:
  - flips `learned`
  - sets `learnedAt` to `DateTime.now()` when marking as learned
  - clears `learnedAt` when unmarking
- Emits `saveSuccess` for edit form saves.
- Emits `wordUpdated` for learned-status toggles so UI can refresh or react separately.

## TestBloc

**Purpose**

Owns the loading flow for `TestScreen`.

**Main responsibilities**

- Loads words for practice by topic id
- Re-loads practice words on demand
- Replaces `FutureBuilder`-driven loading with explicit bloc states

**Events**

- `started(topicId)`: initial load
- `reloadRequested(topicId)`: manual reload
- `statusConsumed()`: clears transient failure state when needed

**States**

- `initial()`
- `loading()`
- `loaded(topicId, words)`
- `failure(topicId, message)`

**Main logic**

- Uses `AppDatabase.getWordsForTopic(topicId)` to load test words.
- Emits `loaded` with the full word list.
- Emits `failure` if loading fails.
- `statusConsumed()` restores the loaded state when possible, otherwise resets to `initial`.

## UI Integration Notes

- `BlocBuilder` is used for persistent render state.
- `BlocListener` is used for one-off effects such as snackbars, dialog closing, and navigation.
- `BlocConsumer` is used only where both rebuilding and side effects are needed in the same widget.
- Dialogs that need an existing bloc instance should receive it via `BlocProvider.value(...)`.
- New feature-local blocs should be created with `BlocProvider(create: (_) => getIt<BlocType>())`.
