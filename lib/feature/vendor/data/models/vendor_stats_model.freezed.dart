// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VendorStatsModel {

 double get todayRevenue; int get totalItemsSaved; int get activeOrdersCount;
/// Create a copy of VendorStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VendorStatsModelCopyWith<VendorStatsModel> get copyWith => _$VendorStatsModelCopyWithImpl<VendorStatsModel>(this as VendorStatsModel, _$identity);

  /// Serializes this VendorStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VendorStatsModel&&(identical(other.todayRevenue, todayRevenue) || other.todayRevenue == todayRevenue)&&(identical(other.totalItemsSaved, totalItemsSaved) || other.totalItemsSaved == totalItemsSaved)&&(identical(other.activeOrdersCount, activeOrdersCount) || other.activeOrdersCount == activeOrdersCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,todayRevenue,totalItemsSaved,activeOrdersCount);

@override
String toString() {
  return 'VendorStatsModel(todayRevenue: $todayRevenue, totalItemsSaved: $totalItemsSaved, activeOrdersCount: $activeOrdersCount)';
}


}

/// @nodoc
abstract mixin class $VendorStatsModelCopyWith<$Res>  {
  factory $VendorStatsModelCopyWith(VendorStatsModel value, $Res Function(VendorStatsModel) _then) = _$VendorStatsModelCopyWithImpl;
@useResult
$Res call({
 double todayRevenue, int totalItemsSaved, int activeOrdersCount
});




}
/// @nodoc
class _$VendorStatsModelCopyWithImpl<$Res>
    implements $VendorStatsModelCopyWith<$Res> {
  _$VendorStatsModelCopyWithImpl(this._self, this._then);

  final VendorStatsModel _self;
  final $Res Function(VendorStatsModel) _then;

/// Create a copy of VendorStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? todayRevenue = null,Object? totalItemsSaved = null,Object? activeOrdersCount = null,}) {
  return _then(_self.copyWith(
todayRevenue: null == todayRevenue ? _self.todayRevenue : todayRevenue // ignore: cast_nullable_to_non_nullable
as double,totalItemsSaved: null == totalItemsSaved ? _self.totalItemsSaved : totalItemsSaved // ignore: cast_nullable_to_non_nullable
as int,activeOrdersCount: null == activeOrdersCount ? _self.activeOrdersCount : activeOrdersCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VendorStatsModel].
extension VendorStatsModelPatterns on VendorStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VendorStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VendorStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VendorStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _VendorStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VendorStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _VendorStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double todayRevenue,  int totalItemsSaved,  int activeOrdersCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VendorStatsModel() when $default != null:
return $default(_that.todayRevenue,_that.totalItemsSaved,_that.activeOrdersCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double todayRevenue,  int totalItemsSaved,  int activeOrdersCount)  $default,) {final _that = this;
switch (_that) {
case _VendorStatsModel():
return $default(_that.todayRevenue,_that.totalItemsSaved,_that.activeOrdersCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double todayRevenue,  int totalItemsSaved,  int activeOrdersCount)?  $default,) {final _that = this;
switch (_that) {
case _VendorStatsModel() when $default != null:
return $default(_that.todayRevenue,_that.totalItemsSaved,_that.activeOrdersCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VendorStatsModel implements VendorStatsModel {
  const _VendorStatsModel({required this.todayRevenue, required this.totalItemsSaved, required this.activeOrdersCount});
  factory _VendorStatsModel.fromJson(Map<String, dynamic> json) => _$VendorStatsModelFromJson(json);

@override final  double todayRevenue;
@override final  int totalItemsSaved;
@override final  int activeOrdersCount;

/// Create a copy of VendorStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VendorStatsModelCopyWith<_VendorStatsModel> get copyWith => __$VendorStatsModelCopyWithImpl<_VendorStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VendorStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VendorStatsModel&&(identical(other.todayRevenue, todayRevenue) || other.todayRevenue == todayRevenue)&&(identical(other.totalItemsSaved, totalItemsSaved) || other.totalItemsSaved == totalItemsSaved)&&(identical(other.activeOrdersCount, activeOrdersCount) || other.activeOrdersCount == activeOrdersCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,todayRevenue,totalItemsSaved,activeOrdersCount);

@override
String toString() {
  return 'VendorStatsModel(todayRevenue: $todayRevenue, totalItemsSaved: $totalItemsSaved, activeOrdersCount: $activeOrdersCount)';
}


}

/// @nodoc
abstract mixin class _$VendorStatsModelCopyWith<$Res> implements $VendorStatsModelCopyWith<$Res> {
  factory _$VendorStatsModelCopyWith(_VendorStatsModel value, $Res Function(_VendorStatsModel) _then) = __$VendorStatsModelCopyWithImpl;
@override @useResult
$Res call({
 double todayRevenue, int totalItemsSaved, int activeOrdersCount
});




}
/// @nodoc
class __$VendorStatsModelCopyWithImpl<$Res>
    implements _$VendorStatsModelCopyWith<$Res> {
  __$VendorStatsModelCopyWithImpl(this._self, this._then);

  final _VendorStatsModel _self;
  final $Res Function(_VendorStatsModel) _then;

/// Create a copy of VendorStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? todayRevenue = null,Object? totalItemsSaved = null,Object? activeOrdersCount = null,}) {
  return _then(_VendorStatsModel(
todayRevenue: null == todayRevenue ? _self.todayRevenue : todayRevenue // ignore: cast_nullable_to_non_nullable
as double,totalItemsSaved: null == totalItemsSaved ? _self.totalItemsSaved : totalItemsSaved // ignore: cast_nullable_to_non_nullable
as int,activeOrdersCount: null == activeOrdersCount ? _self.activeOrdersCount : activeOrdersCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
