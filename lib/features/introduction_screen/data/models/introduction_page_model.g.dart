// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'introduction_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IntroductionPageModel _$IntroductionPageModelFromJson(
  Map<String, dynamic> json,
) => _IntroductionPageModel(
  title: json['title'] as String,
  highlight: json['highlight'] as String,
  description: json['description'] as String,
  imagePath: json['imagePath'] as String,
  badge: json['badge'] as String,
  showLogo: json['showLogo'] as bool? ?? false,
  stepIndicator: json['stepIndicator'] as String?,
  stepIndicatorTop: json['stepIndicatorTop'] as String?,
);

Map<String, dynamic> _$IntroductionPageModelToJson(
  _IntroductionPageModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'highlight': instance.highlight,
  'description': instance.description,
  'imagePath': instance.imagePath,
  'badge': instance.badge,
  'showLogo': instance.showLogo,
  'stepIndicator': instance.stepIndicator,
  'stepIndicatorTop': instance.stepIndicatorTop,
};
