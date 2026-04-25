import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';

part 'order_entity.freezed.dart';

@freezed
abstract class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
    required String id,
    required String userId,        // Who placed the order
    required String dealId,        // Which deal was ordered
    required String vendorId,      // Which vendor to pick up from
    required int quantity,         // Number of portions
    required double totalAmount,   // Matches DB 'total_amount'
    required String status,        // 'reserved', 'picked_up', 'cancelled'
    required String pickupCode,    // Unique code to show vendor at pickup
    required DateTime orderPlacedTime, // Matches DB 'order_placed_time'

    // Optionally joined deal data so UI can show food name & image
    required String vendorName,    // Name of the restaurant/vendor
    DealEntity? deal,
  }) = _OrderEntity;
}
