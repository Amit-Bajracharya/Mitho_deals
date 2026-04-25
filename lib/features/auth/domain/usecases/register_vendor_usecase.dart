import 'package:mitho_deals/features/auth/domain/entities/auth_result_entity.dart';
import 'package:mitho_deals/features/auth/domain/repositories/auth_repository.dart';

class RegisterVendorUseCase {
  final AuthRepository _authRepository;

  RegisterVendorUseCase(this._authRepository);

  Future<AuthResultEntity> call({
    required String restaurantName,
    required String email,
    required String password,
    required String description,
    required String address,
  }) async {
    if (restaurantName.isEmpty || email.isEmpty || password.isEmpty || description.isEmpty || address.isEmpty) {
      return const AuthResultEntity.failure("Please fill all the fields");
    }

    if (!_isValidEmail(email)) {
      return const AuthResultEntity.failure("Please enter a valid email");
    }

    if (restaurantName.length < 2) {
      return const AuthResultEntity.failure('Restaurant name must be at least 2 characters');
    }

    if (password.length < 6) {
      return const AuthResultEntity.failure('Password must be at least 6 characters');
    }

    return await _authRepository.registerVendor(
      email: email,
      password: password,
      restaurantName: restaurantName,
      description: description,
      address: address,
    );
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
