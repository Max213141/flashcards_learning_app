# Widget Test Recipes

## Boilerplate: mock blocs

```dart
class MockMyBloc extends MockBloc<MyEvent, MyState> implements MyBloc {}
```

```dart
setUp(() {
  myBloc = MockMyBloc();
  when(() => myBloc.state).thenReturn(const MyState.initial());
  whenListen(myBloc, const Stream<MyState>.empty(), initialState: const MyState.initial());
});
```

## Verify startup event wiring

```dart
verify(() => myBloc.add(const MyEvent.started())).called(1);
```

## Listener effect pattern

```dart
whenListen(myBloc, Stream.value(const MyState.failure(message: 'Error')), initialState: const MyState.initial());
await tester.pump();
expect(find.text('Error'), findsOneWidget);
verify(() => myBloc.add(const MyEvent.statusConsumed())).called(1);
```

## Stable viewport pattern

```dart
await tester.binding.setSurfaceSize(const Size(1200, 2200));
// pump widget, assertions
await tester.binding.setSurfaceSize(null);
```

## Choosing assertions

Prefer:
- `find.text(...)`
- `find.byType(...)`
- `verify(() => bloc.add(...))`

Avoid:
- strict layout/pixel assumptions
- deep traversal of child internals unless behavior requires it
