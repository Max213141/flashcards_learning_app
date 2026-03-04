import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/blocs/test_bloc/test_bloc.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/screens/exam_screen/widgets/exam_screen_body_widget.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class ExamScreen extends StatelessWidget {
  final int topicId;
  const ExamScreen({super.key, required this.topicId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<TestBloc>()..add(TestEvent.started(topicId: topicId)),
      child: BlocListener<TestBloc, TestState>(
        listener: (context, state) {
          state.whenOrNull(
            failure: (_, _) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Не удалось загрузить слова для экзамена'),
                ),
              );
              context.read<TestBloc>().add(const TestEvent.statusConsumed());
            },
          );
        },
        child: Scaffold(
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsetsGeometry.all(10),
                child: SvgPicture.asset(
                  'assets/iconss/arrow_back.svg',
                  colorFilter: const ColorFilter.mode(
                    AppConst.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            centerTitle: true,
            title: Text('Экзамен', style: AppConst.h3),
          ),
          body: BlocBuilder<TestBloc, TestState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const Center(child: FlashcardsLoader()),
                loaded: (_, words) => ExamScreenBodyWidget(wordList: words),
                failure: (_, _) => const Center(child: FlashcardsLoader()),
              );
            },
          ),
        ),
      ),
    );
  }
}
