import 'package:firebase_auth/firebase_auth.dart';

import 'package:mitho_deals/feature/auth/data/models/user_model.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> registerWithEmail(
    String email,
    String password,
    String name,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await userCredential.user?.updateDisplayName(name);

      return UserModel.fromFirebaseUser(userCredential.user!);
    } catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<UserModel> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return UserModel.fromFirebaseUser(userCredential.user!);
    } catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<void> verifyPhoneNumber(
    String phoneNumber, {
    required Function(String) onCodeSent,
    required Function(String) onVerificationFailed,
    required Function(String) onAutoRetrievalTimeout,
  }) async {
    try {
      // For testing - bypass actual Firebase verification if certificate hash issue persists
      if (phoneNumber.contains('123')) {
        // Test mode - simulate OTP sent
        await Future.delayed(const Duration(seconds: 2));
        onCodeSent('test_verification_id_12345');
        return;
      }
      
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-verification completed - sign in with credential
          try {
            await _auth.signInWithCredential(credential);
          } catch (e) {
            onVerificationFailed(_getErrorMessage(e));
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          onVerificationFailed(_getErrorMessage(e));
        },
        codeSent: (String verificationId, int? resendToken) {
          onCodeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          onAutoRetrievalTimeout(verificationId);
        },
        timeout: const Duration(seconds: 60),
        forceResendingToken: null,
      );
    } catch (e) {
      onVerificationFailed(_getErrorMessage(e));
    }
  }

  Future<UserModel> verifyPhoneCode(
    String verificationId,
    String smsCode,
  ) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      return UserModel.fromFirebaseUser(userCredential.user!);
    } catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  UserModel? getCurrentUser() {
    User? user = _auth.currentUser;
    return user != null ? UserModel.fromFirebaseUser(user) : null;
  }

  Stream<UserModel?> authStateChanges() {
    return _auth.authStateChanges().map(
      (user) => user != null ? UserModel.fromFirebaseUser(user) : null,
    );
  }

  Future<UserModel> signInWithCredential(PhoneAuthCredential credential) async {
    try {
      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      return UserModel.fromFirebaseUser(userCredential.user!);
    } catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  String _getErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'weak-password':
          return 'The password provided is too weak.';
        case 'email-already-in-use':
          return 'An account already exists for this email.';
        case 'user-not-found':
          return 'No user found for this email.';
        case 'wrong-password':
          return 'Wrong password provided.';
        case 'invalid-email':
          return 'The email address is not valid.';
        case 'user-disabled':
          return 'This user account has been disabled.';
        case 'too-many-requests':
          return 'Too many requests. Try again later.';
        case 'invalid-phone-number':
          return 'The phone number is not valid.';
        case 'session-expired':
          return 'The SMS code has expired. Please try again.';
        case 'quota-exceeded':
          return 'Too many SMS requests. Try again later.';
        case 'invalid-verification-code':
          return 'Invalid verification code. Please try again.';
        case 'invalid-verification-id':
          return 'Invalid verification ID. Please request a new OTP.';
        case 'captcha-check-failed':
          return 'reCAPTCHA verification failed. Please try again.';
        case 'web-context-canceled':
          return 'Verification was cancelled. Please try again.';
        case 'web-context-requested':
          return 'Please complete the verification in your browser.';
        case 'web-context-presented':
          return 'Verification screen presented. Please complete it.';
        case 'web-context-internal-error':
          return 'Internal error during verification. Please try again.';
        default:
          return 'An error occurred: ${error.message}';
      }
    }
    return error.toString();
  }
}
