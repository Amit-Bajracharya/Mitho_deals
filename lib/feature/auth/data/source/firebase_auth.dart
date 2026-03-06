import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:mitho_deals/feature/auth/data/models/user_model.dart';

class FirebaseAuthDataSource{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> registerWithEmail(String email , String password, String name) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);


      await userCredential.user?.updateDisplayName(name);

      return UserModel.fromFirebaseUser(userCredential.user!);
    }catch(e){
      throw Exception(_getErrorMessage(e));
    }
  }

  Future<UserModel> siginInWithEmail(String email, String password) async{
    try{
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

        return UserModel.fromFirebaseUser(userCredential.user!);
    }catch(e){
      throw Exception(_getErrorMessage(e));
    }
    
  }
   Future<void> verifyPhoneNumber(String phoneNumber, 
      Function(String) onCodeSent,
      Function(PhoneAuthCredential) onVerificationCompleted,
      Function(String) onVerificationFailed) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: onVerificationCompleted,
      verificationFailed: (FirebaseAuthException e) {
        onVerificationFailed(_getErrorMessage(e));
      },
      codeSent: (String verificationId, int? resendToken) {
        onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Handle timeout if needed
      },
    );
  }
  Future<UserModel> verifyPhoneCode(String verificationId, String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      return UserModel.fromFirebaseUser(userCredential.user!);
    } catch (e) {
      throw Exception(_getErrorMessage(e));
    }
  }
  
  UserModel? getCurrentUser(){
    User? user = _auth.currentUser;
    return user != null ? UserModel.fromFirebaseUser(user) : null;
  }

  Stream<UserModel?> authStateChange(){
    return _auth.authStateChanges().map((user)=> 
      user != null ? UserModel.fromFirebaseUser(user) : null);
    
  }
  Future<UserModel> signInWithCredential(PhoneAuthCredential credential) async {
  try {
    UserCredential userCredential = await _auth.signInWithCredential(credential);
    return UserModel.fromFirebaseUser(userCredential.user!);
  } catch (e) {
    throw Exception(_getErrorMessage(e));
  }
}

  Future<void> logout() async{
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
        default:
          return 'An error occurred: ${error.message}';
      }
    }
    return error.toString();
  }
}