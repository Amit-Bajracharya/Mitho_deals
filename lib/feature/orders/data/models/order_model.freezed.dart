// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderModel {

 String get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'deal_id') String get dealId;@JsonKey(name: 'vendor_id') String get vendorId; int get quantity;@JsonKey(name: 'total_amount') double get totalAmount; String get status;@JsonKey(name: 'pickup_code') String get pickupCode;@JsonKey(name: 'order_placed_time') DateTime get orderPlacedTime;// Handles the Supabase join: .select('*, deals(*)')
@JsonKey(name: 'deals') DealModel? get deal;// Handles the Supabase join: .select('*, vendors(name)')
// Supabase returns { "vendors": { "name": "..." } }
@JsonKey(name: 'vendors') Map<String, dynamic>? get vendorInfo;
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderModelCopyWith<OrderModel> get copyWith => _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.dealId, dealId) || other.dealId == dealId)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.pickupCode, pickupCode) || other.pickupCode == pickupCode)&&(identical(other.orderPlacedTime, orderPlacedTime) || other.orderPlacedTime == orderPlacedTime)&&(identical(other.deal, deal) || other.deal == deal)&&const DeepCollectionEquality().equals(other.vendorInfo, vendorInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,dealId,vendorId,quantity,totalAmount,status,pickupCode,orderPlacedTime,deal,const DeepCollectionEquality().hash(vendorInfo));

@override
String toString() {
  return 'OrderModel(id: $id, userId: $userId, dealId: $dealId, vendorId: $vendorId, quantity: $quantity, totalAmount: $totalAmount, status: $status, pickupCode: $pickupCode, orderPlacedTime: $orderPlacedTime, deal: $deal, vendorInfo: $vendorInfo)';
}


}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res>  {
  factory $OrderModelCopyWith(OrderModel value, $Res Function(OrderModel) _then) = _$OrderModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'deal_id') String dealId,@JsonKey(name: 'vendor_id') String vendorId, int quantity,@JsonKey(name: 'total_amount') double totalAmount, String status,@JsonKey(name: 'pickup_code') String pickupCode,@JsonKey(name: 'order_placed_time') DateTime orderPlacedTime,@JsonKey(name: 'deals') DealModel? deal,@JsonKey(name: 'vendors') Map<String, dynamic>? vendorInfo
});


$DealModelCopyWith<$Res>? get deal;

}
/// @nodoc
class _$OrderModelCopyWithImpl<$Res>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? dealId = null,Object? vendorId = null,Object? quantity = null,Object? totalAmount = null,Object? status = null,Object? pickupCode = null,Object? orderPlacedTime = null,Object? deal = freezed,Object? vendorInfo = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,dealId: null == dealId ? _self.dealId : dealId // ignore: cast_nullable_to_non_nullable
as String,vendorId: null == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,pickupCode: null == pickupCode ? _self.pickupCode : pickupCode // ignore: cast_nullable_to_non_nullable
as String,orderPlacedTime: null == orderPlacedTime ? _self.orderPlacedTime : orderPlacedTime // ignore: cast_nullable_to_non_nullable
as DateTime,deal: freezed == deal ? _self.deal : deal // ignore: cast_nullable_to_non_nullable
as DealModel?,vendorInfo: freezed == vendorInfo ? _self.vendorInfo : vendorInfo // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DealModelCopyWith<$Res>? get deal {
    if (_self.deal == null) {
    return null;
  }

  return $DealModelCopyWith<$Res>(_self.deal!, (value) {
    return _then(_self.copyWith(deal: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderModel].
extension OrderModelPatterns on OrderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'deal_id')  String dealId, @JsonKey(name: 'vendor_id')  String vendorId,  int quantity, @JsonKey(name: 'total_amount')  double totalAmount,  String status, @JsonKey(name: 'pickup_code')  String pickupCode, @JsonKey(name: 'order_placed_time')  DateTime orderPlacedTime, @JsonKey(name: 'deals')  DealModel? deal, @JsonKey(name: 'vendors')  Map<String, dynamic>? vendorInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.userId,_that.dealId,_that.vendorId,_that.quantity,_that.totalAmount,_that.status,_that.pickupCode,_that.orderPlacedTime,_that.deal,_that.vendorInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'deal_id')  String dealId, @JsonKey(name: 'vendor_id')  String vendorId,  int quantity, @JsonKey(name: 'total_amount')  double totalAmount,  String status, @JsonKey(name: 'pickup_code')  String pickupCode, @JsonKey(name: 'order_placed_time')  DateTime orderPlacedTime, @JsonKey(name: 'deals')  DealModel? deal, @JsonKey(name: 'vendors')  Map<String, dynamic>? vendorInfo)  $default,) {final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that.id,_that.userId,_that.dealId,_that.vendorId,_that.quantity,_that.totalAmount,_that.status,_that.pickupCode,_that.orderPlacedTime,_that.deal,_that.vendorInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'deal_id')  String dealId, @JsonKey(name: 'vendor_id')  String vendorId,  int quantity, @JsonKey(name: 'total_amount')  double totalAmount,  String status, @JsonKey(name: 'pickup_code')  String pickupCode, @JsonKey(name: 'order_placed_time')  DateTime orderPlacedTime, @JsonKey(name: 'deals')  DealModel? deal, @JsonKey(name: 'vendors')  Map<String, dynamic>? vendorInfo)?  $default,) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.id,_that.userId,_that.dealId,_that.vendorId,_that.quantity,_that.totalAmount,_that.status,_that.pickupCode,_that.orderPlacedTime,_that.deal,_that.vendorInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderModel extends OrderModel {
  const _OrderModel({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'deal_id') required this.dealId, @JsonKey(name: 'vendor_id') required this.vendorId, required this.quantity, @JsonKey(name: 'total_amount') required this.totalAmount, required this.status, @JsonKey(name: 'pickup_code') required this.pickupCode, @JsonKey(name: 'order_placed_time') required this.orderPlacedTime, @JsonKey(name: 'deals') this.deal, @JsonKey(name: 'vendors') final  Map<String, dynamic>? vendorInfo}): _vendorInfo = vendorInfo,super._();
  factory _OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'deal_id') final  String dealId;
@override@JsonKey(name: 'vendor_id') final  String vendorId;
@override final  int quantity;
@override@JsonKey(name: 'total_amount') final  double totalAmount;
@override final  String status;
@override@JsonKey(name: 'pickup_code') final  String pickupCode;
@override@JsonKey(name: 'order_placed_time') final  DateTime orderPlacedTime;
// Handles the Supabase join: .select('*, deals(*)')
@override@JsonKey(name: 'deals') final  DealModel? deal;
// Handles the Supabase join: .select('*, vendors(name)')
// Supabase returns { "vendors": { "name": "..." } }
 final  Map<String, dynamic>? _vendorInfo;
// Handles the Supabase join: .select('*, vendors(name)')
// Supabase returns { "vendors": { "name": "..." } }
@override@JsonKey(name: 'vendors') Map<String, dynamic>? get vendorInfo {
  final value = _vendorInfo;
  if (value == null) return null;
  if (_vendorInfo is EqualUnmodifiableMapView) return _vendorInfo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderModelCopyWith<_OrderModel> get copyWith => __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.dealId, dealId) || other.dealId == dealId)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.pickupCode, pickupCode) || other.pickupCode == pickupCode)&&(identical(other.orderPlacedTime, orderPlacedTime) || other.orderPlacedTime == orderPlacedTime)&&(identical(other.deal, deal) || other.deal == deal)&&const DeepCollectionEquality().equals(other._vendorInfo, _vendorInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,dealId,vendorId,quantity,totalAmount,status,pickupCode,orderPlacedTime,deal,const DeepCollectionEquality().hash(_vendorInfo));

@override
String toString() {
  return 'OrderModel(id: $id, userId: $userId, dealId: $dealId, vendorId: $vendorId, quantity: $quantity, totalAmount: $totalAmount, status: $status, pickupCode: $pickupCode, orderPlacedTime: $orderPlacedTime, deal: $deal, vendorInfo: $vendorInfo)';
}


}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(_OrderModel value, $Res Function(_OrderModel) _then) = __$OrderModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'deal_id') String dealId,@JsonKey(name: 'vendor_id') String vendorId, int quantity,@JsonKey(name: 'total_amount') double totalAmount, String status,@JsonKey(name: 'pickup_code') String pickupCode,@JsonKey(name: 'order_placed_time') DateTime orderPlacedTime,@JsonKey(name: 'deals') DealModel? deal,@JsonKey(name: 'vendors') Map<String, dynamic>? vendorInfo
});


@override $DealModelCopyWith<$Res>? get deal;

}
/// @nodoc
class __$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? dealId = null,Object? vendorId = null,Object? quantity = null,Object? totalAmount = null,Object? status = null,Object? pickupCode = null,Object? orderPlacedTime = null,Object? deal = freezed,Object? vendorInfo = freezed,}) {
  return _then(_OrderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,dealId: null == dealId ? _self.dealId : dealId // ignore: cast_nullable_to_non_nullable
as String,vendorId: null == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,pickupCode: null == pickupCode ? _self.pickupCode : pickupCode // ignore: cast_nullable_to_non_nullable
as String,orderPlacedTime: null == orderPlacedTime ? _self.orderPlacedTime : orderPlacedTime // ignore: cast_nullable_to_non_nullable
as DateTime,deal: freezed == deal ? _self.deal : deal // ignore: cast_nullable_to_non_nullable
as DealModel?,vendorInfo: freezed == vendorInfo ? _self._vendorInfo : vendorInfo // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DealModelCopyWith<$Res>? get deal {
    if (_self.deal == null) {
    return null;
  }

  return $DealModelCopyWith<$Res>(_self.deal!, (value) {
    return _then(_self.copyWith(deal: value));
  });
}
}

// dart format on
