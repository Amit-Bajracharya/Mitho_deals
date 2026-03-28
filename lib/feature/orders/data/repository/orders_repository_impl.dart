import 'package:mitho_deals/feature/orders/data/data_source/orders_remote_datasource.dart';

import 'package:mitho_deals/feature/orders/domain/entity/order_entity.dart';
import 'package:mitho_deals/feature/orders/domain/repo/orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource remoteDataSource;

  OrdersRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<OrderEntity>> getMyOrders() async {
    // 1. Get the list of OrderModels from the Data Source
    final orderModels = await remoteDataSource.getMyOrders();

    // 2. Map those Models into Entities for the Domain Layer
    // .toEntity() is the method you created in the OrderModel!
    return orderModels.map((model) => model.toEntity()).toList();
  }
}
