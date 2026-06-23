import 'package:flashcards_learning_app/blocs/test_bloc/test_bloc.dart';
import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flashcards_learning_app/screens/test_screen/widgets/widgets.dart';
import 'package:flashcards_learning_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TestScreenView extends StatelessWidget {
  const TestScreenView({
    super.key,
    required this.topicId,
    required this.topicColor,
  });

  final int topicId;
  final Color topicColor;

  @override
  Widget build(BuildContext context) {
    return BlocListener<TestBloc, TestState>(
      listener: (context, state) {
        state.whenOrNull(
          failure: (_, message) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
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
          title: Text(l10nOf(context).testScreenTitle, style: AppConst.h3),
          centerTitle: true,
        ),
        body: BlocBuilder<TestBloc, TestState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(child: FlashcardsLoader()),
              loaded: (_, words) => TestScreenBodyWidget(
                wordList: shuffleWithoutSamePositions(words),
                topicId: topicId,
                topicColor: topicColor,
              ),
              failure: (_, _) => const Center(child: FlashcardsLoader()),
            );
          },
        ),
      ),
    );
  }
}
