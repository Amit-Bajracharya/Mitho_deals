import 'package:get_it/get_it.dart';
import 'package:mitho_deals/features/cart/data/datasource/cart_local_datasource.dart';
import 'package:mitho_deals/features/cart/data/repository/cart_repository_impl.dart';
import 'package:mitho_deals/features/cart/domain/usecases/update_cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/cart/domain/repository/cart_repository.dart';
import '../../features/cart/domain/usecases/add_to_cart.dart';
import '../../features/cart/domain/usecases/clear_cart.dart';
import '../../features/cart/domain/usecases/get_cart.dart';
import '../../features/cart/domain/usecases/remove_from_cart.dart';

import '../../features/cart/presentation/bloc/cart_bloc.dart';

void setupCartDependencies(SharedPreferences prefs) {
  final sl = GetIt.instance;

  // SharedPreferences - already initialized in main
  sl.registerSingleton<SharedPreferences>(prefs);

  // DataSource
  sl.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSourceImpl(sl<SharedPreferences>()),
  );

  // Repository
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(sl<CartLocalDataSource>()),
  );

  // UseCases
  sl.registerLazySingleton(() => GetCartUseCase(sl<CartRepository>()));
  sl.registerLazySingleton(() => AddToCartUseCase(sl<CartRepository>()));
  sl.registerLazySingleton(() => UpdateCartUseCase(sl<CartRepository>()));
  sl.registerLazySingleton(() => RemoveFromCartUseCase(sl<CartRepository>()));
  sl.registerLazySingleton(() => ClearCartUseCase(sl<CartRepository>()));

  // BLoC - use factory to create new instance each time
  sl.registerFactory<CartBloc>(
    () => CartBloc(
      getCart: sl<GetCartUseCase>(),
      addToCart: sl<AddToCartUseCase>(),
      updateQuantity: sl<UpdateCartUseCase>(),
      removeFromCart: sl<RemoveFromCartUseCase>(),
      clearCart: sl<ClearCartUseCase>(),
    ),
  );
}