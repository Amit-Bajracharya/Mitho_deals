import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitho_deals/features/auth/domain/usecases/phone_auth_usecase.dart';
import 'package:mitho_deals/features/auth/domain/usecases/register_usecase.dart';
import '../../domain/entities/auth_result_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_vendor_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final RegisterVendorUseCase _registerVendorUseCase;
  final PhoneAuthUseCase _phoneAuthUseCase;

  AuthBloc({
    required AuthRepository repository,
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
    required RegisterVendorUseCase registerVendorUseCase,
    required PhoneAuthUseCase phoneAuthUseCase,
  })  : _repository = repository,
        _loginUseCase = loginUseCase,
        _registerUseCase = registerUseCase,
        _registerVendorUseCase = registerVendorUseCase,
        _phoneAuthUseCase = phoneAuthUseCase,
        super(const AuthState.initial()) {
    on<AuthEvent>(_onEvent);
  }

  Future<void> _onEvent(AuthEvent event, Emitter<AuthState> emit) async {
    await event.when(
      loginRequested: (email, password) async => _onLoginRequested(email, password, emit),
      registerRequested: (name, email, password) async => _onRegisterRequested(email, password, name, emit),
      registerVendorRequested: (name, email, password, desc, addr) async => 
          _onRegisterVendorRequested(name, email, password, desc, addr, emit),
      phoneVerificationRequested: (phoneNumber) async => _onPhoneVerificationRequested(phoneNumber, emit),
      phoneCodeVerified: (verificationId, smsCode) async => _onPhoneCodeVerified(verificationId, smsCode, emit),
      logoutRequested: () async => _onLogoutRequested(emit),
      authStateChecked: () async => _onAuthStateChecked(emit),
      error: (message) async => emit(AuthState.error(message)),
    );
  }

  Future<void> _onLoginRequested(String email, String password, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    
    try {
      final result = await _loginUseCase(email, password);
      
      // Simple check instead of when pattern
      if (result is AuthSuccess) {
        if (!emit.isDone) emit(AuthState.authenticated(result.user));
      } else if (result is AuthFailure) {
        if (!emit.isDone) emit(AuthState.error(result.message));
      }
    } catch (e) {
      if (!emit.isDone) emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onRegisterRequested(String email, String password, String name, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    
    try {
      final result = await _registerUseCase(name, email, password);
      
      // Simple check instead of when pattern
      if (result is AuthSuccess) {
        if (!emit.isDone) emit(AuthState.authenticated(result.user));
      } else if (result is AuthFailure) {
        if (!emit.isDone) emit(AuthState.error(result.message));
      }
    } catch (e) {
      if (!emit.isDone) emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onRegisterVendorRequested(
    String name,
    String email,
    String password,
    String description,
    String address,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    try {
      final result = await _registerVendorUseCase(
        restaurantName: name,
        email: email,
        password: password,
        description: description,
        address: address,
      );

      if (result is AuthSuccess) {
        if (!emit.isDone) emit(AuthState.authenticated(result.user));
      } else if (result is AuthFailure) {
        if (!emit.isDone) emit(AuthState.error(result.message));
      }
    } catch (e) {
      if (!emit.isDone) emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onPhoneVerificationRequested(String phoneNumber, Emitter<AuthState> emit) async {
    emit(const AuthState.phoneVerificationLoading());
    
    try {
      await _phoneAuthUseCase.verifyPhoneNumber(
        phoneNumber,
        onCodeSent: (verificationId) {
          if (!emit.isDone) emit(AuthState.phoneCodeSent(
            verificationId: verificationId,
            phoneNumber: phoneNumber,
          ));
        },
        onVerificationFailed: (error) {
          if (!emit.isDone) emit(AuthState.error(error));
        },
        onAutoRetrievalTimeout: (verificationId) {
          if (!emit.isDone) emit(AuthState.phoneCodeSent(
            verificationId: verificationId,
            phoneNumber: phoneNumber,
          ));
        },
      );
    } catch (e) {
      if (!emit.isDone) emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onPhoneCodeVerified(String verificationId, String smsCode, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    
    try {
      final result = await _phoneAuthUseCase.verifyCode(verificationId, smsCode);
      
      result.when(
        success: (user) {
          if (!emit.isDone) emit(AuthState.authenticated(user));
        },
        failure: (message) {
          if (!emit.isDone) emit(AuthState.error(message));
        },
      );
    } catch (e) {
      if (!emit.isDone) emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onLogoutRequested(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    
    try {
      await _repository.logout();
      if (!emit.isDone) emit(const AuthState.unauthenticated());
    } catch (e) {
      if (!emit.isDone) emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onAuthStateChecked(Emitter<AuthState> emit) async {
    try {
      final currentUser = await _repository.getCurrentUser();
      if (currentUser != null) {
        if (!emit.isDone) emit(AuthState.authenticated(currentUser));
      } else {
        if (!emit.isDone) emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      if (!emit.isDone) emit(AuthState.error(e.toString()));
    }
  }
}

