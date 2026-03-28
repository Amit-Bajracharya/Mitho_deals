import 'package:supabase_flutter/supabase_flutter.dart' as supa;
import '../models/user_model.dart';
import '../../../../core/errors/exceptions.dart';

abstract class SupabaseAuthDataSource {
  Stream<UserModel?> authStateChanges();
  UserModel? getCurrentUser();
  Future<UserModel> signInWithEmail(String email, String password);
  Future<UserModel> registerWithEmail(String email, String password, String name);
  Future<UserModel> registerVendorWithEmail({
    required String email,
    required String password,
    required String restaurantName,
    required String description,
    required String address,
  });
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
        data: {
          'name': name,
          'role': 'consumer', // Explicitly set role for consumers
        },
      );
      final user = response.user;
      if (user == null) throw const ServerException(message: 'Registration failed');
      return UserModel.fromSupabaseUser(user);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> registerVendorWithEmail({
    required String email,
    required String password,
    required String restaurantName,
    required String description,
    required String address,
  }) async {
    try {
      // 1. Sign up as a vendor in auth metadata
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': restaurantName,
          'role': 'vendor',
        },
      );

      final user = response.user;
      if (user == null) throw const ServerException(message: 'Vendor registration failed');

      // 2. Insert vendor details into 'vendors' table
      // Based on schema: owner_id links to auth.users.id
      await supabaseClient.from('vendors').insert({
        'owner_id': user.id,
        'name': restaurantName,
        'description': description,
        'address': address,
        'latitude': 0.0,
        'longitude': 0.0,
        'rating': 0.0,
        'is_open': false,
      });

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
