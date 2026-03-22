import 'package:supabase_flutter/supabase_flutter.dart' as supa;
import '../models/user_model.dart';
import '../../../../core/errors/exceptions.dart';

abstract class SupabaseAuthDataSource {
  Stream<UserModel?> authStateChanges();
  UserModel? getCurrentUser();
  Future<UserModel> signInWithEmail(String email, String password);
  Future<UserModel> registerWithEmail(String email, String password, String name);
  Future<void> logout();
  Future<UserModel> verifyPhoneCode(String verificationId, String smsCode);
  Future<void> verifyPhoneNumber(
    String phoneNumber, {
    required Function(String) onCodeSent,
    required Function(String) onVerificationFailed,
    required Function(String) onAutoRetrievalTimeout,
  });
}

class SupabaseAuthDataSourceImpl implements SupabaseAuthDataSource {
  final supa.SupabaseClient supabaseClient;

  SupabaseAuthDataSourceImpl(this.supabaseClient);

  @override
  Stream<UserModel?> authStateChanges() {
    return supabaseClient.auth.onAuthStateChange.map((event) {
      final user = event.session?.user;
      if (user == null) return null;
      return UserModel.fromSupabaseUser(user);
    });
  }

  @override
  UserModel? getCurrentUser() {
    final user = supabaseClient.auth.currentUser;
    if (user == null) return null;
    return UserModel.fromSupabaseUser(user);
  }

  @override
  Future<UserModel> signInWithEmail(String email, String password) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final user = response.user;
      if (user == null) throw const ServerException(message: 'Login failed');
      return UserModel.fromSupabaseUser(user);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> registerWithEmail(String email, String password, String name) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );
      final user = response.user;
      if (user == null) throw const ServerException(message: 'Registration failed');
      return UserModel.fromSupabaseUser(user);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> logout() async {
    await supabaseClient.auth.signOut();
  }

  @override
  Future<UserModel> verifyPhoneCode(String verificationId, String smsCode) async {
    try {
      final response = await supabaseClient.auth.verifyOTP(
        phone: verificationId,
        token: smsCode,
        type: supa.OtpType.sms,
      );
      final user = response.user;
      if (user == null) throw const ServerException(message: 'Verification failed');
      return UserModel.fromSupabaseUser(user);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> verifyPhoneNumber(
    String phoneNumber, {
    required Function(String) onCodeSent,
    required Function(String) onVerificationFailed,
    required Function(String) onAutoRetrievalTimeout,
  }) async {
    try {
      await supabaseClient.auth.signInWithOtp(phone: phoneNumber);
      onCodeSent(phoneNumber); 
    } catch (e) {
      onVerificationFailed(e.toString());
    }
  }
}
