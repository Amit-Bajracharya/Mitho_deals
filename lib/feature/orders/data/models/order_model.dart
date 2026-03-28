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
    @JsonKey(name: 'deals') DealModel? deal,
    
    // Handles the Supabase join: .select('*, vendors(name)')
    // Supabase returns { "vendors": { "name": "..." } }
    @JsonKey(name: 'vendors') Map<String, dynamic>? vendorInfo,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  String get vendorName => vendorInfo?['name'] as String? ?? 'Restaurant';

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
      vendorName: vendorName,
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
      vendorInfo: {'name': entity.vendorName},
      deal: entity.deal != null ? DealModel.fromEntity(entity.deal!) : null,
    );
  }
}
