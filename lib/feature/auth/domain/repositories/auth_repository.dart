import 'package:mitho_deals/feature/auth/domain/entities/auth_result_entity.dart';
import 'package:mitho_deals/feature/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<AuthResultEntity> login(String email, String password);

  Future<AuthResultEntity> register(String email, String password, String name);

  //Phone Auth
  Future<void> verifyPhoneNumber(String phoneNumber);
  Future<AuthResultEntity> verifyPhoneCode(String verificationCode, String smsCode);


  //Session managment
  Future<void> logout();
  Future<UserEntity?> getCurrentUser();
  Stream<UserEntity?> authStateChanges();

}