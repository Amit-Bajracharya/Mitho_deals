import 'package:mitho_deals/feature/auth/domain/entities/auth_result_entity.dart';
import 'package:mitho_deals/feature/auth/domain/repositories/auth_repository.dart';

class PhoneAuthUseCase {
  final AuthRepository _repository;

  PhoneAuthUseCase(this._repository);

  Future<void> verifyPhoneNumber(String phoneNumber) async {

    if(phoneNumber.isEmpty){
    throw Exception('Phone number required');
  }

    if (!_isValidPhoneNumber(phoneNumber)) {
      throw Exception('Invalid phone number format');
    }

    await _repository.verifyPhoneNumber(phoneNumber);
  }

  Future<AuthResultEntity> verifyCode(String verificationId, String smsCode) async {
      if (verificationId.isEmpty || smsCode.isEmpty) {
        return const AuthResultEntity.failure('Verification code is required');
      }
    
      if (smsCode.length != 6) {
        return const AuthResultEntity.failure('Invalid verification code');
      }
    
      // Delegate to repository
      return await _repository.verifyPhoneCode(verificationId, smsCode);
    }
  
   bool _isValidPhoneNumber(String phoneNumber) {
    // Simple validation - can be enhanced
    return RegExp(r'^\+?[\d\s\-\(\)]+$').hasMatch(phoneNumber) && 
           phoneNumber.replaceFirst('+', '').replaceAll(RegExp(r'[\s\-\(\)]'), '').length >= 10;
  }
}

