import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingSlide extends StatelessWidget {
  const OnboardingSlide({super.key, required this.slide});

  final OnboardingSlideData slide;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: slide.color,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(44),
                    child: SvgPicture.asset(
                      slide.assetPath,
                      width: 92,
                      height: 92,
                      colorFilter: const ColorFilter.mode(
                        AppConst.black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 42),
                Text(
                  slide.title,
                  textAlign: TextAlign.center,
                  style: AppConst.h1.copyWith(fontSize: 30),
                ),
                const SizedBox(height: 16),
                Text(
                  slide.description,
                  textAlign: TextAlign.center,
                  style: AppConst.text.copyWith(fontSize: 18, height: 1.35),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
