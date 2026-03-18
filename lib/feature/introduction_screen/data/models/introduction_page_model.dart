import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/introduction_page_entity.dart';

part 'introduction_page_model.freezed.dart';
part 'introduction_page_model.g.dart';

@freezed
abstract class IntroductionPageModel with _$IntroductionPageModel {
  const IntroductionPageModel._();
  const factory IntroductionPageModel({
    required String title,
    required String highlight,
    required String description,
    required String imagePath,
    required String badge,
    @Default(false) bool showLogo,
    String? stepIndicator,
    String? stepIndicatorTop,
  }) = _IntroductionPageModel;

  factory IntroductionPageModel.fromJson(Map<String, dynamic> json) =>
      _$IntroductionPageModelFromJson(json);

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
