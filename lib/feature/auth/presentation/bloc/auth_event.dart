import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = LoginRequested;

  const factory AuthEvent.registerRequested({
    required String name,
    required String email, 
    required String password
  }) = RegisterRequested;

  const factory AuthEvent.phoneVerificationRequested({
    required String phoneNumber
  }) = PhoneVerificationRequested;

  const factory AuthEvent.phoneCodeVerified({
    required String verificationId,
    required String smsCode
  }) = PhoneCodeVerified;

  const factory AuthEvent.logoutRequested() = LogoutRequested;

  const factory AuthEvent.authStateChecked() = AuthStateChecked;

  const factory AuthEvent.error(String message) = AuthError;
}