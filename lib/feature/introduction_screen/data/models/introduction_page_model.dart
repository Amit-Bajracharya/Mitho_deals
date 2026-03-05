import '../../domain/entities/introduction_page_entity.dart';

class IntroductionPageModel extends IntroductionPageEntity {
  const IntroductionPageModel({
    required super.title,
    required super.highlight,
    required super.description,
    required super.imagePath,
    required super.badge,
    super.showLogo,
    super.stepIndicator,
    super.stepIndicatorTop,
  });

  factory IntroductionPageModel.fromEntity(IntroductionPageEntity entity) {
    return IntroductionPageModel(
      title: entity.title,
      highlight: entity.highlight,
      description: entity.description,
      imagePath: entity.imagePath,
      badge: entity.badge,
      showLogo: entity.showLogo,
      stepIndicator: entity.stepIndicator,
      stepIndicatorTop: entity.stepIndicatorTop,
    );
  }

  IntroductionPageEntity toEntity() {
    return IntroductionPageEntity(
      title: title,
      highlight: highlight,
      description: description,
      imagePath: imagePath,
      badge: badge,
      showLogo: showLogo,
      stepIndicator: stepIndicator,
      stepIndicatorTop: stepIndicatorTop,
    );
  }
}
