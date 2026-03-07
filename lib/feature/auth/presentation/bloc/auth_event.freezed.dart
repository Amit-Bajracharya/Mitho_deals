// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginRequested value)?  loginRequested,TResult Function( RegisterRequested value)?  registerRequested,TResult Function( PhoneVerificationRequested value)?  phoneVerificationRequested,TResult Function( PhoneCodeVerified value)?  phoneCodeVerified,TResult Function( LogoutRequested value)?  logoutRequested,TResult Function( AuthStateChecked value)?  authStateChecked,TResult Function( AuthError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginRequested() when loginRequested != null:
return loginRequested(_that);case RegisterRequested() when registerRequested != null:
return registerRequested(_that);case PhoneVerificationRequested() when phoneVerificationRequested != null:
return phoneVerificationRequested(_that);case PhoneCodeVerified() when phoneCodeVerified != null:
return phoneCodeVerified(_that);case LogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case AuthStateChecked() when authStateChecked != null:
return authStateChecked(_that);case AuthError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginRequested value)  loginRequested,required TResult Function( RegisterRequested value)  registerRequested,required TResult Function( PhoneVerificationRequested value)  phoneVerificationRequested,required TResult Function( PhoneCodeVerified value)  phoneCodeVerified,required TResult Function( LogoutRequested value)  logoutRequested,required TResult Function( AuthStateChecked value)  authStateChecked,required TResult Function( AuthError value)  error,}){
final _that = this;
switch (_that) {
case LoginRequested():
return loginRequested(_that);case RegisterRequested():
return registerRequested(_that);case PhoneVerificationRequested():
return phoneVerificationRequested(_that);case PhoneCodeVerified():
return phoneCodeVerified(_that);case LogoutRequested():
return logoutRequested(_that);case AuthStateChecked():
return authStateChecked(_that);case AuthError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginRequested value)?  loginRequested,TResult? Function( RegisterRequested value)?  registerRequested,TResult? Function( PhoneVerificationRequested value)?  phoneVerificationRequested,TResult? Function( PhoneCodeVerified value)?  phoneCodeVerified,TResult? Function( LogoutRequested value)?  logoutRequested,TResult? Function( AuthStateChecked value)?  authStateChecked,TResult? Function( AuthError value)?  error,}){
final _that = this;
switch (_that) {
case LoginRequested() when loginRequested != null:
return loginRequested(_that);case RegisterRequested() when registerRequested != null:
return registerRequested(_that);case PhoneVerificationRequested() when phoneVerificationRequested != null:
return phoneVerificationRequested(_that);case PhoneCodeVerified() when phoneCodeVerified != null:
return phoneCodeVerified(_that);case LogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case AuthStateChecked() when authStateChecked != null:
return authStateChecked(_that);case AuthError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String email,  String password)?  loginRequested,TResult Function( String name,  String email,  String password)?  registerRequested,TResult Function( String phoneNumber)?  phoneVerificationRequested,TResult Function( String verificationId,  String smsCode)?  phoneCodeVerified,TResult Function()?  logoutRequested,TResult Function()?  authStateChecked,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginRequested() when loginRequested != null:
return loginRequested(_that.email,_that.password);case RegisterRequested() when registerRequested != null:
return registerRequested(_that.name,_that.email,_that.password);case PhoneVerificationRequested() when phoneVerificationRequested != null:
return phoneVerificationRequested(_that.phoneNumber);case PhoneCodeVerified() when phoneCodeVerified != null:
return phoneCodeVerified(_that.verificationId,_that.smsCode);case LogoutRequested() when logoutRequested != null:
return logoutRequested();case AuthStateChecked() when authStateChecked != null:
return authStateChecked();case AuthError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String email,  String password)  loginRequested,required TResult Function( String name,  String email,  String password)  registerRequested,required TResult Function( String phoneNumber)  phoneVerificationRequested,required TResult Function( String verificationId,  String smsCode)  phoneCodeVerified,required TResult Function()  logoutRequested,required TResult Function()  authStateChecked,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case LoginRequested():
return loginRequested(_that.email,_that.password);case RegisterRequested():
return registerRequested(_that.name,_that.email,_that.password);case PhoneVerificationRequested():
return phoneVerificationRequested(_that.phoneNumber);case PhoneCodeVerified():
return phoneCodeVerified(_that.verificationId,_that.smsCode);case LogoutRequested():
return logoutRequested();case AuthStateChecked():
return authStateChecked();case AuthError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String email,  String password)?  loginRequested,TResult? Function( String name,  String email,  String password)?  registerRequested,TResult? Function( String phoneNumber)?  phoneVerificationRequested,TResult? Function( String verificationId,  String smsCode)?  phoneCodeVerified,TResult? Function()?  logoutRequested,TResult? Function()?  authStateChecked,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case LoginRequested() when loginRequested != null:
return loginRequested(_that.email,_that.password);case RegisterRequested() when registerRequested != null:
return registerRequested(_that.name,_that.email,_that.password);case PhoneVerificationRequested() when phoneVerificationRequested != null:
return phoneVerificationRequested(_that.phoneNumber);case PhoneCodeVerified() when phoneCodeVerified != null:
return phoneCodeVerified(_that.verificationId,_that.smsCode);case LogoutRequested() when logoutRequested != null:
return logoutRequested();case AuthStateChecked() when authStateChecked != null:
return authStateChecked();case AuthError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LoginRequested implements AuthEvent {
  const LoginRequested({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginRequestedCopyWith<LoginRequested> get copyWith => _$LoginRequestedCopyWithImpl<LoginRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRequested&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.loginRequested(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $LoginRequestedCopyWith(LoginRequested value, $Res Function(LoginRequested) _then) = _$LoginRequestedCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$LoginRequestedCopyWithImpl<$Res>
    implements $LoginRequestedCopyWith<$Res> {
  _$LoginRequestedCopyWithImpl(this._self, this._then);

  final LoginRequested _self;
  final $Res Function(LoginRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(LoginRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RegisterRequested implements AuthEvent {
  const RegisterRequested({required this.name, required this.email, required this.password});
  

 final  String name;
 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterRequestedCopyWith<RegisterRequested> get copyWith => _$RegisterRequestedCopyWithImpl<RegisterRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterRequested&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,password);

@override
String toString() {
  return 'AuthEvent.registerRequested(name: $name, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $RegisterRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $RegisterRequestedCopyWith(RegisterRequested value, $Res Function(RegisterRequested) _then) = _$RegisterRequestedCopyWithImpl;
@useResult
$Res call({
 String name, String email, String password
});




}
/// @nodoc
class _$RegisterRequestedCopyWithImpl<$Res>
    implements $RegisterRequestedCopyWith<$Res> {
  _$RegisterRequestedCopyWithImpl(this._self, this._then);

  final RegisterRequested _self;
  final $Res Function(RegisterRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? password = null,}) {
  return _then(RegisterRequested(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PhoneVerificationRequested implements AuthEvent {
  const PhoneVerificationRequested({required this.phoneNumber});
  

 final  String phoneNumber;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneVerificationRequestedCopyWith<PhoneVerificationRequested> get copyWith => _$PhoneVerificationRequestedCopyWithImpl<PhoneVerificationRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneVerificationRequested&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumber);

@override
String toString() {
  return 'AuthEvent.phoneVerificationRequested(phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class $PhoneVerificationRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $PhoneVerificationRequestedCopyWith(PhoneVerificationRequested value, $Res Function(PhoneVerificationRequested) _then) = _$PhoneVerificationRequestedCopyWithImpl;
@useResult
$Res call({
 String phoneNumber
});




}
/// @nodoc
class _$PhoneVerificationRequestedCopyWithImpl<$Res>
    implements $PhoneVerificationRequestedCopyWith<$Res> {
  _$PhoneVerificationRequestedCopyWithImpl(this._self, this._then);

  final PhoneVerificationRequested _self;
  final $Res Function(PhoneVerificationRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phoneNumber = null,}) {
  return _then(PhoneVerificationRequested(
phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PhoneCodeVerified implements AuthEvent {
  const PhoneCodeVerified({required this.verificationId, required this.smsCode});
  

 final  String verificationId;
 final  String smsCode;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneCodeVerifiedCopyWith<PhoneCodeVerified> get copyWith => _$PhoneCodeVerifiedCopyWithImpl<PhoneCodeVerified>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneCodeVerified&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.smsCode, smsCode) || other.smsCode == smsCode));
}


@override
int get hashCode => Object.hash(runtimeType,verificationId,smsCode);

@override
String toString() {
  return 'AuthEvent.phoneCodeVerified(verificationId: $verificationId, smsCode: $smsCode)';
}


}

/// @nodoc
abstract mixin class $PhoneCodeVerifiedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $PhoneCodeVerifiedCopyWith(PhoneCodeVerified value, $Res Function(PhoneCodeVerified) _then) = _$PhoneCodeVerifiedCopyWithImpl;
@useResult
$Res call({
 String verificationId, String smsCode
});




}
/// @nodoc
class _$PhoneCodeVerifiedCopyWithImpl<$Res>
    implements $PhoneCodeVerifiedCopyWith<$Res> {
  _$PhoneCodeVerifiedCopyWithImpl(this._self, this._then);

  final PhoneCodeVerified _self;
  final $Res Function(PhoneCodeVerified) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? verificationId = null,Object? smsCode = null,}) {
  return _then(PhoneCodeVerified(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,smsCode: null == smsCode ? _self.smsCode : smsCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LogoutRequested implements AuthEvent {
  const LogoutRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logoutRequested()';
}


}




/// @nodoc


class AuthStateChecked implements AuthEvent {
  const AuthStateChecked();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateChecked);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.authStateChecked()';
}


}




/// @nodoc


class AuthError implements AuthEvent {
  const AuthError(this.message);
  

 final  String message;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthErrorCopyWith<AuthError> get copyWith => _$AuthErrorCopyWithImpl<AuthError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthEvent.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthErrorCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthErrorCopyWith(AuthError value, $Res Function(AuthError) _then) = _$AuthErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthErrorCopyWithImpl<$Res>
    implements $AuthErrorCopyWith<$Res> {
  _$AuthErrorCopyWithImpl(this._self, this._then);

  final AuthError _self;
  final $Res Function(AuthError) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
