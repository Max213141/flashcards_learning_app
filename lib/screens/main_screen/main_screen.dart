import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/blocs/blocs.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/widgets.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<TopicBloc>()..add(const TopicEvent.started()),
        ),
        BlocProvider(create: (_) => getIt<BackupBloc>()),
        BlocProvider(
          create: (_) => getIt<GoalsBloc>()..add(const GoalsEvent.started()),
        ),
      ],
      child: const MainScreenView(),
    );
  }
}
