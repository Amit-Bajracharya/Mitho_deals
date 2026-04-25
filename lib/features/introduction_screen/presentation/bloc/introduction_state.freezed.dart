// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'introduction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IntroductionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IntroductionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IntroductionState()';
}


}

/// @nodoc
class $IntroductionStateCopyWith<$Res>  {
$IntroductionStateCopyWith(IntroductionState _, $Res Function(IntroductionState) __);
}


/// Adds pattern-matching-related methods to [IntroductionState].
extension IntroductionStatePatterns on IntroductionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( IntroductionStateInitial value)?  initial,TResult Function( IntroductionStateLoading value)?  loading,TResult Function( IntroductionStateLoaded value)?  loaded,TResult Function( IntroductionStateCompleted value)?  completed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case IntroductionStateInitial() when initial != null:
return initial(_that);case IntroductionStateLoading() when loading != null:
return loading(_that);case IntroductionStateLoaded() when loaded != null:
return loaded(_that);case IntroductionStateCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( IntroductionStateInitial value)  initial,required TResult Function( IntroductionStateLoading value)  loading,required TResult Function( IntroductionStateLoaded value)  loaded,required TResult Function( IntroductionStateCompleted value)  completed,}){
final _that = this;
switch (_that) {
case IntroductionStateInitial():
return initial(_that);case IntroductionStateLoading():
return loading(_that);case IntroductionStateLoaded():
return loaded(_that);case IntroductionStateCompleted():
return completed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( IntroductionStateInitial value)?  initial,TResult? Function( IntroductionStateLoading value)?  loading,TResult? Function( IntroductionStateLoaded value)?  loaded,TResult? Function( IntroductionStateCompleted value)?  completed,}){
final _that = this;
switch (_that) {
case IntroductionStateInitial() when initial != null:
return initial(_that);case IntroductionStateLoading() when loading != null:
return loading(_that);case IntroductionStateLoaded() when loaded != null:
return loaded(_that);case IntroductionStateCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int currentPage,  bool isLastPage,  bool isFirstPage,  List<IntroductionPageEntity> pages)?  initial,TResult Function( int currentPage,  bool isLastPage,  bool isFirstPage,  List<IntroductionPageEntity> pages)?  loading,TResult Function( List<IntroductionPageEntity> pages,  int currentPage,  bool isLastPage,  bool isFirstPage)?  loaded,TResult Function()?  completed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case IntroductionStateInitial() when initial != null:
return initial(_that.currentPage,_that.isLastPage,_that.isFirstPage,_that.pages);case IntroductionStateLoading() when loading != null:
return loading(_that.currentPage,_that.isLastPage,_that.isFirstPage,_that.pages);case IntroductionStateLoaded() when loaded != null:
return loaded(_that.pages,_that.currentPage,_that.isLastPage,_that.isFirstPage);case IntroductionStateCompleted() when completed != null:
return completed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int currentPage,  bool isLastPage,  bool isFirstPage,  List<IntroductionPageEntity> pages)  initial,required TResult Function( int currentPage,  bool isLastPage,  bool isFirstPage,  List<IntroductionPageEntity> pages)  loading,required TResult Function( List<IntroductionPageEntity> pages,  int currentPage,  bool isLastPage,  bool isFirstPage)  loaded,required TResult Function()  completed,}) {final _that = this;
switch (_that) {
case IntroductionStateInitial():
return initial(_that.currentPage,_that.isLastPage,_that.isFirstPage,_that.pages);case IntroductionStateLoading():
return loading(_that.currentPage,_that.isLastPage,_that.isFirstPage,_that.pages);case IntroductionStateLoaded():
return loaded(_that.pages,_that.currentPage,_that.isLastPage,_that.isFirstPage);case IntroductionStateCompleted():
return completed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int currentPage,  bool isLastPage,  bool isFirstPage,  List<IntroductionPageEntity> pages)?  initial,TResult? Function( int currentPage,  bool isLastPage,  bool isFirstPage,  List<IntroductionPageEntity> pages)?  loading,TResult? Function( List<IntroductionPageEntity> pages,  int currentPage,  bool isLastPage,  bool isFirstPage)?  loaded,TResult? Function()?  completed,}) {final _that = this;
switch (_that) {
case IntroductionStateInitial() when initial != null:
return initial(_that.currentPage,_that.isLastPage,_that.isFirstPage,_that.pages);case IntroductionStateLoading() when loading != null:
return loading(_that.currentPage,_that.isLastPage,_that.isFirstPage,_that.pages);case IntroductionStateLoaded() when loaded != null:
return loaded(_that.pages,_that.currentPage,_that.isLastPage,_that.isFirstPage);case IntroductionStateCompleted() when completed != null:
return completed();case _:
  return null;

}
}

}

/// @nodoc


class IntroductionStateInitial implements IntroductionState {
  const IntroductionStateInitial({this.currentPage = 0, this.isLastPage = false, this.isFirstPage = true, final  List<IntroductionPageEntity> pages = const []}): _pages = pages;
  

@JsonKey() final  int currentPage;
@JsonKey() final  bool isLastPage;
@JsonKey() final  bool isFirstPage;
 final  List<IntroductionPageEntity> _pages;
@JsonKey() List<IntroductionPageEntity> get pages {
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pages);
}


/// Create a copy of IntroductionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IntroductionStateInitialCopyWith<IntroductionStateInitial> get copyWith => _$IntroductionStateInitialCopyWithImpl<IntroductionStateInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IntroductionStateInitial&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.isLastPage, isLastPage) || other.isLastPage == isLastPage)&&(identical(other.isFirstPage, isFirstPage) || other.isFirstPage == isFirstPage)&&const DeepCollectionEquality().equals(other._pages, _pages));
}


@override
int get hashCode => Object.hash(runtimeType,currentPage,isLastPage,isFirstPage,const DeepCollectionEquality().hash(_pages));

@override
String toString() {
  return 'IntroductionState.initial(currentPage: $currentPage, isLastPage: $isLastPage, isFirstPage: $isFirstPage, pages: $pages)';
}


}

/// @nodoc
abstract mixin class $IntroductionStateInitialCopyWith<$Res> implements $IntroductionStateCopyWith<$Res> {
  factory $IntroductionStateInitialCopyWith(IntroductionStateInitial value, $Res Function(IntroductionStateInitial) _then) = _$IntroductionStateInitialCopyWithImpl;
@useResult
$Res call({
 int currentPage, bool isLastPage, bool isFirstPage, List<IntroductionPageEntity> pages
});




}
/// @nodoc
class _$IntroductionStateInitialCopyWithImpl<$Res>
    implements $IntroductionStateInitialCopyWith<$Res> {
  _$IntroductionStateInitialCopyWithImpl(this._self, this._then);

  final IntroductionStateInitial _self;
  final $Res Function(IntroductionStateInitial) _then;

/// Create a copy of IntroductionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? isLastPage = null,Object? isFirstPage = null,Object? pages = null,}) {
  return _then(IntroductionStateInitial(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,isLastPage: null == isLastPage ? _self.isLastPage : isLastPage // ignore: cast_nullable_to_non_nullable
as bool,isFirstPage: null == isFirstPage ? _self.isFirstPage : isFirstPage // ignore: cast_nullable_to_non_nullable
as bool,pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<IntroductionPageEntity>,
  ));
}


}

/// @nodoc


class IntroductionStateLoading implements IntroductionState {
  const IntroductionStateLoading({this.currentPage = 0, this.isLastPage = false, this.isFirstPage = true, final  List<IntroductionPageEntity> pages = const []}): _pages = pages;
  

@JsonKey() final  int currentPage;
@JsonKey() final  bool isLastPage;
@JsonKey() final  bool isFirstPage;
 final  List<IntroductionPageEntity> _pages;
@JsonKey() List<IntroductionPageEntity> get pages {
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pages);
}


/// Create a copy of IntroductionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IntroductionStateLoadingCopyWith<IntroductionStateLoading> get copyWith => _$IntroductionStateLoadingCopyWithImpl<IntroductionStateLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IntroductionStateLoading&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.isLastPage, isLastPage) || other.isLastPage == isLastPage)&&(identical(other.isFirstPage, isFirstPage) || other.isFirstPage == isFirstPage)&&const DeepCollectionEquality().equals(other._pages, _pages));
}


@override
int get hashCode => Object.hash(runtimeType,currentPage,isLastPage,isFirstPage,const DeepCollectionEquality().hash(_pages));

@override
String toString() {
  return 'IntroductionState.loading(currentPage: $currentPage, isLastPage: $isLastPage, isFirstPage: $isFirstPage, pages: $pages)';
}


}

/// @nodoc
abstract mixin class $IntroductionStateLoadingCopyWith<$Res> implements $IntroductionStateCopyWith<$Res> {
  factory $IntroductionStateLoadingCopyWith(IntroductionStateLoading value, $Res Function(IntroductionStateLoading) _then) = _$IntroductionStateLoadingCopyWithImpl;
@useResult
$Res call({
 int currentPage, bool isLastPage, bool isFirstPage, List<IntroductionPageEntity> pages
});




}
/// @nodoc
class _$IntroductionStateLoadingCopyWithImpl<$Res>
    implements $IntroductionStateLoadingCopyWith<$Res> {
  _$IntroductionStateLoadingCopyWithImpl(this._self, this._then);

  final IntroductionStateLoading _self;
  final $Res Function(IntroductionStateLoading) _then;

/// Create a copy of IntroductionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? isLastPage = null,Object? isFirstPage = null,Object? pages = null,}) {
  return _then(IntroductionStateLoading(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,isLastPage: null == isLastPage ? _self.isLastPage : isLastPage // ignore: cast_nullable_to_non_nullable
as bool,isFirstPage: null == isFirstPage ? _self.isFirstPage : isFirstPage // ignore: cast_nullable_to_non_nullable
as bool,pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<IntroductionPageEntity>,
  ));
}


}

/// @nodoc


class IntroductionStateLoaded implements IntroductionState {
  const IntroductionStateLoaded({required final  List<IntroductionPageEntity> pages, this.currentPage = 0, this.isLastPage = false, this.isFirstPage = true}): _pages = pages;
  

 final  List<IntroductionPageEntity> _pages;
 List<IntroductionPageEntity> get pages {
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pages);
}

@JsonKey() final  int currentPage;
@JsonKey() final  bool isLastPage;
@JsonKey() final  bool isFirstPage;

/// Create a copy of IntroductionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IntroductionStateLoadedCopyWith<IntroductionStateLoaded> get copyWith => _$IntroductionStateLoadedCopyWithImpl<IntroductionStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IntroductionStateLoaded&&const DeepCollectionEquality().equals(other._pages, _pages)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.isLastPage, isLastPage) || other.isLastPage == isLastPage)&&(identical(other.isFirstPage, isFirstPage) || other.isFirstPage == isFirstPage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pages),currentPage,isLastPage,isFirstPage);

@override
String toString() {
  return 'IntroductionState.loaded(pages: $pages, currentPage: $currentPage, isLastPage: $isLastPage, isFirstPage: $isFirstPage)';
}


}

/// @nodoc
abstract mixin class $IntroductionStateLoadedCopyWith<$Res> implements $IntroductionStateCopyWith<$Res> {
  factory $IntroductionStateLoadedCopyWith(IntroductionStateLoaded value, $Res Function(IntroductionStateLoaded) _then) = _$IntroductionStateLoadedCopyWithImpl;
@useResult
$Res call({
 List<IntroductionPageEntity> pages, int currentPage, bool isLastPage, bool isFirstPage
});




}
/// @nodoc
class _$IntroductionStateLoadedCopyWithImpl<$Res>
    implements $IntroductionStateLoadedCopyWith<$Res> {
  _$IntroductionStateLoadedCopyWithImpl(this._self, this._then);

  final IntroductionStateLoaded _self;
  final $Res Function(IntroductionStateLoaded) _then;

/// Create a copy of IntroductionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pages = null,Object? currentPage = null,Object? isLastPage = null,Object? isFirstPage = null,}) {
  return _then(IntroductionStateLoaded(
pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<IntroductionPageEntity>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,isLastPage: null == isLastPage ? _self.isLastPage : isLastPage // ignore: cast_nullable_to_non_nullable
as bool,isFirstPage: null == isFirstPage ? _self.isFirstPage : isFirstPage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class IntroductionStateCompleted implements IntroductionState {
  const IntroductionStateCompleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IntroductionStateCompleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IntroductionState.completed()';
}


}




// dart format on
