import 'package:mitho_deals/feature/orders/data/datasources/orders_remote_datasource.dart';
import 'package:mitho_deals/feature/orders/domain/entity/order_entity.dart';
import 'package:mitho_deals/feature/orders/domain/repo/orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource remoteDataSource;

  OrdersRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<OrderEntity>> getMyOrders() async {
    final orderModels = await remoteDataSource.getMyOrders();
    return orderModels.map((model) => model.toEntity()).toList();
  }
}
