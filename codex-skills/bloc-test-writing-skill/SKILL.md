---
name: bloc-test-writing-skill
description: Write or refactor unit tests for Flutter `flutter_bloc` features using `bloc_test`, `mocktail`, and deterministic async handling. Use when a request involves testing bloc event/state flows, stream subscriptions, validation/failure branches, `statusConsumed` behavior, or plugin/file interactions (for example `file_picker`) in bloc logic.
---

# Flutter Bloc Tests

## Overview
Create reliable bloc unit tests for Flutter projects with Freezed states and mock-driven dependencies. Prefer deterministic assertions, robust mocking setup, and non-flaky async handling.

## Workflow

### 1. Prepare test scaffolding
- Add required dev dependencies if missing: `bloc_test`, `mocktail`, `fake_async`.
- Create reusable helpers under `test/helpers/` and `test/mocks/`.
- Register mocktail fallback values in `setUpAll` for any type used by `any()`/`captureAny()`.

### 2. Map behavior before writing tests
- Read bloc file, events, and states first.
- List event handlers and branch points:
  - success path
  - validation/early return path
  - dependency failure path
  - reset/status consumption path
- Identify async sources:
  - streams/subscriptions
  - timers
  - file/plugin APIs

### 3. Write bloc tests by behavior slice
- Use `blocTest` for state sequence assertions.
- Use plain `test` when verifying timer/event orchestration is easier than strict state sequences.
- Keep one expectation focus per test name.

Required minimum per bloc:
- `started`/initial load flow
- user-triggered action success
- user-triggered action failure
- input validation failures
- `statusConsumed` or equivalent reset behavior

### 4. Assert states safely
- Use concrete state equality only when fields are value-comparable.
- Use matcher-based assertions (`isA<State>().having(...)`) when state holds non-equatable domain objects.
- For Freezed unions, prefer:
  - `maybeWhen`/`maybeMap` in matchers for variant-specific assertions
  - focused checks (status enum, message, counts, key IDs)

### 5. Handle async and plugin edges deterministically
- For stream-driven blocs:
  - use `StreamController.broadcast()`
  - close controllers in `tearDown`
  - emit data/errors from controllers inside `act`
- For file/plugin APIs used inside blocs:
  - replace platform singleton with fake implementations in test scope
  - return deterministic payloads and errors
- Add `wait:` in `blocTest` only when true I/O scheduling requires it.

### 6. Verify side effects
- Use `verify(...)` for DB/service calls with captured args.
- Assert transformed payloads passed to dependencies (for example normalized words, assigned topics, parsed JSON).

## Patterns To Apply

### Pattern: State contains non-equatable entities
- Avoid exact object list equality in expected states.
- Assert only the semantic fields needed for behavior correctness.

### Pattern: `statusConsumed` emits same logical state
- Expect no emissions when bloc re-emits an equal state (`expect: () => <State>[]`).
- Do not force an emission assertion unless behavior truly emits a changed state.

### Pattern: Mocktail fallback errors
- If `any()` fails for custom type, register fallback in `setUpAll`.
- Typical types needing fallback in bloc tests:
  - domain entities (`Word`, `UserGoals`, etc.)
  - typed collections used in named args

### Pattern: File picker in bloc code
- Provide a fake class extending plugin interface/class used by production code.
- Override only methods used by the bloc (`pickFiles`, `saveFile`, etc.).
- Set singleton (`FilePicker.platform = fake`) in `setUp`.

## Quality Bar
- Keep tests readable and behavior-focused.
- Avoid over-mocking internal details that make tests brittle.
- Ensure Russian/English error message checks match current app behavior.
- Run formatter and full test suite before finalizing.
