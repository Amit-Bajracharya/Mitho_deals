// lib/features/deals/domain/entities/deal_entity.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'deal_entity.freezed.dart';

@freezed
abstract class DealEntity with _$DealEntity {
  const factory DealEntity({
    required String id,
    required String vendorId,
    required String foodName,
    required String description,
    required double originalPrice,
    required double discountedPrice,
    required int availablePortions,
    required DateTime pickupStartTime,
    required DateTime pickupEndTime,
    required String imageUrl,
    required String vendorName,
    required String vendorAddress,
    required double latitude,
    required double longitude,
    @Default(true) bool isAvailable,
  }) = _DealEntity;

 
}
