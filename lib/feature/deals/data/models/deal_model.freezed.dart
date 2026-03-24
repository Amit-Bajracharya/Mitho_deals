// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DealModel {

 String get id;@JsonKey(name: 'vendor_id') String get vendorId;@JsonKey(name: 'food_name') String get foodName; String get description;@JsonKey(name: 'original_price') double get originalPrice;@JsonKey(name: 'discounted_price') double get discountedPrice;@JsonKey(name: 'available_portions') int get availablePortions;@JsonKey(name: 'pickup_start_time') DateTime get pickupStartTime;@JsonKey(name: 'pickup_end_time') DateTime get pickupEndTime;@JsonKey(name: 'image_url') String get imageUrl;@JsonKey(name: 'is_available') bool get isAvailable;
/// Create a copy of DealModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DealModelCopyWith<DealModel> get copyWith => _$DealModelCopyWithImpl<DealModel>(this as DealModel, _$identity);

  /// Serializes this DealModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DealModel&&(identical(other.id, id) || other.id == id)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.foodName, foodName) || other.foodName == foodName)&&(identical(other.description, description) || other.description == description)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.discountedPrice, discountedPrice) || other.discountedPrice == discountedPrice)&&(identical(other.availablePortions, availablePortions) || other.availablePortions == availablePortions)&&(identical(other.pickupStartTime, pickupStartTime) || other.pickupStartTime == pickupStartTime)&&(identical(other.pickupEndTime, pickupEndTime) || other.pickupEndTime == pickupEndTime)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vendorId,foodName,description,originalPrice,discountedPrice,availablePortions,pickupStartTime,pickupEndTime,imageUrl,isAvailable);

@override
String toString() {
  return 'DealModel(id: $id, vendorId: $vendorId, foodName: $foodName, description: $description, originalPrice: $originalPrice, discountedPrice: $discountedPrice, availablePortions: $availablePortions, pickupStartTime: $pickupStartTime, pickupEndTime: $pickupEndTime, imageUrl: $imageUrl, isAvailable: $isAvailable)';
}


}

/// @nodoc
abstract mixin class $DealModelCopyWith<$Res>  {
  factory $DealModelCopyWith(DealModel value, $Res Function(DealModel) _then) = _$DealModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'vendor_id') String vendorId,@JsonKey(name: 'food_name') String foodName, String description,@JsonKey(name: 'original_price') double originalPrice,@JsonKey(name: 'discounted_price') double discountedPrice,@JsonKey(name: 'available_portions') int availablePortions,@JsonKey(name: 'pickup_start_time') DateTime pickupStartTime,@JsonKey(name: 'pickup_end_time') DateTime pickupEndTime,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'is_available') bool isAvailable
});




}
/// @nodoc
class _$DealModelCopyWithImpl<$Res>
    implements $DealModelCopyWith<$Res> {
  _$DealModelCopyWithImpl(this._self, this._then);

  final DealModel _self;
  final $Res Function(DealModel) _then;

/// Create a copy of DealModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? vendorId = null,Object? foodName = null,Object? description = null,Object? originalPrice = null,Object? discountedPrice = null,Object? availablePortions = null,Object? pickupStartTime = null,Object? pickupEndTime = null,Object? imageUrl = null,Object? isAvailable = null,}) {
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
as String,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DealModel].
extension DealModelPatterns on DealModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DealModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DealModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DealModel value)  $default,){
final _that = this;
switch (_that) {
case _DealModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DealModel value)?  $default,){
final _that = this;
switch (_that) {
case _DealModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'vendor_id')  String vendorId, @JsonKey(name: 'food_name')  String foodName,  String description, @JsonKey(name: 'original_price')  double originalPrice, @JsonKey(name: 'discounted_price')  double discountedPrice, @JsonKey(name: 'available_portions')  int availablePortions, @JsonKey(name: 'pickup_start_time')  DateTime pickupStartTime, @JsonKey(name: 'pickup_end_time')  DateTime pickupEndTime, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'is_available')  bool isAvailable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DealModel() when $default != null:
return $default(_that.id,_that.vendorId,_that.foodName,_that.description,_that.originalPrice,_that.discountedPrice,_that.availablePortions,_that.pickupStartTime,_that.pickupEndTime,_that.imageUrl,_that.isAvailable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'vendor_id')  String vendorId, @JsonKey(name: 'food_name')  String foodName,  String description, @JsonKey(name: 'original_price')  double originalPrice, @JsonKey(name: 'discounted_price')  double discountedPrice, @JsonKey(name: 'available_portions')  int availablePortions, @JsonKey(name: 'pickup_start_time')  DateTime pickupStartTime, @JsonKey(name: 'pickup_end_time')  DateTime pickupEndTime, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'is_available')  bool isAvailable)  $default,) {final _that = this;
switch (_that) {
case _DealModel():
return $default(_that.id,_that.vendorId,_that.foodName,_that.description,_that.originalPrice,_that.discountedPrice,_that.availablePortions,_that.pickupStartTime,_that.pickupEndTime,_that.imageUrl,_that.isAvailable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'vendor_id')  String vendorId, @JsonKey(name: 'food_name')  String foodName,  String description, @JsonKey(name: 'original_price')  double originalPrice, @JsonKey(name: 'discounted_price')  double discountedPrice, @JsonKey(name: 'available_portions')  int availablePortions, @JsonKey(name: 'pickup_start_time')  DateTime pickupStartTime, @JsonKey(name: 'pickup_end_time')  DateTime pickupEndTime, @JsonKey(name: 'image_url')  String imageUrl, @JsonKey(name: 'is_available')  bool isAvailable)?  $default,) {final _that = this;
switch (_that) {
case _DealModel() when $default != null:
return $default(_that.id,_that.vendorId,_that.foodName,_that.description,_that.originalPrice,_that.discountedPrice,_that.availablePortions,_that.pickupStartTime,_that.pickupEndTime,_that.imageUrl,_that.isAvailable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DealModel extends DealModel {
  const _DealModel({required this.id, @JsonKey(name: 'vendor_id') required this.vendorId, @JsonKey(name: 'food_name') required this.foodName, required this.description, @JsonKey(name: 'original_price') required this.originalPrice, @JsonKey(name: 'discounted_price') required this.discountedPrice, @JsonKey(name: 'available_portions') required this.availablePortions, @JsonKey(name: 'pickup_start_time') required this.pickupStartTime, @JsonKey(name: 'pickup_end_time') required this.pickupEndTime, @JsonKey(name: 'image_url') this.imageUrl = '', @JsonKey(name: 'is_available') this.isAvailable = true}): super._();
  factory _DealModel.fromJson(Map<String, dynamic> json) => _$DealModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'vendor_id') final  String vendorId;
@override@JsonKey(name: 'food_name') final  String foodName;
@override final  String description;
@override@JsonKey(name: 'original_price') final  double originalPrice;
@override@JsonKey(name: 'discounted_price') final  double discountedPrice;
@override@JsonKey(name: 'available_portions') final  int availablePortions;
@override@JsonKey(name: 'pickup_start_time') final  DateTime pickupStartTime;
@override@JsonKey(name: 'pickup_end_time') final  DateTime pickupEndTime;
@override@JsonKey(name: 'image_url') final  String imageUrl;
@override@JsonKey(name: 'is_available') final  bool isAvailable;

/// Create a copy of DealModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DealModelCopyWith<_DealModel> get copyWith => __$DealModelCopyWithImpl<_DealModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DealModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DealModel&&(identical(other.id, id) || other.id == id)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.foodName, foodName) || other.foodName == foodName)&&(identical(other.description, description) || other.description == description)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.discountedPrice, discountedPrice) || other.discountedPrice == discountedPrice)&&(identical(other.availablePortions, availablePortions) || other.availablePortions == availablePortions)&&(identical(other.pickupStartTime, pickupStartTime) || other.pickupStartTime == pickupStartTime)&&(identical(other.pickupEndTime, pickupEndTime) || other.pickupEndTime == pickupEndTime)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,vendorId,foodName,description,originalPrice,discountedPrice,availablePortions,pickupStartTime,pickupEndTime,imageUrl,isAvailable);

@override
String toString() {
  return 'DealModel(id: $id, vendorId: $vendorId, foodName: $foodName, description: $description, originalPrice: $originalPrice, discountedPrice: $discountedPrice, availablePortions: $availablePortions, pickupStartTime: $pickupStartTime, pickupEndTime: $pickupEndTime, imageUrl: $imageUrl, isAvailable: $isAvailable)';
}


}

/// @nodoc
abstract mixin class _$DealModelCopyWith<$Res> implements $DealModelCopyWith<$Res> {
  factory _$DealModelCopyWith(_DealModel value, $Res Function(_DealModel) _then) = __$DealModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'vendor_id') String vendorId,@JsonKey(name: 'food_name') String foodName, String description,@JsonKey(name: 'original_price') double originalPrice,@JsonKey(name: 'discounted_price') double discountedPrice,@JsonKey(name: 'available_portions') int availablePortions,@JsonKey(name: 'pickup_start_time') DateTime pickupStartTime,@JsonKey(name: 'pickup_end_time') DateTime pickupEndTime,@JsonKey(name: 'image_url') String imageUrl,@JsonKey(name: 'is_available') bool isAvailable
});




}
/// @nodoc
class __$DealModelCopyWithImpl<$Res>
    implements _$DealModelCopyWith<$Res> {
  __$DealModelCopyWithImpl(this._self, this._then);

  final _DealModel _self;
  final $Res Function(_DealModel) _then;

/// Create a copy of DealModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? vendorId = null,Object? foodName = null,Object? description = null,Object? originalPrice = null,Object? discountedPrice = null,Object? availablePortions = null,Object? pickupStartTime = null,Object? pickupEndTime = null,Object? imageUrl = null,Object? isAvailable = null,}) {
  return _then(_DealModel(
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
as String,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
