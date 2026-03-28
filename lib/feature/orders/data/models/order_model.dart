import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mitho_deals/feature/deals/data/models/deal_model.dart';
import 'package:mitho_deals/feature/orders/domain/entity/order_entity.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderModel with _$OrderModel {
  // We need this private constructor to add custom methods like toEntity()
  const OrderModel._();

  const factory OrderModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'deal_id') required String dealId,
    required int quantity,
    @JsonKey(name: 'total_price') required double totalPrice,
    required String status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    
    // This allows us to handle the Supabase join query .select('*, deals(*)')
    // If the join is performed, Supabase returns the deal data inside a 'deals' key
    @JsonKey(name: 'deals') DealModel? deal,
  }) = _OrderModel;

  // Standard fromJson for build_runner
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  // --- MAPPING LOGIC ---

  // Converts Model (Data Layer) -> Entity (Domain Layer)
  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      userId: userId,
      dealId: dealId,
      quantity: quantity,
      totalPrice: totalPrice,
      status: status,
      createdAt: createdAt,
      // Recursively convert the deal model to entity if it exists
      deal: deal?.toEntity(),
    );
  }

  // Converts Entity (Domain Layer) -> Model (Data Layer)
  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      id: entity.id,
      userId: entity.userId,
      dealId: entity.dealId,
      quantity: entity.quantity,
      totalPrice: entity.totalPrice,
      status: entity.status,
      createdAt: entity.createdAt,
      deal: entity.deal != null ? DealModel.fromEntity(entity.deal!) : null,
    );
  }
}
