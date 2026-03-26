import 'package:mitho_deals/feature/orders/domain/entity/order_entity.dart';

abstract class OrdersRepository {
  Future<List<OrderEntity>> getMyOrders();
}