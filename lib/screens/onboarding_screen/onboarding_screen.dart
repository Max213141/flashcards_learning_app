import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flashcards_learning_app/router/app_router.dart';
import 'package:flashcards_learning_app/screens/onboarding_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const _slideCount = 3;

  final PageController _pageController = PageController();
  int _currentPage = 0;

  bool get _isLastPage => _currentPage == _slideCount - 1;

  List<OnboardingSlideData> _slides(AppLocalizations l10n) {
    return [
      OnboardingSlideData(
        title: l10n.onboardingCreateDecksTitle,
        description: l10n.onboardingCreateDecksDescription,
        assetPath: 'assets/iconss/knowledge_button.svg',
        color: AppConst.primary,
      ),
      OnboardingSlideData(
        title: l10n.onboardingPracticeCardsTitle,
        description: l10n.onboardingPracticeCardsDescription,
        assetPath: 'assets/iconss/swipe.svg',
        color: AppConst.blue,
      ),
      OnboardingSlideData(
        title: l10n.onboardingTrackProgressTitle,
        description: l10n.onboardingTrackProgressDescription,
        assetPath: 'assets/iconss/lightbulb.svg',
        color: AppConst.yellow,
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _finishOnboarding() {
    context.router.replaceAll([const MainRoute()]);
  }

  Future<void> _nextPage() async {
    if (_isLastPage) {
      _finishOnboarding();
      return;
    }

    await _pageController.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);
    final slides = _slides(l10n);

    return Scaffold(
      backgroundColor: AppConst.background,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, right: 20),
                child: TextButton(
                  onPressed: _finishOnboarding,
                  child: Text(
                    l10n.onboardingSkipButton,
                    style: const TextStyle(color: AppConst.black),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: slides.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingSlide(slide: slides[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PageIndicator(
                    pageCount: slides.length,
                    currentPage: _currentPage,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: AppConst.primary,
                        foregroundColor: AppConst.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      onPressed: _nextPage,
                      icon: Icon(
                        _isLastPage ? Icons.check : Icons.arrow_forward,
                      ),
                      label: Text(
                        _isLastPage
                            ? l10n.onboardingStartButton
                            : l10n.onboardingNextButton,
                        style: AppConst.h2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
