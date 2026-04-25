// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VendorEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VendorEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VendorEvent()';
}


}

/// @nodoc
class $VendorEventCopyWith<$Res>  {
$VendorEventCopyWith(VendorEvent _, $Res Function(VendorEvent) __);
}


/// Adds pattern-matching-related methods to [VendorEvent].
extension VendorEventPatterns on VendorEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadDashboard value)?  loadDashboard,TResult Function( RefreshData value)?  refreshData,TResult Function( FulfillOrder value)?  fulfillOrder,TResult Function( UpdateShopStatus value)?  updateShopStatus,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadDashboard() when loadDashboard != null:
return loadDashboard(_that);case RefreshData() when refreshData != null:
return refreshData(_that);case FulfillOrder() when fulfillOrder != null:
return fulfillOrder(_that);case UpdateShopStatus() when updateShopStatus != null:
return updateShopStatus(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadDashboard value)  loadDashboard,required TResult Function( RefreshData value)  refreshData,required TResult Function( FulfillOrder value)  fulfillOrder,required TResult Function( UpdateShopStatus value)  updateShopStatus,}){
final _that = this;
switch (_that) {
case LoadDashboard():
return loadDashboard(_that);case RefreshData():
return refreshData(_that);case FulfillOrder():
return fulfillOrder(_that);case UpdateShopStatus():
return updateShopStatus(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadDashboard value)?  loadDashboard,TResult? Function( RefreshData value)?  refreshData,TResult? Function( FulfillOrder value)?  fulfillOrder,TResult? Function( UpdateShopStatus value)?  updateShopStatus,}){
final _that = this;
switch (_that) {
case LoadDashboard() when loadDashboard != null:
return loadDashboard(_that);case RefreshData() when refreshData != null:
return refreshData(_that);case FulfillOrder() when fulfillOrder != null:
return fulfillOrder(_that);case UpdateShopStatus() when updateShopStatus != null:
return updateShopStatus(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadDashboard,TResult Function()?  refreshData,TResult Function( String pickupCode)?  fulfillOrder,TResult Function( bool isOpen)?  updateShopStatus,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadDashboard() when loadDashboard != null:
return loadDashboard();case RefreshData() when refreshData != null:
return refreshData();case FulfillOrder() when fulfillOrder != null:
return fulfillOrder(_that.pickupCode);case UpdateShopStatus() when updateShopStatus != null:
return updateShopStatus(_that.isOpen);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadDashboard,required TResult Function()  refreshData,required TResult Function( String pickupCode)  fulfillOrder,required TResult Function( bool isOpen)  updateShopStatus,}) {final _that = this;
switch (_that) {
case LoadDashboard():
return loadDashboard();case RefreshData():
return refreshData();case FulfillOrder():
return fulfillOrder(_that.pickupCode);case UpdateShopStatus():
return updateShopStatus(_that.isOpen);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadDashboard,TResult? Function()?  refreshData,TResult? Function( String pickupCode)?  fulfillOrder,TResult? Function( bool isOpen)?  updateShopStatus,}) {final _that = this;
switch (_that) {
case LoadDashboard() when loadDashboard != null:
return loadDashboard();case RefreshData() when refreshData != null:
return refreshData();case FulfillOrder() when fulfillOrder != null:
return fulfillOrder(_that.pickupCode);case UpdateShopStatus() when updateShopStatus != null:
return updateShopStatus(_that.isOpen);case _:
  return null;

}
}

}

/// @nodoc


class LoadDashboard implements VendorEvent {
  const LoadDashboard();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadDashboard);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VendorEvent.loadDashboard()';
}


}




/// @nodoc


class RefreshData implements VendorEvent {
  const RefreshData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VendorEvent.refreshData()';
}


}




/// @nodoc


class FulfillOrder implements VendorEvent {
  const FulfillOrder(this.pickupCode);
  

 final  String pickupCode;

/// Create a copy of VendorEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FulfillOrderCopyWith<FulfillOrder> get copyWith => _$FulfillOrderCopyWithImpl<FulfillOrder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FulfillOrder&&(identical(other.pickupCode, pickupCode) || other.pickupCode == pickupCode));
}


@override
int get hashCode => Object.hash(runtimeType,pickupCode);

@override
String toString() {
  return 'VendorEvent.fulfillOrder(pickupCode: $pickupCode)';
}


}

/// @nodoc
abstract mixin class $FulfillOrderCopyWith<$Res> implements $VendorEventCopyWith<$Res> {
  factory $FulfillOrderCopyWith(FulfillOrder value, $Res Function(FulfillOrder) _then) = _$FulfillOrderCopyWithImpl;
@useResult
$Res call({
 String pickupCode
});




}
/// @nodoc
class _$FulfillOrderCopyWithImpl<$Res>
    implements $FulfillOrderCopyWith<$Res> {
  _$FulfillOrderCopyWithImpl(this._self, this._then);

  final FulfillOrder _self;
  final $Res Function(FulfillOrder) _then;

/// Create a copy of VendorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pickupCode = null,}) {
  return _then(FulfillOrder(
null == pickupCode ? _self.pickupCode : pickupCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateShopStatus implements VendorEvent {
  const UpdateShopStatus(this.isOpen);
  

 final  bool isOpen;

/// Create a copy of VendorEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateShopStatusCopyWith<UpdateShopStatus> get copyWith => _$UpdateShopStatusCopyWithImpl<UpdateShopStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateShopStatus&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen));
}


@override
int get hashCode => Object.hash(runtimeType,isOpen);

@override
String toString() {
  return 'VendorEvent.updateShopStatus(isOpen: $isOpen)';
}


}

/// @nodoc
abstract mixin class $UpdateShopStatusCopyWith<$Res> implements $VendorEventCopyWith<$Res> {
  factory $UpdateShopStatusCopyWith(UpdateShopStatus value, $Res Function(UpdateShopStatus) _then) = _$UpdateShopStatusCopyWithImpl;
@useResult
$Res call({
 bool isOpen
});




}
/// @nodoc
class _$UpdateShopStatusCopyWithImpl<$Res>
    implements $UpdateShopStatusCopyWith<$Res> {
  _$UpdateShopStatusCopyWithImpl(this._self, this._then);

  final UpdateShopStatus _self;
  final $Res Function(UpdateShopStatus) _then;

/// Create a copy of VendorEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isOpen = null,}) {
  return _then(UpdateShopStatus(
null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$VendorState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VendorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VendorState()';
}


}

/// @nodoc
class $VendorStateCopyWith<$Res>  {
$VendorStateCopyWith(VendorState _, $Res Function(VendorState) __);
}


/// Adds pattern-matching-related methods to [VendorState].
extension VendorStatePatterns on VendorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( VendorStats stats,  List<OrderEntity> orders)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.stats,_that.orders);case Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( VendorStats stats,  List<OrderEntity> orders)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.stats,_that.orders);case Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( VendorStats stats,  List<OrderEntity> orders)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.stats,_that.orders);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements VendorState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VendorState.initial()';
}


}




/// @nodoc


class Loading implements VendorState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VendorState.loading()';
}


}




/// @nodoc


class Loaded implements VendorState {
  const Loaded({required this.stats, required final  List<OrderEntity> orders}): _orders = orders;
  

 final  VendorStats stats;
 final  List<OrderEntity> _orders;
 List<OrderEntity> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}


/// Create a copy of VendorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other._orders, _orders));
}


@override
int get hashCode => Object.hash(runtimeType,stats,const DeepCollectionEquality().hash(_orders));

@override
String toString() {
  return 'VendorState.loaded(stats: $stats, orders: $orders)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $VendorStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 VendorStats stats, List<OrderEntity> orders
});


$VendorStatsCopyWith<$Res> get stats;

}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of VendorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? stats = null,Object? orders = null,}) {
  return _then(Loaded(
stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as VendorStats,orders: null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderEntity>,
  ));
}

/// Create a copy of VendorState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VendorStatsCopyWith<$Res> get stats {
  
  return $VendorStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}

/// @nodoc


class Error implements VendorState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of VendorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VendorState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $VendorStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of VendorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
