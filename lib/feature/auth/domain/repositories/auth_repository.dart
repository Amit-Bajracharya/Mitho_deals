import 'package:mitho_deals/feature/auth/domain/entities/auth_result_entity.dart';
import 'package:mitho_deals/feature/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<AuthResultEntity> login(String email, String password);

  Future<AuthResultEntity> register(String email, String password, String name);

  Future<AuthResultEntity> registerVendor({
    required String email,
    required String password,
    required String restaurantName,
    required String description,
    required String address,
  });

  //Phone Auth
  Future<void> verifyPhoneNumber(
    String phoneNumber, {
    required Function(String) onCodeSent,
    required Function(String) onVerificationFailed,
    required Function(String) onAutoRetrievalTimeout,
  });
  Future<AuthResultEntity> verifyPhoneCode(String verificationId, String smsCode);


  //Session managment
  Future<void> logout();
  Future<UserEntity?> getCurrentUser();
  Stream<UserEntity?> authStateChanges();

}