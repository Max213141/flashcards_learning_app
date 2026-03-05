# Tests Context (Phase 1 + Phase 2 Snapshot)

This file summarizes the main test additions currently present under `test/`.

## Coverage Summary

- Foundation coverage is in place for unit-level logic:
  - blocs
  - pure utils
  - entities
- Phase 2 widget coverage is started for key screens and their main state/listener behaviors.

## Test Folder Structure

- `test/helpers/`
  - shared test data and stream helpers.
- `test/mocks/`
  - DB mock contract(s) for bloc tests.
- `test/unit/blocs/`
  - bloc unit tests for startup, success, failure, validation, and status-consume/reset paths.
- `test/unit/utils/`
  - deterministic utility tests (shuffle/pluralization behavior).
- `test/unit/entities/`
  - entity serialization and `copyWith` behavior tests.
- `test/widget/screens/`
  - screen-level widget tests focused on:
    - initial startup event dispatch
    - loading/ready rendering
    - failure/success listener side effects
    - follow-up consume/refresh events where applicable.

## Main Created Test Files

- Helpers/mocks:
  - `test/helpers/test_words.dart`
  - `test/helpers/stream_controller_helpers.dart`
  - `test/mocks/mock_app_database.dart`
- Unit blocs:
  - `test/unit/blocs/topic_bloc_test.dart`
  - `test/unit/blocs/topic_creation_bloc_test.dart`
  - `test/unit/blocs/backup_bloc_test.dart`
  - `test/unit/blocs/goals_bloc_test.dart`
  - `test/unit/blocs/topic_detail_bloc_test.dart`
  - `test/unit/blocs/word_bloc_test.dart`
  - `test/unit/blocs/word_editing_bloc_test.dart`
  - `test/unit/blocs/test_bloc_test.dart`
- Unit utils/entities:
  - `test/unit/utils/derangement_shuffle_test.dart`
  - `test/unit/utils/pluralization_test.dart`
  - `test/unit/entities/word_test.dart`
  - `test/unit/entities/topic_test.dart`
  - `test/unit/entities/user_goals_test.dart`
- Widget screens:
  - `test/widget/screens/main_screen/main_screen_view_test.dart`
  - `test/widget/screens/main_screen/app_bar_customized_widget_test.dart`
  - `test/widget/screens/topic_screen/topic_screen_view_test.dart`
  - `test/widget/screens/word_definition_screen/word_definition_screen_view_test.dart`
  - `test/widget/screens/test_screen/test_screen_view_test.dart`
  - `test/widget/screens/edit_word_screen/edit_word_screen_view_test.dart`
  - `test/widget/screens/exam_screen/exam_screen_test.dart`

## Current Testing Approach

- Unit tests are prioritized for business logic and edge cases.
- Widget tests stay compact and stable, validating screen wiring and user-visible state transitions.
- Tests avoid deep layout assertions and focus on behavior contracts.
