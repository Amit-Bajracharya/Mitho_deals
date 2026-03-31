import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../feature/vendor/data/datasource/vendor_remote_dataresource.dart';
import '../../feature/vendor/data/repositories/vendor_repository_impl.dart';
import '../../feature/vendor/domain/repository/vendor_repository.dart';
import '../../feature/vendor/domain/usecases/get_vendor_dashboard_stats.dart';
import '../../feature/vendor/domain/usecases/vendor_orders_usecase.dart';
import '../../feature/vendor/domain/usecases/confirm_pickup_usecase.dart';
import '../../feature/vendor/domain/usecases/update_shop_status_usecase.dart';
import '../../feature/vendor/presentation/bloc/vendor_bloc.dart';

final sl = GetIt.instance;

void setupVendorDependencies() {
  // DataSource
  sl.registerLazySingleton<VendorRemoteDataSource>(
    () => VendorRemoteDataSourceImpl(sl<SupabaseClient>()),
  );

  // Repository
  sl.registerLazySingleton<VendorRepository>(
    () => VendorRepositoryImpl(remoteDataSource: sl()),
  );

  // Use Cases
  sl.registerLazySingleton<GetVendorDashboardStatsUseCase>(
    () => GetVendorDashboardStatsUseCase(sl()),
  );

  sl.registerLazySingleton<GetVendorOrdersUseCase>(
    () => GetVendorOrdersUseCase(sl()),
  );

  sl.registerLazySingleton<ConfirmPickupUseCase>(
    () => ConfirmPickupUseCase(sl()),
  );

  sl.registerLazySingleton<UpdateShopStatusUseCase>(
    () => UpdateShopStatusUseCase(sl()),
  );

  // BLoC
  sl.registerFactory<VendorBloc>(
    () => VendorBloc(
      getDashboardStats: sl<GetVendorDashboardStatsUseCase>(),
      getActiveOrders: sl<GetVendorOrdersUseCase>(),
      confirmPickup: sl<ConfirmPickupUseCase>(),
      updateShopStatus: sl<UpdateShopStatusUseCase>(),
    ),
  );
}
