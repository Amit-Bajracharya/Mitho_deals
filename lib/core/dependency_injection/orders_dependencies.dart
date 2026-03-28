import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mitho_deals/feature/orders/data/datasources/orders_remote_datasource.dart';
import 'package:mitho_deals/feature/orders/data/repositories/orders_repository_impl.dart';
import 'package:mitho_deals/feature/orders/domain/repo/orders_repository.dart';
import 'package:mitho_deals/feature/orders/domain/usecase/get_my_order_usecase.dart';

void setupOrdersDependencies() {
  // Data Sources
  ServiceLocator.register<OrdersRemoteDataSource>(
    OrdersRemoteDataSourceImpl(Supabase.instance.client),
  );

  // Repositories
  ServiceLocator.register<OrdersRepository>(
    OrdersRepositoryImpl(ServiceLocator.get<OrdersRemoteDataSource>()),
  );

  // Use Cases
  ServiceLocator.register<GetMyOrdersUseCase>(
    GetMyOrdersUseCase(ServiceLocator.get<OrdersRepository>()),
  );
}
