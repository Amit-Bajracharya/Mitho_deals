import 'package:mitho_deals/feature/auth/data/source/firebase_auth.dart' show FirebaseAuthDataSource;
import 'package:mitho_deals/feature/auth/domain/entities/auth_result_entity.dart';
import 'package:mitho_deals/feature/auth/domain/entities/user_entity.dart';
import 'package:mitho_deals/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);
  @override
  Stream<UserEntity?> authStateChanges() {
    return _dataSource.authStateChange().map((model) => model?.toEntity());
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final userModel = await _dataSource.getCurrentUser();
    return userModel?.toEntity();
  }

  @override
  Future<AuthResultEntity> login(String email, String password) async {
    try {
      final userModel = await _dataSource.siginInWithEmail(email, password);
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
  Future<AuthResultEntity> verifyPhoneCode(String verificationId, String smsCode) async {
    try {
      final userModel = await _dataSource.verifyPhoneCode(verificationId, smsCode);
      return AuthResultEntity.success(userModel.toEntity());
    } catch (e) {
      return AuthResultEntity.failure(e.toString());
    }
  }

 @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _dataSource.verifyPhoneNumber(
      phoneNumber,
      (verificationId) {
        // Handle code sent - you might want to use a callback or stream
      },
      (credential) async {
        // Handle auto-verification
        await _dataSource.signInWithCredential(credential);
      },
      (errorMessage) {
        throw Exception(errorMessage);
      },
    );
  }
}
