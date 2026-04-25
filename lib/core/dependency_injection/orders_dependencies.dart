import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mitho_deals/features/orders/data/datasources/orders_remote_datasource.dart';
import 'package:mitho_deals/features/orders/data/repositories/orders_repository_impl.dart';
import 'package:mitho_deals/features/orders/domain/repo/orders_repository.dart';
import 'package:mitho_deals/features/orders/domain/usecase/get_my_order_usecase.dart';

import 'package:mitho_deals/features/orders/presentation/bloc/orders_bloc.dart';

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

  // BLoC
  ServiceLocator.register<OrdersBloc>(
    OrdersBloc(getMyOrdersUseCase: ServiceLocator.get<GetMyOrdersUseCase>()),
  );
}
