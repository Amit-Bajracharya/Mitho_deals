import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mitho_deals/feature/deals/data/models/deal_model.dart';
import 'package:mitho_deals/feature/orders/domain/entity/order_entity.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderModel with _$OrderModel {
  const OrderModel._(); // Required to add custom methods like toEntity()

  const factory OrderModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'deal_id') required String dealId,
    @JsonKey(name: 'vendor_id') required String vendorId,
    required int quantity,
    @JsonKey(name: 'total_amount') required double totalAmount,
    required String status,
    @JsonKey(name: 'pickup_code') required String pickupCode,
    @JsonKey(name: 'order_placed_time') required DateTime orderPlacedTime,

    // Handles the Supabase join: .select('*, deals(*)')
    // Supabase returns the joined deal data under the key 'deals'
    @JsonKey(name: 'deals') DealModel? deal,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  // Data Layer → Domain Layer
  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      userId: userId,
      dealId: dealId,
      vendorId: vendorId,
      quantity: quantity,
      totalAmount: totalAmount,
      status: status,
      pickupCode: pickupCode,
      orderPlacedTime: orderPlacedTime,
      deal: deal?.toEntity(),
    );
  }

  // Domain Layer → Data Layer (used when placing an order)
  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      id: entity.id,
      userId: entity.userId,
      dealId: entity.dealId,
      vendorId: entity.vendorId,
      quantity: entity.quantity,
      totalAmount: entity.totalAmount,
      status: entity.status,
      pickupCode: entity.pickupCode,
      orderPlacedTime: entity.orderPlacedTime,
      deal: entity.deal != null ? DealModel.fromEntity(entity.deal!) : null,
    );
  }
}
