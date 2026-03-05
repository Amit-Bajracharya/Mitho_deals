class IntroductionPageEntity {
  final String title;
  final String highlight;
  final String description;
  final String imagePath;
  final String badge;
  final bool showLogo;
  final String? stepIndicator;
  final String? stepIndicatorTop;

  const IntroductionPageEntity({
    required this.title,
    required this.highlight,
    required this.description,
    required this.imagePath,
    required this.badge,
    this.showLogo = false,
    this.stepIndicator,
    this.stepIndicatorTop,
  });
}
