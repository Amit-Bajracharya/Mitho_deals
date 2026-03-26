// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderEntity {

 String get id; String get userId; String get dealId; int get quantity; double get totalPrice; String get status; DateTime get createdAt;// We optionally fetch the Deal so the UI can show the food name
 DealEntity? get deal;
/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderEntityCopyWith<OrderEntity> get copyWith => _$OrderEntityCopyWithImpl<OrderEntity>(this as OrderEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.dealId, dealId) || other.dealId == dealId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deal, deal) || other.deal == deal));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,dealId,quantity,totalPrice,status,createdAt,deal);

@override
String toString() {
  return 'OrderEntity(id: $id, userId: $userId, dealId: $dealId, quantity: $quantity, totalPrice: $totalPrice, status: $status, createdAt: $createdAt, deal: $deal)';
}


}

/// @nodoc
abstract mixin class $OrderEntityCopyWith<$Res>  {
  factory $OrderEntityCopyWith(OrderEntity value, $Res Function(OrderEntity) _then) = _$OrderEntityCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String dealId, int quantity, double totalPrice, String status, DateTime createdAt, DealEntity? deal
});


$DealEntityCopyWith<$Res>? get deal;

}
/// @nodoc
class _$OrderEntityCopyWithImpl<$Res>
    implements $OrderEntityCopyWith<$Res> {
  _$OrderEntityCopyWithImpl(this._self, this._then);

  final OrderEntity _self;
  final $Res Function(OrderEntity) _then;

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? dealId = null,Object? quantity = null,Object? totalPrice = null,Object? status = null,Object? createdAt = null,Object? deal = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,dealId: null == dealId ? _self.dealId : dealId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,deal: freezed == deal ? _self.deal : deal // ignore: cast_nullable_to_non_nullable
as DealEntity?,
  ));
}
/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DealEntityCopyWith<$Res>? get deal {
    if (_self.deal == null) {
    return null;
  }

  return $DealEntityCopyWith<$Res>(_self.deal!, (value) {
    return _then(_self.copyWith(deal: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderEntity].
extension OrderEntityPatterns on OrderEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderEntity value)  $default,){
final _that = this;
switch (_that) {
case _OrderEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String dealId,  int quantity,  double totalPrice,  String status,  DateTime createdAt,  DealEntity? deal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that.id,_that.userId,_that.dealId,_that.quantity,_that.totalPrice,_that.status,_that.createdAt,_that.deal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String dealId,  int quantity,  double totalPrice,  String status,  DateTime createdAt,  DealEntity? deal)  $default,) {final _that = this;
switch (_that) {
case _OrderEntity():
return $default(_that.id,_that.userId,_that.dealId,_that.quantity,_that.totalPrice,_that.status,_that.createdAt,_that.deal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String dealId,  int quantity,  double totalPrice,  String status,  DateTime createdAt,  DealEntity? deal)?  $default,) {final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that.id,_that.userId,_that.dealId,_that.quantity,_that.totalPrice,_that.status,_that.createdAt,_that.deal);case _:
  return null;

}
}

}

/// @nodoc


class _OrderEntity implements OrderEntity {
  const _OrderEntity({required this.id, required this.userId, required this.dealId, required this.quantity, required this.totalPrice, required this.status, required this.createdAt, this.deal});
  

@override final  String id;
@override final  String userId;
@override final  String dealId;
@override final  int quantity;
@override final  double totalPrice;
@override final  String status;
@override final  DateTime createdAt;
// We optionally fetch the Deal so the UI can show the food name
@override final  DealEntity? deal;

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderEntityCopyWith<_OrderEntity> get copyWith => __$OrderEntityCopyWithImpl<_OrderEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.dealId, dealId) || other.dealId == dealId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deal, deal) || other.deal == deal));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,dealId,quantity,totalPrice,status,createdAt,deal);

@override
String toString() {
  return 'OrderEntity(id: $id, userId: $userId, dealId: $dealId, quantity: $quantity, totalPrice: $totalPrice, status: $status, createdAt: $createdAt, deal: $deal)';
}


}

/// @nodoc
abstract mixin class _$OrderEntityCopyWith<$Res> implements $OrderEntityCopyWith<$Res> {
  factory _$OrderEntityCopyWith(_OrderEntity value, $Res Function(_OrderEntity) _then) = __$OrderEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String dealId, int quantity, double totalPrice, String status, DateTime createdAt, DealEntity? deal
});


@override $DealEntityCopyWith<$Res>? get deal;

}
/// @nodoc
class __$OrderEntityCopyWithImpl<$Res>
    implements _$OrderEntityCopyWith<$Res> {
  __$OrderEntityCopyWithImpl(this._self, this._then);

  final _OrderEntity _self;
  final $Res Function(_OrderEntity) _then;

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? dealId = null,Object? quantity = null,Object? totalPrice = null,Object? status = null,Object? createdAt = null,Object? deal = freezed,}) {
  return _then(_OrderEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,dealId: null == dealId ? _self.dealId : dealId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,deal: freezed == deal ? _self.deal : deal // ignore: cast_nullable_to_non_nullable
as DealEntity?,
  ));
}

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DealEntityCopyWith<$Res>? get deal {
    if (_self.deal == null) {
    return null;
  }

  return $DealEntityCopyWith<$Res>(_self.deal!, (value) {
    return _then(_self.copyWith(deal: value));
  });
}
}

// dart format on
