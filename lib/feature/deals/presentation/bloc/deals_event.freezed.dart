// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deals_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DealsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DealsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DealsEvent()';
}


}

/// @nodoc
class $DealsEventCopyWith<$Res>  {
$DealsEventCopyWith(DealsEvent _, $Res Function(DealsEvent) __);
}


/// Adds pattern-matching-related methods to [DealsEvent].
extension DealsEventPatterns on DealsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadDeals value)?  loadDeals,TResult Function( AddDeal value)?  addDeal,TResult Function( ClaimDeal value)?  claimDeal,TResult Function( LoadVendorDeals value)?  loadVendorDeals,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadDeals() when loadDeals != null:
return loadDeals(_that);case AddDeal() when addDeal != null:
return addDeal(_that);case ClaimDeal() when claimDeal != null:
return claimDeal(_that);case LoadVendorDeals() when loadVendorDeals != null:
return loadVendorDeals(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadDeals value)  loadDeals,required TResult Function( AddDeal value)  addDeal,required TResult Function( ClaimDeal value)  claimDeal,required TResult Function( LoadVendorDeals value)  loadVendorDeals,}){
final _that = this;
switch (_that) {
case LoadDeals():
return loadDeals(_that);case AddDeal():
return addDeal(_that);case ClaimDeal():
return claimDeal(_that);case LoadVendorDeals():
return loadVendorDeals(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadDeals value)?  loadDeals,TResult? Function( AddDeal value)?  addDeal,TResult? Function( ClaimDeal value)?  claimDeal,TResult? Function( LoadVendorDeals value)?  loadVendorDeals,}){
final _that = this;
switch (_that) {
case LoadDeals() when loadDeals != null:
return loadDeals(_that);case AddDeal() when addDeal != null:
return addDeal(_that);case ClaimDeal() when claimDeal != null:
return claimDeal(_that);case LoadVendorDeals() when loadVendorDeals != null:
return loadVendorDeals(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadDeals,TResult Function( DealEntity deal,  File? imageFile)?  addDeal,TResult Function( String dealId,  int quantity)?  claimDeal,TResult Function()?  loadVendorDeals,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadDeals() when loadDeals != null:
return loadDeals();case AddDeal() when addDeal != null:
return addDeal(_that.deal,_that.imageFile);case ClaimDeal() when claimDeal != null:
return claimDeal(_that.dealId,_that.quantity);case LoadVendorDeals() when loadVendorDeals != null:
return loadVendorDeals();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadDeals,required TResult Function( DealEntity deal,  File? imageFile)  addDeal,required TResult Function( String dealId,  int quantity)  claimDeal,required TResult Function()  loadVendorDeals,}) {final _that = this;
switch (_that) {
case LoadDeals():
return loadDeals();case AddDeal():
return addDeal(_that.deal,_that.imageFile);case ClaimDeal():
return claimDeal(_that.dealId,_that.quantity);case LoadVendorDeals():
return loadVendorDeals();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadDeals,TResult? Function( DealEntity deal,  File? imageFile)?  addDeal,TResult? Function( String dealId,  int quantity)?  claimDeal,TResult? Function()?  loadVendorDeals,}) {final _that = this;
switch (_that) {
case LoadDeals() when loadDeals != null:
return loadDeals();case AddDeal() when addDeal != null:
return addDeal(_that.deal,_that.imageFile);case ClaimDeal() when claimDeal != null:
return claimDeal(_that.dealId,_that.quantity);case LoadVendorDeals() when loadVendorDeals != null:
return loadVendorDeals();case _:
  return null;

}
}

}

/// @nodoc


class LoadDeals implements DealsEvent {
  const LoadDeals();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadDeals);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DealsEvent.loadDeals()';
}


}




/// @nodoc


class AddDeal implements DealsEvent {
  const AddDeal({required this.deal, required this.imageFile});
  

 final  DealEntity deal;
 final  File? imageFile;

/// Create a copy of DealsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddDealCopyWith<AddDeal> get copyWith => _$AddDealCopyWithImpl<AddDeal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddDeal&&(identical(other.deal, deal) || other.deal == deal)&&(identical(other.imageFile, imageFile) || other.imageFile == imageFile));
}


@override
int get hashCode => Object.hash(runtimeType,deal,imageFile);

@override
String toString() {
  return 'DealsEvent.addDeal(deal: $deal, imageFile: $imageFile)';
}


}

/// @nodoc
abstract mixin class $AddDealCopyWith<$Res> implements $DealsEventCopyWith<$Res> {
  factory $AddDealCopyWith(AddDeal value, $Res Function(AddDeal) _then) = _$AddDealCopyWithImpl;
@useResult
$Res call({
 DealEntity deal, File? imageFile
});


$DealEntityCopyWith<$Res> get deal;

}
/// @nodoc
class _$AddDealCopyWithImpl<$Res>
    implements $AddDealCopyWith<$Res> {
  _$AddDealCopyWithImpl(this._self, this._then);

  final AddDeal _self;
  final $Res Function(AddDeal) _then;

/// Create a copy of DealsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deal = null,Object? imageFile = freezed,}) {
  return _then(AddDeal(
deal: null == deal ? _self.deal : deal // ignore: cast_nullable_to_non_nullable
as DealEntity,imageFile: freezed == imageFile ? _self.imageFile : imageFile // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}

/// Create a copy of DealsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DealEntityCopyWith<$Res> get deal {
  
  return $DealEntityCopyWith<$Res>(_self.deal, (value) {
    return _then(_self.copyWith(deal: value));
  });
}
}

/// @nodoc


class ClaimDeal implements DealsEvent {
  const ClaimDeal({required this.dealId, required this.quantity});
  

 final  String dealId;
 final  int quantity;

/// Create a copy of DealsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClaimDealCopyWith<ClaimDeal> get copyWith => _$ClaimDealCopyWithImpl<ClaimDeal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClaimDeal&&(identical(other.dealId, dealId) || other.dealId == dealId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,dealId,quantity);

@override
String toString() {
  return 'DealsEvent.claimDeal(dealId: $dealId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $ClaimDealCopyWith<$Res> implements $DealsEventCopyWith<$Res> {
  factory $ClaimDealCopyWith(ClaimDeal value, $Res Function(ClaimDeal) _then) = _$ClaimDealCopyWithImpl;
@useResult
$Res call({
 String dealId, int quantity
});




}
/// @nodoc
class _$ClaimDealCopyWithImpl<$Res>
    implements $ClaimDealCopyWith<$Res> {
  _$ClaimDealCopyWithImpl(this._self, this._then);

  final ClaimDeal _self;
  final $Res Function(ClaimDeal) _then;

/// Create a copy of DealsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dealId = null,Object? quantity = null,}) {
  return _then(ClaimDeal(
dealId: null == dealId ? _self.dealId : dealId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class LoadVendorDeals implements DealsEvent {
  const LoadVendorDeals();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadVendorDeals);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DealsEvent.loadVendorDeals()';
}


}




// dart format on
