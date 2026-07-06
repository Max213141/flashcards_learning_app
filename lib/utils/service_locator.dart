import 'package:flashcards_learning_app/ai/flutter_gemma_model_manager.dart';
import 'package:flashcards_learning_app/ai/flutter_gemma_word_draft_service.dart';
import 'package:flashcards_learning_app/core/interfaces/ai/local_ai_model_manager.dart';
import 'package:flashcards_learning_app/core/interfaces/ai/local_ai_word_draft_service.dart';
import 'package:flashcards_learning_app/blocs/ai_word_draft_bloc/ai_word_draft_bloc.dart';
import 'package:flashcards_learning_app/blocs/backup_bloc/backup_bloc.dart';
import 'package:flashcards_learning_app/blocs/goals_bloc/goals_bloc.dart';
import 'package:flashcards_learning_app/blocs/locale_bloc/locale_bloc.dart';
import 'package:flashcards_learning_app/blocs/test_bloc/test_bloc.dart';
import 'package:flashcards_learning_app/blocs/topic_detail_bloc/topic_detail_bloc.dart';
import 'package:flashcards_learning_app/blocs/topic_bloc/topic_bloc.dart';
import 'package:flashcards_learning_app/blocs/topic_creation_bloc/topic_creation_bloc.dart';
import 'package:flashcards_learning_app/blocs/word_bloc/word_bloc.dart';
import 'package:flashcards_learning_app/blocs/word_editing_bloc/word_editing_bloc.dart';
import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:flashcards_learning_app/utils/analytics_service.dart';
import 'package:flashcards_learning_app/utils/app_locale_preferences.dart';
import 'package:flashcards_learning_app/utils/default_topics_seeder.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton<AnalyticsService>(() => AnalyticsService());
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
  getIt.registerLazySingleton<DefaultTopicsSeeder>(
    () => DefaultTopicsSeeder(appDatabase: getIt<AppDatabase>()),
  );
  getIt.registerLazySingleton<LocalAiModelManager>(
    () => FlutterGemmaModelManager(),
  );
  getIt.registerLazySingleton<LocalAiWordDraftService>(
    () => FlutterGemmaWordDraftService(),
  );
  getIt.registerFactory<AiWordDraftBloc>(
    () => AiWordDraftBloc(
      modelManager: getIt<LocalAiModelManager>(),
      wordDraftService: getIt<LocalAiWordDraftService>(),
    ),
  );
  getIt.registerFactory<TopicBloc>(
    () => TopicBloc(appDatabase: getIt<AppDatabase>()),
  );
  getIt.registerFactory<BackupBloc>(
    () => BackupBloc(appDatabase: getIt<AppDatabase>()),
  );
  getIt.registerFactory<TopicCreationBloc>(
    () => TopicCreationBloc(appDatabase: getIt<AppDatabase>()),
  );
  getIt.registerFactory<GoalsBloc>(
    () => GoalsBloc(appDatabase: getIt<AppDatabase>()),
  );
  getIt.registerFactoryParam<LocaleBloc, Locale?, void>(
    (initialLocale, _) => LocaleBloc(
      initialLocale: initialLocale ?? AppLocalePreferences.defaultLocale,
    ),
  );
  getIt.registerFactory<TestBloc>(
    () => TestBloc(appDatabase: getIt<AppDatabase>()),
  );
  getIt.registerFactory<TopicDetailBloc>(
    () => TopicDetailBloc(appDatabase: getIt<AppDatabase>()),
  );
  getIt.registerFactory<WordBloc>(
    () => WordBloc(appDatabase: getIt<AppDatabase>()),
  );
  getIt.registerFactory<WordEditingBloc>(
    () => WordEditingBloc(appDatabase: getIt<AppDatabase>()),
  );
}
