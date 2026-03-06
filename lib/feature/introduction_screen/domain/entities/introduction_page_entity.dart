import 'package:freezed_annotation/freezed_annotation.dart';

part 'introduction_page_entity.freezed.dart';

@freezed
abstract class IntroductionPageEntity with _$IntroductionPageEntity {
  const factory IntroductionPageEntity({
    required String title,
    required String highlight,
    required String description,
    required String imagePath,
    required String badge,
    @Default(false) bool showLogo,
    String? stepIndicator,
    String? stepIndicatorTop,
  }) = _IntroductionPageEntity;
}
