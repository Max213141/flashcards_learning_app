import 'package:flashcards_learning_app/utils/app_preferences_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('first launch defaults to true', () async {
    final store = await AppPreferencesStore.create();

    expect(store.isFirstLaunch, isTrue);
  });

  test('can mark first launch as complete', () async {
    final store = await AppPreferencesStore.create();

    await store.setFirstLaunchComplete();

    expect(store.isFirstLaunch, isFalse);
  });
}
