// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deals_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DealsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DealsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DealsState()';
}


}

/// @nodoc
class $DealsStateCopyWith<$Res>  {
$DealsStateCopyWith(DealsState _, $Res Function(DealsState) __);
}


/// Adds pattern-matching-related methods to [DealsState].
extension DealsStatePatterns on DealsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,TResult Function( _AddingDeal value)?  addingDeal,TResult Function( _AddDealSuccess value)?  addDealSuccess,TResult Function( _AddDealError value)?  addDealError,TResult Function( _ClaimedSuccess value)?  claimedSuccess,TResult Function( _ClaimedError value)?  claimedError,TResult Function( _VendorDealsLoading value)?  vendorDealsLoading,TResult Function( _VendorDealsLoaded value)?  vendorDealsLoaded,TResult Function( _VendorDealsError value)?  vendorDealsError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _AddingDeal() when addingDeal != null:
return addingDeal(_that);case _AddDealSuccess() when addDealSuccess != null:
return addDealSuccess(_that);case _AddDealError() when addDealError != null:
return addDealError(_that);case _ClaimedSuccess() when claimedSuccess != null:
return claimedSuccess(_that);case _ClaimedError() when claimedError != null:
return claimedError(_that);case _VendorDealsLoading() when vendorDealsLoading != null:
return vendorDealsLoading(_that);case _VendorDealsLoaded() when vendorDealsLoaded != null:
return vendorDealsLoaded(_that);case _VendorDealsError() when vendorDealsError != null:
return vendorDealsError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,required TResult Function( _AddingDeal value)  addingDeal,required TResult Function( _AddDealSuccess value)  addDealSuccess,required TResult Function( _AddDealError value)  addDealError,required TResult Function( _ClaimedSuccess value)  claimedSuccess,required TResult Function( _ClaimedError value)  claimedError,required TResult Function( _VendorDealsLoading value)  vendorDealsLoading,required TResult Function( _VendorDealsLoaded value)  vendorDealsLoaded,required TResult Function( _VendorDealsError value)  vendorDealsError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _AddingDeal():
return addingDeal(_that);case _AddDealSuccess():
return addDealSuccess(_that);case _AddDealError():
return addDealError(_that);case _ClaimedSuccess():
return claimedSuccess(_that);case _ClaimedError():
return claimedError(_that);case _VendorDealsLoading():
return vendorDealsLoading(_that);case _VendorDealsLoaded():
return vendorDealsLoaded(_that);case _VendorDealsError():
return vendorDealsError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,TResult? Function( _AddingDeal value)?  addingDeal,TResult? Function( _AddDealSuccess value)?  addDealSuccess,TResult? Function( _AddDealError value)?  addDealError,TResult? Function( _ClaimedSuccess value)?  claimedSuccess,TResult? Function( _ClaimedError value)?  claimedError,TResult? Function( _VendorDealsLoading value)?  vendorDealsLoading,TResult? Function( _VendorDealsLoaded value)?  vendorDealsLoaded,TResult? Function( _VendorDealsError value)?  vendorDealsError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _AddingDeal() when addingDeal != null:
return addingDeal(_that);case _AddDealSuccess() when addDealSuccess != null:
return addDealSuccess(_that);case _AddDealError() when addDealError != null:
return addDealError(_that);case _ClaimedSuccess() when claimedSuccess != null:
return claimedSuccess(_that);case _ClaimedError() when claimedError != null:
return claimedError(_that);case _VendorDealsLoading() when vendorDealsLoading != null:
return vendorDealsLoading(_that);case _VendorDealsLoaded() when vendorDealsLoaded != null:
return vendorDealsLoaded(_that);case _VendorDealsError() when vendorDealsError != null:
return vendorDealsError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<DealEntity> deals)?  loaded,TResult Function( String message)?  error,TResult Function()?  addingDeal,TResult Function()?  addDealSuccess,TResult Function( String message)?  addDealError,TResult Function()?  claimedSuccess,TResult Function( String message)?  claimedError,TResult Function()?  vendorDealsLoading,TResult Function( List<DealEntity> deals)?  vendorDealsLoaded,TResult Function( String message)?  vendorDealsError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.deals);case _Error() when error != null:
return error(_that.message);case _AddingDeal() when addingDeal != null:
return addingDeal();case _AddDealSuccess() when addDealSuccess != null:
return addDealSuccess();case _AddDealError() when addDealError != null:
return addDealError(_that.message);case _ClaimedSuccess() when claimedSuccess != null:
return claimedSuccess();case _ClaimedError() when claimedError != null:
return claimedError(_that.message);case _VendorDealsLoading() when vendorDealsLoading != null:
return vendorDealsLoading();case _VendorDealsLoaded() when vendorDealsLoaded != null:
return vendorDealsLoaded(_that.deals);case _VendorDealsError() when vendorDealsError != null:
return vendorDealsError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<DealEntity> deals)  loaded,required TResult Function( String message)  error,required TResult Function()  addingDeal,required TResult Function()  addDealSuccess,required TResult Function( String message)  addDealError,required TResult Function()  claimedSuccess,required TResult Function( String message)  claimedError,required TResult Function()  vendorDealsLoading,required TResult Function( List<DealEntity> deals)  vendorDealsLoaded,required TResult Function( String message)  vendorDealsError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.deals);case _Error():
return error(_that.message);case _AddingDeal():
return addingDeal();case _AddDealSuccess():
return addDealSuccess();case _AddDealError():
return addDealError(_that.message);case _ClaimedSuccess():
return claimedSuccess();case _ClaimedError():
return claimedError(_that.message);case _VendorDealsLoading():
return vendorDealsLoading();case _VendorDealsLoaded():
return vendorDealsLoaded(_that.deals);case _VendorDealsError():
return vendorDealsError(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<DealEntity> deals)?  loaded,TResult? Function( String message)?  error,TResult? Function()?  addingDeal,TResult? Function()?  addDealSuccess,TResult? Function( String message)?  addDealError,TResult? Function()?  claimedSuccess,TResult? Function( String message)?  claimedError,TResult? Function()?  vendorDealsLoading,TResult? Function( List<DealEntity> deals)?  vendorDealsLoaded,TResult? Function( String message)?  vendorDealsError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.deals);case _Error() when error != null:
return error(_that.message);case _AddingDeal() when addingDeal != null:
return addingDeal();case _AddDealSuccess() when addDealSuccess != null:
return addDealSuccess();case _AddDealError() when addDealError != null:
return addDealError(_that.message);case _ClaimedSuccess() when claimedSuccess != null:
return claimedSuccess();case _ClaimedError() when claimedError != null:
return claimedError(_that.message);case _VendorDealsLoading() when vendorDealsLoading != null:
return vendorDealsLoading();case _VendorDealsLoaded() when vendorDealsLoaded != null:
return vendorDealsLoaded(_that.deals);case _VendorDealsError() when vendorDealsError != null:
return vendorDealsError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements DealsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DealsState.initial()';
}


}




/// @nodoc


class _Loading implements DealsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DealsState.loading()';
}


}




/// @nodoc


class _Loaded implements DealsState {
  const _Loaded(final  List<DealEntity> deals): _deals = deals;
  

 final  List<DealEntity> _deals;
 List<DealEntity> get deals {
  if (_deals is EqualUnmodifiableListView) return _deals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deals);
}


/// Create a copy of DealsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._deals, _deals));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_deals));

@override
String toString() {
  return 'DealsState.loaded(deals: $deals)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $DealsStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<DealEntity> deals
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of DealsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deals = null,}) {
  return _then(_Loaded(
null == deals ? _self._deals : deals // ignore: cast_nullable_to_non_nullable
as List<DealEntity>,
  ));
}


}

/// @nodoc


class _Error implements DealsState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of DealsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DealsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $DealsStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of DealsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AddingDeal implements DealsState {
  const _AddingDeal();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddingDeal);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DealsState.addingDeal()';
}


}




/// @nodoc


class _AddDealSuccess implements DealsState {
  const _AddDealSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddDealSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DealsState.addDealSuccess()';
}


}




/// @nodoc


class _AddDealError implements DealsState {
  const _AddDealError(this.message);
  

 final  String message;

/// Create a copy of DealsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddDealErrorCopyWith<_AddDealError> get copyWith => __$AddDealErrorCopyWithImpl<_AddDealError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddDealError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DealsState.addDealError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$AddDealErrorCopyWith<$Res> implements $DealsStateCopyWith<$Res> {
  factory _$AddDealErrorCopyWith(_AddDealError value, $Res Function(_AddDealError) _then) = __$AddDealErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$AddDealErrorCopyWithImpl<$Res>
    implements _$AddDealErrorCopyWith<$Res> {
  __$AddDealErrorCopyWithImpl(this._self, this._then);

  final _AddDealError _self;
  final $Res Function(_AddDealError) _then;

/// Create a copy of DealsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_AddDealError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ClaimedSuccess implements DealsState {
  const _ClaimedSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClaimedSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DealsState.claimedSuccess()';
}


}




/// @nodoc


class _ClaimedError implements DealsState {
  const _ClaimedError(this.message);
  

 final  String message;

/// Create a copy of DealsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClaimedErrorCopyWith<_ClaimedError> get copyWith => __$ClaimedErrorCopyWithImpl<_ClaimedError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClaimedError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DealsState.claimedError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ClaimedErrorCopyWith<$Res> implements $DealsStateCopyWith<$Res> {
  factory _$ClaimedErrorCopyWith(_ClaimedError value, $Res Function(_ClaimedError) _then) = __$ClaimedErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ClaimedErrorCopyWithImpl<$Res>
    implements _$ClaimedErrorCopyWith<$Res> {
  __$ClaimedErrorCopyWithImpl(this._self, this._then);

  final _ClaimedError _self;
  final $Res Function(_ClaimedError) _then;

/// Create a copy of DealsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_ClaimedError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _VendorDealsLoading implements DealsState {
  const _VendorDealsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VendorDealsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DealsState.vendorDealsLoading()';
}


}




/// @nodoc


class _VendorDealsLoaded implements DealsState {
  const _VendorDealsLoaded(final  List<DealEntity> deals): _deals = deals;
  

 final  List<DealEntity> _deals;
 List<DealEntity> get deals {
  if (_deals is EqualUnmodifiableListView) return _deals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deals);
}


/// Create a copy of DealsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VendorDealsLoadedCopyWith<_VendorDealsLoaded> get copyWith => __$VendorDealsLoadedCopyWithImpl<_VendorDealsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VendorDealsLoaded&&const DeepCollectionEquality().equals(other._deals, _deals));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_deals));

@override
String toString() {
  return 'DealsState.vendorDealsLoaded(deals: $deals)';
}


}

/// @nodoc
abstract mixin class _$VendorDealsLoadedCopyWith<$Res> implements $DealsStateCopyWith<$Res> {
  factory _$VendorDealsLoadedCopyWith(_VendorDealsLoaded value, $Res Function(_VendorDealsLoaded) _then) = __$VendorDealsLoadedCopyWithImpl;
@useResult
$Res call({
 List<DealEntity> deals
});




}
/// @nodoc
class __$VendorDealsLoadedCopyWithImpl<$Res>
    implements _$VendorDealsLoadedCopyWith<$Res> {
  __$VendorDealsLoadedCopyWithImpl(this._self, this._then);

  final _VendorDealsLoaded _self;
  final $Res Function(_VendorDealsLoaded) _then;

/// Create a copy of DealsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deals = null,}) {
  return _then(_VendorDealsLoaded(
null == deals ? _self._deals : deals // ignore: cast_nullable_to_non_nullable
as List<DealEntity>,
  ));
}


}

/// @nodoc


class _VendorDealsError implements DealsState {
  const _VendorDealsError(this.message);
  

 final  String message;

/// Create a copy of DealsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VendorDealsErrorCopyWith<_VendorDealsError> get copyWith => __$VendorDealsErrorCopyWithImpl<_VendorDealsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VendorDealsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DealsState.vendorDealsError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$VendorDealsErrorCopyWith<$Res> implements $DealsStateCopyWith<$Res> {
  factory _$VendorDealsErrorCopyWith(_VendorDealsError value, $Res Function(_VendorDealsError) _then) = __$VendorDealsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$VendorDealsErrorCopyWithImpl<$Res>
    implements _$VendorDealsErrorCopyWith<$Res> {
  __$VendorDealsErrorCopyWithImpl(this._self, this._then);

  final _VendorDealsError _self;
  final $Res Function(_VendorDealsError) _then;

/// Create a copy of DealsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_VendorDealsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
