// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deal_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DealEntity {

 String get id; String get vendorId; String get foodName; String get description; double get originalPrice; double get discountedPrice; int get availablePortions; DateTime get pickupStartTime; DateTime get pickupEndTime; String get imageUrl; String get vendorName; String get vendorAddress; double get latitude; double get longitude; bool get isAvailable;
/// Create a copy of DealEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DealEntityCopyWith<DealEntity> get copyWith => _$DealEntityCopyWithImpl<DealEntity>(this as DealEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DealEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.foodName, foodName) || other.foodName == foodName)&&(identical(other.description, description) || other.description == description)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.discountedPrice, discountedPrice) || other.discountedPrice == discountedPrice)&&(identical(other.availablePortions, availablePortions) || other.availablePortions == availablePortions)&&(identical(other.pickupStartTime, pickupStartTime) || other.pickupStartTime == pickupStartTime)&&(identical(other.pickupEndTime, pickupEndTime) || other.pickupEndTime == pickupEndTime)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.vendorName, vendorName) || other.vendorName == vendorName)&&(identical(other.vendorAddress, vendorAddress) || other.vendorAddress == vendorAddress)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable));
}


@override
int get hashCode => Object.hash(runtimeType,id,vendorId,foodName,description,originalPrice,discountedPrice,availablePortions,pickupStartTime,pickupEndTime,imageUrl,vendorName,vendorAddress,latitude,longitude,isAvailable);

@override
String toString() {
  return 'DealEntity(id: $id, vendorId: $vendorId, foodName: $foodName, description: $description, originalPrice: $originalPrice, discountedPrice: $discountedPrice, availablePortions: $availablePortions, pickupStartTime: $pickupStartTime, pickupEndTime: $pickupEndTime, imageUrl: $imageUrl, vendorName: $vendorName, vendorAddress: $vendorAddress, latitude: $latitude, longitude: $longitude, isAvailable: $isAvailable)';
}


}

/// @nodoc
abstract mixin class $DealEntityCopyWith<$Res>  {
  factory $DealEntityCopyWith(DealEntity value, $Res Function(DealEntity) _then) = _$DealEntityCopyWithImpl;
@useResult
$Res call({
 String id, String vendorId, String foodName, String description, double originalPrice, double discountedPrice, int availablePortions, DateTime pickupStartTime, DateTime pickupEndTime, String imageUrl, String vendorName, String vendorAddress, double latitude, double longitude, bool isAvailable
});




}
/// @nodoc
class _$DealEntityCopyWithImpl<$Res>
    implements $DealEntityCopyWith<$Res> {
  _$DealEntityCopyWithImpl(this._self, this._then);

  final DealEntity _self;
  final $Res Function(DealEntity) _then;

/// Create a copy of DealEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vendorId = null,Object? foodName = null,Object? description = null,Object? originalPrice = null,Object? discountedPrice = null,Object? availablePortions = null,Object? pickupStartTime = null,Object? pickupEndTime = null,Object? imageUrl = null,Object? vendorName = null,Object? vendorAddress = null,Object? latitude = null,Object? longitude = null,Object? isAvailable = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vendorId: null == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String,foodName: null == foodName ? _self.foodName : foodName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,originalPrice: null == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double,discountedPrice: null == discountedPrice ? _self.discountedPrice : discountedPrice // ignore: cast_nullable_to_non_nullable
as double,availablePortions: null == availablePortions ? _self.availablePortions : availablePortions // ignore: cast_nullable_to_non_nullable
as int,pickupStartTime: null == pickupStartTime ? _self.pickupStartTime : pickupStartTime // ignore: cast_nullable_to_non_nullable
as DateTime,pickupEndTime: null == pickupEndTime ? _self.pickupEndTime : pickupEndTime // ignore: cast_nullable_to_non_nullable
as DateTime,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,vendorName: null == vendorName ? _self.vendorName : vendorName // ignore: cast_nullable_to_non_nullable
as String,vendorAddress: null == vendorAddress ? _self.vendorAddress : vendorAddress // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DealEntity].
extension DealEntityPatterns on DealEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DealEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DealEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DealEntity value)  $default,){
final _that = this;
switch (_that) {
case _DealEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DealEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DealEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String vendorId,  String foodName,  String description,  double originalPrice,  double discountedPrice,  int availablePortions,  DateTime pickupStartTime,  DateTime pickupEndTime,  String imageUrl,  String vendorName,  String vendorAddress,  double latitude,  double longitude,  bool isAvailable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DealEntity() when $default != null:
return $default(_that.id,_that.vendorId,_that.foodName,_that.description,_that.originalPrice,_that.discountedPrice,_that.availablePortions,_that.pickupStartTime,_that.pickupEndTime,_that.imageUrl,_that.vendorName,_that.vendorAddress,_that.latitude,_that.longitude,_that.isAvailable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String vendorId,  String foodName,  String description,  double originalPrice,  double discountedPrice,  int availablePortions,  DateTime pickupStartTime,  DateTime pickupEndTime,  String imageUrl,  String vendorName,  String vendorAddress,  double latitude,  double longitude,  bool isAvailable)  $default,) {final _that = this;
switch (_that) {
case _DealEntity():
return $default(_that.id,_that.vendorId,_that.foodName,_that.description,_that.originalPrice,_that.discountedPrice,_that.availablePortions,_that.pickupStartTime,_that.pickupEndTime,_that.imageUrl,_that.vendorName,_that.vendorAddress,_that.latitude,_that.longitude,_that.isAvailable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String vendorId,  String foodName,  String description,  double originalPrice,  double discountedPrice,  int availablePortions,  DateTime pickupStartTime,  DateTime pickupEndTime,  String imageUrl,  String vendorName,  String vendorAddress,  double latitude,  double longitude,  bool isAvailable)?  $default,) {final _that = this;
switch (_that) {
case _DealEntity() when $default != null:
return $default(_that.id,_that.vendorId,_that.foodName,_that.description,_that.originalPrice,_that.discountedPrice,_that.availablePortions,_that.pickupStartTime,_that.pickupEndTime,_that.imageUrl,_that.vendorName,_that.vendorAddress,_that.latitude,_that.longitude,_that.isAvailable);case _:
  return null;

}
}

}

/// @nodoc


class _DealEntity implements DealEntity {
  const _DealEntity({required this.id, required this.vendorId, required this.foodName, required this.description, required this.originalPrice, required this.discountedPrice, required this.availablePortions, required this.pickupStartTime, required this.pickupEndTime, required this.imageUrl, required this.vendorName, required this.vendorAddress, required this.latitude, required this.longitude, this.isAvailable = true});
  

@override final  String id;
@override final  String vendorId;
@override final  String foodName;
@override final  String description;
@override final  double originalPrice;
@override final  double discountedPrice;
@override final  int availablePortions;
@override final  DateTime pickupStartTime;
@override final  DateTime pickupEndTime;
@override final  String imageUrl;
@override final  String vendorName;
@override final  String vendorAddress;
@override final  double latitude;
@override final  double longitude;
@override@JsonKey() final  bool isAvailable;

/// Create a copy of DealEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DealEntityCopyWith<_DealEntity> get copyWith => __$DealEntityCopyWithImpl<_DealEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DealEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.foodName, foodName) || other.foodName == foodName)&&(identical(other.description, description) || other.description == description)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.discountedPrice, discountedPrice) || other.discountedPrice == discountedPrice)&&(identical(other.availablePortions, availablePortions) || other.availablePortions == availablePortions)&&(identical(other.pickupStartTime, pickupStartTime) || other.pickupStartTime == pickupStartTime)&&(identical(other.pickupEndTime, pickupEndTime) || other.pickupEndTime == pickupEndTime)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.vendorName, vendorName) || other.vendorName == vendorName)&&(identical(other.vendorAddress, vendorAddress) || other.vendorAddress == vendorAddress)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable));
}


@override
int get hashCode => Object.hash(runtimeType,id,vendorId,foodName,description,originalPrice,discountedPrice,availablePortions,pickupStartTime,pickupEndTime,imageUrl,vendorName,vendorAddress,latitude,longitude,isAvailable);

@override
String toString() {
  return 'DealEntity(id: $id, vendorId: $vendorId, foodName: $foodName, description: $description, originalPrice: $originalPrice, discountedPrice: $discountedPrice, availablePortions: $availablePortions, pickupStartTime: $pickupStartTime, pickupEndTime: $pickupEndTime, imageUrl: $imageUrl, vendorName: $vendorName, vendorAddress: $vendorAddress, latitude: $latitude, longitude: $longitude, isAvailable: $isAvailable)';
}


}

/// @nodoc
abstract mixin class _$DealEntityCopyWith<$Res> implements $DealEntityCopyWith<$Res> {
  factory _$DealEntityCopyWith(_DealEntity value, $Res Function(_DealEntity) _then) = __$DealEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String vendorId, String foodName, String description, double originalPrice, double discountedPrice, int availablePortions, DateTime pickupStartTime, DateTime pickupEndTime, String imageUrl, String vendorName, String vendorAddress, double latitude, double longitude, bool isAvailable
});




}
/// @nodoc
class __$DealEntityCopyWithImpl<$Res>
    implements _$DealEntityCopyWith<$Res> {
  __$DealEntityCopyWithImpl(this._self, this._then);

  final _DealEntity _self;
  final $Res Function(_DealEntity) _then;

/// Create a copy of DealEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vendorId = null,Object? foodName = null,Object? description = null,Object? originalPrice = null,Object? discountedPrice = null,Object? availablePortions = null,Object? pickupStartTime = null,Object? pickupEndTime = null,Object? imageUrl = null,Object? vendorName = null,Object? vendorAddress = null,Object? latitude = null,Object? longitude = null,Object? isAvailable = null,}) {
  return _then(_DealEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,vendorId: null == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String,foodName: null == foodName ? _self.foodName : foodName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,originalPrice: null == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as double,discountedPrice: null == discountedPrice ? _self.discountedPrice : discountedPrice // ignore: cast_nullable_to_non_nullable
as double,availablePortions: null == availablePortions ? _self.availablePortions : availablePortions // ignore: cast_nullable_to_non_nullable
as int,pickupStartTime: null == pickupStartTime ? _self.pickupStartTime : pickupStartTime // ignore: cast_nullable_to_non_nullable
as DateTime,pickupEndTime: null == pickupEndTime ? _self.pickupEndTime : pickupEndTime // ignore: cast_nullable_to_non_nullable
as DateTime,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,vendorName: null == vendorName ? _self.vendorName : vendorName // ignore: cast_nullable_to_non_nullable
as String,vendorAddress: null == vendorAddress ? _self.vendorAddress : vendorAddress // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
