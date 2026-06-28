import 'dart:ui';

class OnboardingSlideData {
  const OnboardingSlideData({
    required this.title,
    required this.description,
    required this.assetPath,
    required this.color,
  });

  final String title;
  final String description;
  final String assetPath;
  final Color color;
}
