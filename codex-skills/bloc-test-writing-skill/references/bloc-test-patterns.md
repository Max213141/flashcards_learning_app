# Bloc Test Patterns

## Matcher-first expectations for Freezed states

Use matcher-based assertions when states contain non-equatable entities.

```dart
expect: () => [
  isA<MyState>()
    .having((s) => s.status, 'status', MyStatus.success)
    .having((s) => s.items.length, 'items length', 3),
];
```

## Stream subscription testing

```dart
late StreamController<List<Item>> controller;

setUp(() {
  controller = StreamController<List<Item>>.broadcast();
  when(() => repo.watchItems()).thenAnswer((_) => controller.stream);
});

tearDown(() async {
  await controller.close();
});
```

## statusConsumed behavior

If status reset re-emits an equal state, assert no emitted states:

```dart
expect: () => <MyState>[];
```

## Mocktail fallbacks

Register once in `setUpAll`:

```dart
setUpAll(() {
  registerFallbackValue(MyEntity(...));
});
```

## File picker fake

For blocs calling `FilePicker.platform`, inject a fake platform implementation and set it in tests.

Key checks:
- success path (returns file/path)
- cancellation path (`null`)
- platform exception path
