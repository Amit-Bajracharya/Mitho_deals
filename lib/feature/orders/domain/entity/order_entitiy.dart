import 'package:mitho_deals/feature/deals/domain/entitiy/deal_entity.dart';

class OrderEntitiy  with _$OrderEntity{
  const factory OrderEntitiy({
     required String id,
  required String userId,
  required String dealId,
  required int quantity,
  required double totalPrice,
  required String status,
  required DateTime createdAt,
   DealEntity? deal,
  }) = _OrderEntity;
 
}
