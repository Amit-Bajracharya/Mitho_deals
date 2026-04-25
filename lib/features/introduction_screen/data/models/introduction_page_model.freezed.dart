// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'introduction_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IntroductionPageModel {

 String get title; String get highlight; String get description; String get imagePath; String get badge; bool get showLogo; String? get stepIndicator; String? get stepIndicatorTop;
/// Create a copy of IntroductionPageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IntroductionPageModelCopyWith<IntroductionPageModel> get copyWith => _$IntroductionPageModelCopyWithImpl<IntroductionPageModel>(this as IntroductionPageModel, _$identity);

  /// Serializes this IntroductionPageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IntroductionPageModel&&(identical(other.title, title) || other.title == title)&&(identical(other.highlight, highlight) || other.highlight == highlight)&&(identical(other.description, description) || other.description == description)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.showLogo, showLogo) || other.showLogo == showLogo)&&(identical(other.stepIndicator, stepIndicator) || other.stepIndicator == stepIndicator)&&(identical(other.stepIndicatorTop, stepIndicatorTop) || other.stepIndicatorTop == stepIndicatorTop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,highlight,description,imagePath,badge,showLogo,stepIndicator,stepIndicatorTop);

@override
String toString() {
  return 'IntroductionPageModel(title: $title, highlight: $highlight, description: $description, imagePath: $imagePath, badge: $badge, showLogo: $showLogo, stepIndicator: $stepIndicator, stepIndicatorTop: $stepIndicatorTop)';
}


}

/// @nodoc
abstract mixin class $IntroductionPageModelCopyWith<$Res>  {
  factory $IntroductionPageModelCopyWith(IntroductionPageModel value, $Res Function(IntroductionPageModel) _then) = _$IntroductionPageModelCopyWithImpl;
@useResult
$Res call({
 String title, String highlight, String description, String imagePath, String badge, bool showLogo, String? stepIndicator, String? stepIndicatorTop
});




}
/// @nodoc
class _$IntroductionPageModelCopyWithImpl<$Res>
    implements $IntroductionPageModelCopyWith<$Res> {
  _$IntroductionPageModelCopyWithImpl(this._self, this._then);

  final IntroductionPageModel _self;
  final $Res Function(IntroductionPageModel) _then;

/// Create a copy of IntroductionPageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? highlight = null,Object? description = null,Object? imagePath = null,Object? badge = null,Object? showLogo = null,Object? stepIndicator = freezed,Object? stepIndicatorTop = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,highlight: null == highlight ? _self.highlight : highlight // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String,showLogo: null == showLogo ? _self.showLogo : showLogo // ignore: cast_nullable_to_non_nullable
as bool,stepIndicator: freezed == stepIndicator ? _self.stepIndicator : stepIndicator // ignore: cast_nullable_to_non_nullable
as String?,stepIndicatorTop: freezed == stepIndicatorTop ? _self.stepIndicatorTop : stepIndicatorTop // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IntroductionPageModel].
extension IntroductionPageModelPatterns on IntroductionPageModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IntroductionPageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IntroductionPageModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IntroductionPageModel value)  $default,){
final _that = this;
switch (_that) {
case _IntroductionPageModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IntroductionPageModel value)?  $default,){
final _that = this;
switch (_that) {
case _IntroductionPageModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String highlight,  String description,  String imagePath,  String badge,  bool showLogo,  String? stepIndicator,  String? stepIndicatorTop)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IntroductionPageModel() when $default != null:
return $default(_that.title,_that.highlight,_that.description,_that.imagePath,_that.badge,_that.showLogo,_that.stepIndicator,_that.stepIndicatorTop);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String highlight,  String description,  String imagePath,  String badge,  bool showLogo,  String? stepIndicator,  String? stepIndicatorTop)  $default,) {final _that = this;
switch (_that) {
case _IntroductionPageModel():
return $default(_that.title,_that.highlight,_that.description,_that.imagePath,_that.badge,_that.showLogo,_that.stepIndicator,_that.stepIndicatorTop);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String highlight,  String description,  String imagePath,  String badge,  bool showLogo,  String? stepIndicator,  String? stepIndicatorTop)?  $default,) {final _that = this;
switch (_that) {
case _IntroductionPageModel() when $default != null:
return $default(_that.title,_that.highlight,_that.description,_that.imagePath,_that.badge,_that.showLogo,_that.stepIndicator,_that.stepIndicatorTop);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IntroductionPageModel extends IntroductionPageModel {
  const _IntroductionPageModel({required this.title, required this.highlight, required this.description, required this.imagePath, required this.badge, this.showLogo = false, this.stepIndicator, this.stepIndicatorTop}): super._();
  factory _IntroductionPageModel.fromJson(Map<String, dynamic> json) => _$IntroductionPageModelFromJson(json);

@override final  String title;
@override final  String highlight;
@override final  String description;
@override final  String imagePath;
@override final  String badge;
@override@JsonKey() final  bool showLogo;
@override final  String? stepIndicator;
@override final  String? stepIndicatorTop;

/// Create a copy of IntroductionPageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IntroductionPageModelCopyWith<_IntroductionPageModel> get copyWith => __$IntroductionPageModelCopyWithImpl<_IntroductionPageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IntroductionPageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IntroductionPageModel&&(identical(other.title, title) || other.title == title)&&(identical(other.highlight, highlight) || other.highlight == highlight)&&(identical(other.description, description) || other.description == description)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.showLogo, showLogo) || other.showLogo == showLogo)&&(identical(other.stepIndicator, stepIndicator) || other.stepIndicator == stepIndicator)&&(identical(other.stepIndicatorTop, stepIndicatorTop) || other.stepIndicatorTop == stepIndicatorTop));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,highlight,description,imagePath,badge,showLogo,stepIndicator,stepIndicatorTop);

@override
String toString() {
  return 'IntroductionPageModel(title: $title, highlight: $highlight, description: $description, imagePath: $imagePath, badge: $badge, showLogo: $showLogo, stepIndicator: $stepIndicator, stepIndicatorTop: $stepIndicatorTop)';
}


}

/// @nodoc
abstract mixin class _$IntroductionPageModelCopyWith<$Res> implements $IntroductionPageModelCopyWith<$Res> {
  factory _$IntroductionPageModelCopyWith(_IntroductionPageModel value, $Res Function(_IntroductionPageModel) _then) = __$IntroductionPageModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String highlight, String description, String imagePath, String badge, bool showLogo, String? stepIndicator, String? stepIndicatorTop
});




}
/// @nodoc
class __$IntroductionPageModelCopyWithImpl<$Res>
    implements _$IntroductionPageModelCopyWith<$Res> {
  __$IntroductionPageModelCopyWithImpl(this._self, this._then);

  final _IntroductionPageModel _self;
  final $Res Function(_IntroductionPageModel) _then;

/// Create a copy of IntroductionPageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? highlight = null,Object? description = null,Object? imagePath = null,Object? badge = null,Object? showLogo = null,Object? stepIndicator = freezed,Object? stepIndicatorTop = freezed,}) {
  return _then(_IntroductionPageModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,highlight: null == highlight ? _self.highlight : highlight // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,badge: null == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as String,showLogo: null == showLogo ? _self.showLogo : showLogo // ignore: cast_nullable_to_non_nullable
as bool,stepIndicator: freezed == stepIndicator ? _self.stepIndicator : stepIndicator // ignore: cast_nullable_to_non_nullable
as String?,stepIndicatorTop: freezed == stepIndicatorTop ? _self.stepIndicatorTop : stepIndicatorTop // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
