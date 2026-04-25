import 'package:mitho_deals/features/auth/data/datasource/auth_remote_datasource.dart' show SupabaseAuthDataSource;
import 'package:mitho_deals/features/auth/domain/entities/auth_result_entity.dart';
import 'package:mitho_deals/features/auth/domain/entities/user_entity.dart';
import 'package:mitho_deals/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseAuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);
  
  @override
  Stream<UserEntity?> authStateChanges() {
    return _dataSource.authStateChanges().map((model) => model?.toEntity());
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final userModel = _dataSource.getCurrentUser();
    return userModel?.toEntity();
  }

  @override
  Future<AuthResultEntity> login(String email, String password) async {
    try {
      final userModel = await _dataSource.signInWithEmail(email, password);
      return AuthResultEntity.success(userModel.toEntity());
    } catch (e) {
      return AuthResultEntity.failure(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    await _dataSource.logout();
  }

  @override
  Future<AuthResultEntity> register(
    String email,
    String password,
    String name,
  ) async {
    try {
      final userModel = await _dataSource.registerWithEmail(
        email,
        password,
        name,
      );
      return AuthResultEntity.success(userModel.toEntity());
    } on Exception catch (e) {
      return AuthResultEntity.failure(e.toString());
    }
  }

  @override
  Future<AuthResultEntity> registerVendor({
    required String email,
    required String password,
    required String restaurantName,
    required String description,
    required String address,
  }) async {
    try {
      final userModel = await _dataSource.registerVendorWithEmail(
        email: email,
        password: password,
        restaurantName: restaurantName,
        description: description,
        address: address,
      );
      return AuthResultEntity.success(userModel.toEntity());
    } catch (e) {
      return AuthResultEntity.failure(e.toString());
    }
  }

   @override
  Future<AuthResultEntity> verifyPhoneCode(String verificationId, String smsCode) async {
    try {
      final userModel = await _dataSource.verifyPhoneCode(verificationId, smsCode);
      return AuthResultEntity.success(userModel.toEntity());
    } catch (e) {
      return AuthResultEntity.failure(e.toString());
    }
  }

 @override
  Future<void> verifyPhoneNumber(
    String phoneNumber, {
    required Function(String) onCodeSent,
    required Function(String) onVerificationFailed,
    required Function(String) onAutoRetrievalTimeout,
  }) async {
    await _dataSource.verifyPhoneNumber(
      phoneNumber,
      onCodeSent: onCodeSent,
      onAutoRetrievalTimeout: onAutoRetrievalTimeout,
      onVerificationFailed: onVerificationFailed,
    );
  }
}
