---
name: widget-tests-creation-skill
description: Create or update Flutter widget tests for screen-level behavior with `flutter_test`, `bloc_test`, and mocked blocs. Use when testing screen wiring, bloc provider startup events, bloc listener side effects (snackbars, reload events, status consumption, navigation), and key state-driven rendering for loading/error/ready UI.
---

# Widget Tests Creation Skill

## Overview
Write compact, stable widget tests for Flutter screens that use blocs. Prioritize behavior correctness over deep visual assertions, and avoid brittle checks that fail from layout details.

## Core Approach

### 1. Define a minimal, high-value scope
For each screen, target:
- provider wiring (`started` or equivalent initial event)
- one loading render state
- one ready/error render state
- listener side effects for success/failure states

Avoid broad coverage of every child widget in this phase.

### 2. Standard test setup pattern
- Create `MockBloc<Event, State>` classes for each bloc.
- In `setUp`:
  - configure `when(() => bloc.state)`
  - configure `whenListen(...)` with deterministic streams
- Register fallback values in `setUpAll` for any events used in `verify(...)` or `any()`.

### 3. Screen wrapper vs screen view strategy
- For route screen classes (`MainScreen`, `TopicScreen`, etc.):
  - test DI wiring and initial `add(...)` calls.
- For `*ScreenView` classes:
  - inject bloc instances via `BlocProvider.value`
  - test rendering and listener reactions.

### 4. Assert behavior, not implementation noise
Prefer assertions like:
- specific key text presence
- key widget type presence (loader/body/list)
- expected bloc events dispatched
- snackbar message visibility

Avoid fragile pixel/layout expectations.

## Stability Rules (Important)

### Viewport and overflow handling
- Set a large surface size for complex screens in tests:
  - `await tester.binding.setSurfaceSize(const Size(1200, 2200));`
- Restore in test end:
  - `await tester.binding.setSurfaceSize(null);`
- If a known screen has unavoidable test-layout overflow from unrelated child controls, avoid asserting branches that trigger that layout when testing listener logic.

### Event timing
- Use `await tester.pump()` after mounting.
- Use `pumpAndSettle()` only when waiting for animation/dialog transitions.
- Use `wait:` in `blocTest` or extra `pump(Duration...)` only when needed.

### Listener side effects
For bloc listeners, verify both:
- user-visible effect (snackbar/dialog/nav outcome) when stable
- follow-up bloc event (`statusConsumed`, `refreshRequested`, etc.)

## Recommended Test File Structure

- `test/widget/screens/<feature>/<screen_name>_test.dart`
- Group tests by behavior, not by widget internals.

Example compact suite:
1. `dispatches started events on build`
2. `shows loader while initial/loading`
3. `renders content on ready`
4. `failure listener shows snackbar and consumes status`
5. `success listener triggers refresh/reload`

## Patterns from This Codebase

- `MainScreen`/`MainScreenView`:
  - assert `TopicEvent.started`, `GoalsEvent.started`
  - verify sort interaction dispatches `TopicEvent.sortChanged`
  - verify backup listener sends `statusConsumed` and refreshes topics on restore success
- `TopicScreenView`:
  - verify `WordStatus.wordDeleted` triggers topic reload + word status consumption
  - verify topic/word failure listener behavior via snackbar + status consumption
- `WordDefinitionScreenView`:
  - verify knowledge button triggers `toggleLearnedRequested`
  - verify `WordEditingStatus.wordUpdated` triggers `WordEvent.refreshRequested`

## Completion Checklist
- Tests compile and run for the target file(s).
- Assertions are focused and deterministic.
- No unrelated brittle assertions.
- Formatter run on new test files.
