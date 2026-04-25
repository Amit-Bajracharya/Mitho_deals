import 'package:mitho_deals/features/auth/domain/entities/auth_result_entity.dart';
import 'package:mitho_deals/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<AuthResultEntity> call(String email, String password) async{
    if(email.isEmpty || password.isEmpty){
      return const AuthResultEntity.failure("Enter Email and Password");
    }
    if(!_isValidEmail(email)){
      return const AuthResultEntity.failure("Enter valid email");
    }
    if(password.length < 6){
      return const AuthResultEntity.failure("Password must be of 6 characters");
    }

    return await _authRepository.login(email, password);
  }
  
  bool _isValidEmail(String email) {
     return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}