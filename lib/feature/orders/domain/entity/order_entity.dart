import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mitho_deals/feature/deals/domain/entitiy/deal_entity.dart';

part 'order_entity.freezed.dart';

@freezed
abstract class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
    required String id,
    required String userId,
    required String dealId,
    required int quantity,
    required double totalPrice,
    required String status,
    required DateTime createdAt,
    
    // We optionally fetch the Deal so the UI can show the food name
    DealEntity? deal,
  }) = _OrderEntity;
}
