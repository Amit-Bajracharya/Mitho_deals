// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'introduction_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IntroductionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IntroductionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IntroductionEvent()';
}


}

/// @nodoc
class $IntroductionEventCopyWith<$Res>  {
$IntroductionEventCopyWith(IntroductionEvent _, $Res Function(IntroductionEvent) __);
}


/// Adds pattern-matching-related methods to [IntroductionEvent].
extension IntroductionEventPatterns on IntroductionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadIntroductionPagesEvent value)?  loadPages,TResult Function( NextPageEvent value)?  nextPage,TResult Function( PreviousPageEvent value)?  previousPage,TResult Function( PageChangedEvent value)?  pageChanged,TResult Function( SkipIntroductionEvent value)?  skip,TResult Function( CompleteIntroductionEvent value)?  complete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadIntroductionPagesEvent() when loadPages != null:
return loadPages(_that);case NextPageEvent() when nextPage != null:
return nextPage(_that);case PreviousPageEvent() when previousPage != null:
return previousPage(_that);case PageChangedEvent() when pageChanged != null:
return pageChanged(_that);case SkipIntroductionEvent() when skip != null:
return skip(_that);case CompleteIntroductionEvent() when complete != null:
return complete(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadIntroductionPagesEvent value)  loadPages,required TResult Function( NextPageEvent value)  nextPage,required TResult Function( PreviousPageEvent value)  previousPage,required TResult Function( PageChangedEvent value)  pageChanged,required TResult Function( SkipIntroductionEvent value)  skip,required TResult Function( CompleteIntroductionEvent value)  complete,}){
final _that = this;
switch (_that) {
case LoadIntroductionPagesEvent():
return loadPages(_that);case NextPageEvent():
return nextPage(_that);case PreviousPageEvent():
return previousPage(_that);case PageChangedEvent():
return pageChanged(_that);case SkipIntroductionEvent():
return skip(_that);case CompleteIntroductionEvent():
return complete(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadIntroductionPagesEvent value)?  loadPages,TResult? Function( NextPageEvent value)?  nextPage,TResult? Function( PreviousPageEvent value)?  previousPage,TResult? Function( PageChangedEvent value)?  pageChanged,TResult? Function( SkipIntroductionEvent value)?  skip,TResult? Function( CompleteIntroductionEvent value)?  complete,}){
final _that = this;
switch (_that) {
case LoadIntroductionPagesEvent() when loadPages != null:
return loadPages(_that);case NextPageEvent() when nextPage != null:
return nextPage(_that);case PreviousPageEvent() when previousPage != null:
return previousPage(_that);case PageChangedEvent() when pageChanged != null:
return pageChanged(_that);case SkipIntroductionEvent() when skip != null:
return skip(_that);case CompleteIntroductionEvent() when complete != null:
return complete(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadPages,TResult Function()?  nextPage,TResult Function()?  previousPage,TResult Function( int page)?  pageChanged,TResult Function()?  skip,TResult Function()?  complete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadIntroductionPagesEvent() when loadPages != null:
return loadPages();case NextPageEvent() when nextPage != null:
return nextPage();case PreviousPageEvent() when previousPage != null:
return previousPage();case PageChangedEvent() when pageChanged != null:
return pageChanged(_that.page);case SkipIntroductionEvent() when skip != null:
return skip();case CompleteIntroductionEvent() when complete != null:
return complete();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadPages,required TResult Function()  nextPage,required TResult Function()  previousPage,required TResult Function( int page)  pageChanged,required TResult Function()  skip,required TResult Function()  complete,}) {final _that = this;
switch (_that) {
case LoadIntroductionPagesEvent():
return loadPages();case NextPageEvent():
return nextPage();case PreviousPageEvent():
return previousPage();case PageChangedEvent():
return pageChanged(_that.page);case SkipIntroductionEvent():
return skip();case CompleteIntroductionEvent():
return complete();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadPages,TResult? Function()?  nextPage,TResult? Function()?  previousPage,TResult? Function( int page)?  pageChanged,TResult? Function()?  skip,TResult? Function()?  complete,}) {final _that = this;
switch (_that) {
case LoadIntroductionPagesEvent() when loadPages != null:
return loadPages();case NextPageEvent() when nextPage != null:
return nextPage();case PreviousPageEvent() when previousPage != null:
return previousPage();case PageChangedEvent() when pageChanged != null:
return pageChanged(_that.page);case SkipIntroductionEvent() when skip != null:
return skip();case CompleteIntroductionEvent() when complete != null:
return complete();case _:
  return null;

}
}

}

/// @nodoc


class LoadIntroductionPagesEvent implements IntroductionEvent {
  const LoadIntroductionPagesEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadIntroductionPagesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IntroductionEvent.loadPages()';
}


}




/// @nodoc


class NextPageEvent implements IntroductionEvent {
  const NextPageEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NextPageEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IntroductionEvent.nextPage()';
}


}




/// @nodoc


class PreviousPageEvent implements IntroductionEvent {
  const PreviousPageEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreviousPageEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IntroductionEvent.previousPage()';
}


}




/// @nodoc


class PageChangedEvent implements IntroductionEvent {
  const PageChangedEvent(this.page);
  

 final  int page;

/// Create a copy of IntroductionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageChangedEventCopyWith<PageChangedEvent> get copyWith => _$PageChangedEventCopyWithImpl<PageChangedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageChangedEvent&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'IntroductionEvent.pageChanged(page: $page)';
}


}

/// @nodoc
abstract mixin class $PageChangedEventCopyWith<$Res> implements $IntroductionEventCopyWith<$Res> {
  factory $PageChangedEventCopyWith(PageChangedEvent value, $Res Function(PageChangedEvent) _then) = _$PageChangedEventCopyWithImpl;
@useResult
$Res call({
 int page
});




}
/// @nodoc
class _$PageChangedEventCopyWithImpl<$Res>
    implements $PageChangedEventCopyWith<$Res> {
  _$PageChangedEventCopyWithImpl(this._self, this._then);

  final PageChangedEvent _self;
  final $Res Function(PageChangedEvent) _then;

/// Create a copy of IntroductionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(PageChangedEvent(
null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class SkipIntroductionEvent implements IntroductionEvent {
  const SkipIntroductionEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SkipIntroductionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IntroductionEvent.skip()';
}


}




/// @nodoc


class CompleteIntroductionEvent implements IntroductionEvent {
  const CompleteIntroductionEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteIntroductionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'IntroductionEvent.complete()';
}


}




// dart format on
