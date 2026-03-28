import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/feature/orders/data/data_source/orders_remote_datasource.dart';
import 'package:mitho_deals/feature/orders/data/repository/orders_repository_impl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:mitho_deals/feature/orders/domain/repo/orders_repository.dart';
import 'package:mitho_deals/feature/orders/domain/usecase/get_my_order_usecase.dart';

void setupOrdersDependencies() {
  // 1. Register the Remote Data Source (Injecting SupabaseClient)
  ServiceLocator.register<OrdersRemoteDataSource>(
    OrdersRemoteDataSourceImpl(Supabase.instance.client),
  );

  // 2. Register the Repository Implementation (Injecting our Data Source)
  ServiceLocator.register<OrdersRepository>(
    OrdersRepositoryImpl(ServiceLocator.get<OrdersRemoteDataSource>()),
  );

  // 3. Register the Use Case (Injecting our Repository)
  ServiceLocator.register<GetMyOrdersUseCase>(
    GetMyOrdersUseCase(ServiceLocator.get<OrdersRepository>()),
  );
}
