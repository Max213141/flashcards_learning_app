import 'package:flashcards_learning_app/blocs/backup_bloc/backup_bloc.dart';
import 'package:flashcards_learning_app/blocs/goals_bloc/goals_bloc.dart';
import 'package:flashcards_learning_app/blocs/test_bloc/test_bloc.dart';
import 'package:flashcards_learning_app/blocs/topic_detail_bloc/topic_detail_bloc.dart';
import 'package:flashcards_learning_app/blocs/topic_bloc/topic_bloc.dart';
import 'package:flashcards_learning_app/blocs/topic_creation_bloc/topic_creation_bloc.dart';
import 'package:flashcards_learning_app/blocs/word_bloc/word_bloc.dart';
import 'package:flashcards_learning_app/blocs/word_editing_bloc/word_editing_bloc.dart';
import 'package:flashcards_learning_app/data/local/app_database.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
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
