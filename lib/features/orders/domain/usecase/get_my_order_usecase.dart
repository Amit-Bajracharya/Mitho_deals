import 'package:mitho_deals/features/orders/domain/entity/order_entity.dart';
import 'package:mitho_deals/features/orders/domain/repo/orders_repository.dart';

class GetMyOrdersUseCase {
  final OrdersRepository repository;

  GetMyOrdersUseCase(this.repository);

  Future<List<OrderEntity>> call() async {
    return await repository.getMyOrders();
  }
}
