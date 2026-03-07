import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitho_deals/feature/auth/domain/entities/auth_result_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/usecases/phone_auth_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final PhoneAuthUseCase _phoneAuthUseCase;

  AuthBloc({
    required AuthRepository repository,
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
    required PhoneAuthUseCase phoneAuthUseCase,
  })  : _repository = repository,
        _loginUseCase = loginUseCase,
        _registerUseCase = registerUseCase,
        _phoneAuthUseCase = phoneAuthUseCase,
        super(const AuthState.initial()) {
    on<AuthEvent>(_onEvent);
  }

  Future<void> _onEvent(AuthEvent event, Emitter<AuthState> emit) async {
     event.when(
      loginRequested: (email, password) => _onLoginRequested(email, password, emit),
      registerRequested: (email, password, name) => _onRegisterRequested(email, password, name, emit),
      phoneVerificationRequested: (phoneNumber) => _onPhoneVerificationRequested(phoneNumber, emit),
      phoneCodeVerified: (verificationId, smsCode) => _onPhoneCodeVerified(verificationId, smsCode, emit),
      logoutRequested: () => _onLogoutRequested(emit),
      authStateChecked: () => _onAuthStateChecked(emit),
      error: (message) => emit(AuthState.error(message)),
    );
  }

  Future<void> _onLoginRequested(String email, String password, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    
    final result = await _loginUseCase(email, password);
    
    result.when(
      success: (user) {
        emit(AuthState.authenticated(user));
      },
      failure: (message) {
        emit(AuthState.error(message));
      },
    );
  }

  Future<void> _onRegisterRequested(String email, String password, String name, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    
    final result = await _registerUseCase(email, password, name);
    
    result.when(
      success: (user) {
        emit(AuthState.authenticated(user));
      },
      failure: (message) {
        emit(AuthState.error(message));
      },
    );
  }

  Future<void> _onPhoneVerificationRequested(String phoneNumber, Emitter<AuthState> emit) async {
    emit(const AuthState.phoneVerificationLoading());
    
    try {
      _phoneAuthUseCase.verifyPhoneNumber(phoneNumber);
      emit(AuthState.phoneCodeSent(
        verificationId: '', // This would be handled by a callback or stream
        phoneNumber: phoneNumber,
      ));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onPhoneCodeVerified(String verificationId, String smsCode, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    
    final result = await _phoneAuthUseCase.verifyCode(verificationId, smsCode);
    
    result.when(
      success: (user) {
        emit(AuthState.authenticated(user));
      },
      failure: (message) {
        emit(AuthState.error(message));
      },
    );
  }

  Future<void> _onLogoutRequested(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    
    try {
      await _repository.logout();
      emit(const AuthState.unauthenticated());
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onAuthStateChecked(Emitter<AuthState> emit) async {
    try {
      final currentUser = await _repository.getCurrentUser();
      if (currentUser != null) {
        emit(AuthState.authenticated(currentUser));
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
}

