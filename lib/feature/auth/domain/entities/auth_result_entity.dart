import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_entity.dart';

// Represents Auth operation results

part 'auth_result_entity.freezed.dart';

@freezed
abstract class AuthResultEntity with _$AuthResultEntity{
  const factory AuthResultEntity.success(UserEntity user) = AuthSuccess;
  const factory AuthResultEntity.failure(String message) = AuthFailure;
}
