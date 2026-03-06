import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mitho_deals/feature/auth/domain/entities/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String name,
    required String email,
    String? phoneNumber,
    @Default(false) bool isEmailVerified,
    @Default(false) bool isPhoneVerified,
    DateTime? createdAt,
    DateTime? lastLoginAt, // Fixed: lastLoginAt
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => // Fixed: fromJson
      _$UserModelFromJson(json);

  factory UserModel.fromFirebaseUser(User user) { // Fixed: Added User type
    return UserModel(
      id: user.uid,
      name: user.displayName ?? user.email?.split('@')[0] ?? '',
      email: user.email ?? '',
      phoneNumber: user.phoneNumber,
      isEmailVerified: user.emailVerified,
      isPhoneVerified: false, // Firebase doesn't track this by default
      createdAt: user.metadata.creationTime,
      lastLoginAt: user.metadata.lastSignInTime, // Fixed: lastLoginAt
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      name: name,
      phoneNumber: phoneNumber,
      isEmailVerified: isEmailVerified,
      isPhoneVerified: isPhoneVerified,
      createdAt: createdAt,
      lastLoginAt: lastLoginAt, // Fixed: lastLoginAt
    );
  }

  // Convert Entity to Model
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      phoneNumber: entity.phoneNumber,
      isEmailVerified: entity.isEmailVerified,
      isPhoneVerified: entity.isPhoneVerified,
      createdAt: entity.createdAt,
      lastLoginAt: entity.lastLoginAt, // Fixed: lastLoginAt
    );
  }
}