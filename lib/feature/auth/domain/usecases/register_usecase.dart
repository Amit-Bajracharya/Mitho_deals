import 'package:mitho_deals/feature/auth/domain/entities/auth_result_entity.dart';
import 'package:mitho_deals/feature/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<AuthResultEntity> call(
    String name,
    String email,
    String password,
  ) async {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      return const AuthResultEntity.failure("Please Fill All The Field");
    }

    if (!_isValidEmail(email)) {
      return const AuthResultEntity.failure("Please enter valid email");
    }
    if (name.length < 2) {
      return const AuthResultEntity.failure(
        'Name must be at least 2 characters',
      );
    }

    if (password.length < 6) {
      return const AuthResultEntity.failure(
        'Password must be at least 6 characters',
      );
    }

    if (!_isStrongPassword(password)) {
      return const AuthResultEntity.failure(
        'Password must contain letters and numbers',
      );
    }

    return await _authRepository.register(email, password, name);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool _isStrongPassword(String password) {
    return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(password);
  }
}
