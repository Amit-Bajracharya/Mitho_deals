// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_items_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartItemModel {

 String get dealId; String get foodName; String get imageUrl; double get discountedPrice; int get quantity; String get vendorId; String get vendorName; DateTime get pickupStartTime; DateTime get pickupEndTime;
/// Create a copy of CartItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemModelCopyWith<CartItemModel> get copyWith => _$CartItemModelCopyWithImpl<CartItemModel>(this as CartItemModel, _$identity);

  /// Serializes this CartItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItemModel&&(identical(other.dealId, dealId) || other.dealId == dealId)&&(identical(other.foodName, foodName) || other.foodName == foodName)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.discountedPrice, discountedPrice) || other.discountedPrice == discountedPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.vendorName, vendorName) || other.vendorName == vendorName)&&(identical(other.pickupStartTime, pickupStartTime) || other.pickupStartTime == pickupStartTime)&&(identical(other.pickupEndTime, pickupEndTime) || other.pickupEndTime == pickupEndTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dealId,foodName,imageUrl,discountedPrice,quantity,vendorId,vendorName,pickupStartTime,pickupEndTime);

@override
String toString() {
  return 'CartItemModel(dealId: $dealId, foodName: $foodName, imageUrl: $imageUrl, discountedPrice: $discountedPrice, quantity: $quantity, vendorId: $vendorId, vendorName: $vendorName, pickupStartTime: $pickupStartTime, pickupEndTime: $pickupEndTime)';
}


}

/// @nodoc
abstract mixin class $CartItemModelCopyWith<$Res>  {
  factory $CartItemModelCopyWith(CartItemModel value, $Res Function(CartItemModel) _then) = _$CartItemModelCopyWithImpl;
@useResult
$Res call({
 String dealId, String foodName, String imageUrl, double discountedPrice, int quantity, String vendorId, String vendorName, DateTime pickupStartTime, DateTime pickupEndTime
});




}
/// @nodoc
class _$CartItemModelCopyWithImpl<$Res>
    implements $CartItemModelCopyWith<$Res> {
  _$CartItemModelCopyWithImpl(this._self, this._then);

  final CartItemModel _self;
  final $Res Function(CartItemModel) _then;

/// Create a copy of CartItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dealId = null,Object? foodName = null,Object? imageUrl = null,Object? discountedPrice = null,Object? quantity = null,Object? vendorId = null,Object? vendorName = null,Object? pickupStartTime = null,Object? pickupEndTime = null,}) {
  return _then(_self.copyWith(
dealId: null == dealId ? _self.dealId : dealId // ignore: cast_nullable_to_non_nullable
as String,foodName: null == foodName ? _self.foodName : foodName // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,discountedPrice: null == discountedPrice ? _self.discountedPrice : discountedPrice // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,vendorId: null == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String,vendorName: null == vendorName ? _self.vendorName : vendorName // ignore: cast_nullable_to_non_nullable
as String,pickupStartTime: null == pickupStartTime ? _self.pickupStartTime : pickupStartTime // ignore: cast_nullable_to_non_nullable
as DateTime,pickupEndTime: null == pickupEndTime ? _self.pickupEndTime : pickupEndTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CartItemModel].
extension CartItemModelPatterns on CartItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartItemModel value)  $default,){
final _that = this;
switch (_that) {
case _CartItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _CartItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String dealId,  String foodName,  String imageUrl,  double discountedPrice,  int quantity,  String vendorId,  String vendorName,  DateTime pickupStartTime,  DateTime pickupEndTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartItemModel() when $default != null:
return $default(_that.dealId,_that.foodName,_that.imageUrl,_that.discountedPrice,_that.quantity,_that.vendorId,_that.vendorName,_that.pickupStartTime,_that.pickupEndTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String dealId,  String foodName,  String imageUrl,  double discountedPrice,  int quantity,  String vendorId,  String vendorName,  DateTime pickupStartTime,  DateTime pickupEndTime)  $default,) {final _that = this;
switch (_that) {
case _CartItemModel():
return $default(_that.dealId,_that.foodName,_that.imageUrl,_that.discountedPrice,_that.quantity,_that.vendorId,_that.vendorName,_that.pickupStartTime,_that.pickupEndTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String dealId,  String foodName,  String imageUrl,  double discountedPrice,  int quantity,  String vendorId,  String vendorName,  DateTime pickupStartTime,  DateTime pickupEndTime)?  $default,) {final _that = this;
switch (_that) {
case _CartItemModel() when $default != null:
return $default(_that.dealId,_that.foodName,_that.imageUrl,_that.discountedPrice,_that.quantity,_that.vendorId,_that.vendorName,_that.pickupStartTime,_that.pickupEndTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartItemModel implements CartItemModel {
  const _CartItemModel({required this.dealId, required this.foodName, required this.imageUrl, required this.discountedPrice, required this.quantity, required this.vendorId, required this.vendorName, required this.pickupStartTime, required this.pickupEndTime});
  factory _CartItemModel.fromJson(Map<String, dynamic> json) => _$CartItemModelFromJson(json);

@override final  String dealId;
@override final  String foodName;
@override final  String imageUrl;
@override final  double discountedPrice;
@override final  int quantity;
@override final  String vendorId;
@override final  String vendorName;
@override final  DateTime pickupStartTime;
@override final  DateTime pickupEndTime;

/// Create a copy of CartItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartItemModelCopyWith<_CartItemModel> get copyWith => __$CartItemModelCopyWithImpl<_CartItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartItemModel&&(identical(other.dealId, dealId) || other.dealId == dealId)&&(identical(other.foodName, foodName) || other.foodName == foodName)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.discountedPrice, discountedPrice) || other.discountedPrice == discountedPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.vendorName, vendorName) || other.vendorName == vendorName)&&(identical(other.pickupStartTime, pickupStartTime) || other.pickupStartTime == pickupStartTime)&&(identical(other.pickupEndTime, pickupEndTime) || other.pickupEndTime == pickupEndTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dealId,foodName,imageUrl,discountedPrice,quantity,vendorId,vendorName,pickupStartTime,pickupEndTime);

@override
String toString() {
  return 'CartItemModel(dealId: $dealId, foodName: $foodName, imageUrl: $imageUrl, discountedPrice: $discountedPrice, quantity: $quantity, vendorId: $vendorId, vendorName: $vendorName, pickupStartTime: $pickupStartTime, pickupEndTime: $pickupEndTime)';
}


}

/// @nodoc
abstract mixin class _$CartItemModelCopyWith<$Res> implements $CartItemModelCopyWith<$Res> {
  factory _$CartItemModelCopyWith(_CartItemModel value, $Res Function(_CartItemModel) _then) = __$CartItemModelCopyWithImpl;
@override @useResult
$Res call({
 String dealId, String foodName, String imageUrl, double discountedPrice, int quantity, String vendorId, String vendorName, DateTime pickupStartTime, DateTime pickupEndTime
});




}
/// @nodoc
class __$CartItemModelCopyWithImpl<$Res>
    implements _$CartItemModelCopyWith<$Res> {
  __$CartItemModelCopyWithImpl(this._self, this._then);

  final _CartItemModel _self;
  final $Res Function(_CartItemModel) _then;

/// Create a copy of CartItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dealId = null,Object? foodName = null,Object? imageUrl = null,Object? discountedPrice = null,Object? quantity = null,Object? vendorId = null,Object? vendorName = null,Object? pickupStartTime = null,Object? pickupEndTime = null,}) {
  return _then(_CartItemModel(
dealId: null == dealId ? _self.dealId : dealId // ignore: cast_nullable_to_non_nullable
as String,foodName: null == foodName ? _self.foodName : foodName // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,discountedPrice: null == discountedPrice ? _self.discountedPrice : discountedPrice // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,vendorId: null == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String,vendorName: null == vendorName ? _self.vendorName : vendorName // ignore: cast_nullable_to_non_nullable
as String,pickupStartTime: null == pickupStartTime ? _self.pickupStartTime : pickupStartTime // ignore: cast_nullable_to_non_nullable
as DateTime,pickupEndTime: null == pickupEndTime ? _self.pickupEndTime : pickupEndTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
