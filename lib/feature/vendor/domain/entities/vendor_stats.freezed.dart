// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VendorStats {

 double get todayRevenue; int get totalItemsSaved; int get activeOrdersCount;
/// Create a copy of VendorStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VendorStatsCopyWith<VendorStats> get copyWith => _$VendorStatsCopyWithImpl<VendorStats>(this as VendorStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VendorStats&&(identical(other.todayRevenue, todayRevenue) || other.todayRevenue == todayRevenue)&&(identical(other.totalItemsSaved, totalItemsSaved) || other.totalItemsSaved == totalItemsSaved)&&(identical(other.activeOrdersCount, activeOrdersCount) || other.activeOrdersCount == activeOrdersCount));
}


@override
int get hashCode => Object.hash(runtimeType,todayRevenue,totalItemsSaved,activeOrdersCount);

@override
String toString() {
  return 'VendorStats(todayRevenue: $todayRevenue, totalItemsSaved: $totalItemsSaved, activeOrdersCount: $activeOrdersCount)';
}


}

/// @nodoc
abstract mixin class $VendorStatsCopyWith<$Res>  {
  factory $VendorStatsCopyWith(VendorStats value, $Res Function(VendorStats) _then) = _$VendorStatsCopyWithImpl;
@useResult
$Res call({
 double todayRevenue, int totalItemsSaved, int activeOrdersCount
});




}
/// @nodoc
class _$VendorStatsCopyWithImpl<$Res>
    implements $VendorStatsCopyWith<$Res> {
  _$VendorStatsCopyWithImpl(this._self, this._then);

  final VendorStats _self;
  final $Res Function(VendorStats) _then;

/// Create a copy of VendorStats
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


/// Adds pattern-matching-related methods to [VendorStats].
extension VendorStatsPatterns on VendorStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VendorStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VendorStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VendorStats value)  $default,){
final _that = this;
switch (_that) {
case _VendorStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VendorStats value)?  $default,){
final _that = this;
switch (_that) {
case _VendorStats() when $default != null:
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
case _VendorStats() when $default != null:
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
case _VendorStats():
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
case _VendorStats() when $default != null:
return $default(_that.todayRevenue,_that.totalItemsSaved,_that.activeOrdersCount);case _:
  return null;

}
}

}

/// @nodoc


class _VendorStats implements VendorStats {
  const _VendorStats({required this.todayRevenue, required this.totalItemsSaved, required this.activeOrdersCount});
  

@override final  double todayRevenue;
@override final  int totalItemsSaved;
@override final  int activeOrdersCount;

/// Create a copy of VendorStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VendorStatsCopyWith<_VendorStats> get copyWith => __$VendorStatsCopyWithImpl<_VendorStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VendorStats&&(identical(other.todayRevenue, todayRevenue) || other.todayRevenue == todayRevenue)&&(identical(other.totalItemsSaved, totalItemsSaved) || other.totalItemsSaved == totalItemsSaved)&&(identical(other.activeOrdersCount, activeOrdersCount) || other.activeOrdersCount == activeOrdersCount));
}


@override
int get hashCode => Object.hash(runtimeType,todayRevenue,totalItemsSaved,activeOrdersCount);

@override
String toString() {
  return 'VendorStats(todayRevenue: $todayRevenue, totalItemsSaved: $totalItemsSaved, activeOrdersCount: $activeOrdersCount)';
}


}

/// @nodoc
abstract mixin class _$VendorStatsCopyWith<$Res> implements $VendorStatsCopyWith<$Res> {
  factory _$VendorStatsCopyWith(_VendorStats value, $Res Function(_VendorStats) _then) = __$VendorStatsCopyWithImpl;
@override @useResult
$Res call({
 double todayRevenue, int totalItemsSaved, int activeOrdersCount
});




}
/// @nodoc
class __$VendorStatsCopyWithImpl<$Res>
    implements _$VendorStatsCopyWith<$Res> {
  __$VendorStatsCopyWithImpl(this._self, this._then);

  final _VendorStats _self;
  final $Res Function(_VendorStats) _then;

/// Create a copy of VendorStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? todayRevenue = null,Object? totalItemsSaved = null,Object? activeOrdersCount = null,}) {
  return _then(_VendorStats(
todayRevenue: null == todayRevenue ? _self.todayRevenue : todayRevenue // ignore: cast_nullable_to_non_nullable
as double,totalItemsSaved: null == totalItemsSaved ? _self.totalItemsSaved : totalItemsSaved // ignore: cast_nullable_to_non_nullable
as int,activeOrdersCount: null == activeOrdersCount ? _self.activeOrdersCount : activeOrdersCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
