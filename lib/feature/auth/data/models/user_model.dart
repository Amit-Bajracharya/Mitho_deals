import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;

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
    String? role,   // 'consumer' or 'vendor'
    String? phoneNumber,
    @Default(false) bool isEmailVerified,
    @Default(false) bool isPhoneVerified,
    DateTime? createdAt,
    DateTime? lastLoginAt, 
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => 
      _$UserModelFromJson(json);

  // THIS IS THE SUPABASE MAGIC!
  factory UserModel.fromSupabaseUser(supa.User user) { 
    return UserModel(
      id: user.id,
      name: user.userMetadata?['name'] ?? user.email?.split('@')[0] ?? '',
      email: user.email ?? '',
      role: user.userMetadata?['role'] as String?,
      phoneNumber: user.phone,
      isEmailVerified: user.emailConfirmedAt != null,
      isPhoneVerified: user.phoneConfirmedAt != null,
      createdAt: DateTime.parse(user.createdAt),
      lastLoginAt: user.lastSignInAt != null ? DateTime.parse(user.lastSignInAt!) : null, 
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      name: name,
      role: role,
      phoneNumber: phoneNumber,
      isEmailVerified: isEmailVerified,
      isPhoneVerified: isPhoneVerified,
      createdAt: createdAt,
      lastLoginAt: lastLoginAt, 
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      role: entity.role,
      phoneNumber: entity.phoneNumber,
      isEmailVerified: entity.isEmailVerified,
      isPhoneVerified: entity.isPhoneVerified,
      createdAt: entity.createdAt,
      lastLoginAt: entity.lastLoginAt, 
    );
  }
}
