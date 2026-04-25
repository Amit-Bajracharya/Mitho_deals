// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartEvent()';
}


}

/// @nodoc
class $CartEventCopyWith<$Res>  {
$CartEventCopyWith(CartEvent _, $Res Function(CartEvent) __);
}


/// Adds pattern-matching-related methods to [CartEvent].
extension CartEventPatterns on CartEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadCart value)?  loadCart,TResult Function( AddToCart value)?  addToCart,TResult Function( UpdateQuantity value)?  updateQuantity,TResult Function( RemoveFromCart value)?  removeFromCart,TResult Function( ClearCart value)?  clearCart,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadCart() when loadCart != null:
return loadCart(_that);case AddToCart() when addToCart != null:
return addToCart(_that);case UpdateQuantity() when updateQuantity != null:
return updateQuantity(_that);case RemoveFromCart() when removeFromCart != null:
return removeFromCart(_that);case ClearCart() when clearCart != null:
return clearCart(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadCart value)  loadCart,required TResult Function( AddToCart value)  addToCart,required TResult Function( UpdateQuantity value)  updateQuantity,required TResult Function( RemoveFromCart value)  removeFromCart,required TResult Function( ClearCart value)  clearCart,}){
final _that = this;
switch (_that) {
case LoadCart():
return loadCart(_that);case AddToCart():
return addToCart(_that);case UpdateQuantity():
return updateQuantity(_that);case RemoveFromCart():
return removeFromCart(_that);case ClearCart():
return clearCart(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadCart value)?  loadCart,TResult? Function( AddToCart value)?  addToCart,TResult? Function( UpdateQuantity value)?  updateQuantity,TResult? Function( RemoveFromCart value)?  removeFromCart,TResult? Function( ClearCart value)?  clearCart,}){
final _that = this;
switch (_that) {
case LoadCart() when loadCart != null:
return loadCart(_that);case AddToCart() when addToCart != null:
return addToCart(_that);case UpdateQuantity() when updateQuantity != null:
return updateQuantity(_that);case RemoveFromCart() when removeFromCart != null:
return removeFromCart(_that);case ClearCart() when clearCart != null:
return clearCart(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadCart,TResult Function( CartItem item)?  addToCart,TResult Function( String dealId,  int quantity)?  updateQuantity,TResult Function( String dealId)?  removeFromCart,TResult Function()?  clearCart,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadCart() when loadCart != null:
return loadCart();case AddToCart() when addToCart != null:
return addToCart(_that.item);case UpdateQuantity() when updateQuantity != null:
return updateQuantity(_that.dealId,_that.quantity);case RemoveFromCart() when removeFromCart != null:
return removeFromCart(_that.dealId);case ClearCart() when clearCart != null:
return clearCart();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadCart,required TResult Function( CartItem item)  addToCart,required TResult Function( String dealId,  int quantity)  updateQuantity,required TResult Function( String dealId)  removeFromCart,required TResult Function()  clearCart,}) {final _that = this;
switch (_that) {
case LoadCart():
return loadCart();case AddToCart():
return addToCart(_that.item);case UpdateQuantity():
return updateQuantity(_that.dealId,_that.quantity);case RemoveFromCart():
return removeFromCart(_that.dealId);case ClearCart():
return clearCart();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadCart,TResult? Function( CartItem item)?  addToCart,TResult? Function( String dealId,  int quantity)?  updateQuantity,TResult? Function( String dealId)?  removeFromCart,TResult? Function()?  clearCart,}) {final _that = this;
switch (_that) {
case LoadCart() when loadCart != null:
return loadCart();case AddToCart() when addToCart != null:
return addToCart(_that.item);case UpdateQuantity() when updateQuantity != null:
return updateQuantity(_that.dealId,_that.quantity);case RemoveFromCart() when removeFromCart != null:
return removeFromCart(_that.dealId);case ClearCart() when clearCart != null:
return clearCart();case _:
  return null;

}
}

}

/// @nodoc


class LoadCart implements CartEvent {
  const LoadCart();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadCart);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartEvent.loadCart()';
}


}




/// @nodoc


class AddToCart implements CartEvent {
  const AddToCart(this.item);
  

 final  CartItem item;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddToCartCopyWith<AddToCart> get copyWith => _$AddToCartCopyWithImpl<AddToCart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddToCart&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'CartEvent.addToCart(item: $item)';
}


}

/// @nodoc
abstract mixin class $AddToCartCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $AddToCartCopyWith(AddToCart value, $Res Function(AddToCart) _then) = _$AddToCartCopyWithImpl;
@useResult
$Res call({
 CartItem item
});


$CartItemCopyWith<$Res> get item;

}
/// @nodoc
class _$AddToCartCopyWithImpl<$Res>
    implements $AddToCartCopyWith<$Res> {
  _$AddToCartCopyWithImpl(this._self, this._then);

  final AddToCart _self;
  final $Res Function(AddToCart) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(AddToCart(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as CartItem,
  ));
}

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartItemCopyWith<$Res> get item {
  
  return $CartItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc


class UpdateQuantity implements CartEvent {
  const UpdateQuantity(this.dealId, this.quantity);
  

 final  String dealId;
 final  int quantity;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateQuantityCopyWith<UpdateQuantity> get copyWith => _$UpdateQuantityCopyWithImpl<UpdateQuantity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateQuantity&&(identical(other.dealId, dealId) || other.dealId == dealId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,dealId,quantity);

@override
String toString() {
  return 'CartEvent.updateQuantity(dealId: $dealId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $UpdateQuantityCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $UpdateQuantityCopyWith(UpdateQuantity value, $Res Function(UpdateQuantity) _then) = _$UpdateQuantityCopyWithImpl;
@useResult
$Res call({
 String dealId, int quantity
});




}
/// @nodoc
class _$UpdateQuantityCopyWithImpl<$Res>
    implements $UpdateQuantityCopyWith<$Res> {
  _$UpdateQuantityCopyWithImpl(this._self, this._then);

  final UpdateQuantity _self;
  final $Res Function(UpdateQuantity) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dealId = null,Object? quantity = null,}) {
  return _then(UpdateQuantity(
null == dealId ? _self.dealId : dealId // ignore: cast_nullable_to_non_nullable
as String,null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class RemoveFromCart implements CartEvent {
  const RemoveFromCart(this.dealId);
  

 final  String dealId;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveFromCartCopyWith<RemoveFromCart> get copyWith => _$RemoveFromCartCopyWithImpl<RemoveFromCart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveFromCart&&(identical(other.dealId, dealId) || other.dealId == dealId));
}


@override
int get hashCode => Object.hash(runtimeType,dealId);

@override
String toString() {
  return 'CartEvent.removeFromCart(dealId: $dealId)';
}


}

/// @nodoc
abstract mixin class $RemoveFromCartCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory $RemoveFromCartCopyWith(RemoveFromCart value, $Res Function(RemoveFromCart) _then) = _$RemoveFromCartCopyWithImpl;
@useResult
$Res call({
 String dealId
});




}
/// @nodoc
class _$RemoveFromCartCopyWithImpl<$Res>
    implements $RemoveFromCartCopyWith<$Res> {
  _$RemoveFromCartCopyWithImpl(this._self, this._then);

  final RemoveFromCart _self;
  final $Res Function(RemoveFromCart) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dealId = null,}) {
  return _then(RemoveFromCart(
null == dealId ? _self.dealId : dealId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ClearCart implements CartEvent {
  const ClearCart();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearCart);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartEvent.clearCart()';
}


}




// dart format on
