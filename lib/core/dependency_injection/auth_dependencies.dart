import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../feature/auth/data/source/auth_remote_datasource.dart';
import '../../feature/auth/data/repositories/auth_repository_impl.dart';
import '../../feature/auth/domain/repositories/auth_repository.dart';
import '../../feature/auth/domain/usecases/login_usecase.dart';
import '../../feature/auth/domain/usecases/register_usecase.dart';
import '../../feature/auth/domain/usecases/register_vendor_usecase.dart';
import '../../feature/auth/domain/usecases/phone_auth_usecase.dart';
import '../../feature/auth/presentation/bloc/auth_bloc.dart';

/// Setup all auth dependencies in Service Locator
void setupAuthDependencies() {
  // 1. Supabase Data Source
  ServiceLocator.register<SupabaseAuthDataSource>(
    SupabaseAuthDataSourceImpl(Supabase.instance.client),
  );
  
  // 2. Repository (depends on data source)
  ServiceLocator.register<AuthRepository>(
    AuthRepositoryImpl(ServiceLocator.get<SupabaseAuthDataSource>()),
  );
  
  // 3. Use Cases (depend on repository)
  ServiceLocator.register<LoginUseCase>(
    LoginUseCase(ServiceLocator.get<AuthRepository>()),
  );
  
  ServiceLocator.register<RegisterUseCase>(
    RegisterUseCase(ServiceLocator.get<AuthRepository>()),
  );

  ServiceLocator.register<RegisterVendorUseCase>(
    RegisterVendorUseCase(ServiceLocator.get<AuthRepository>()),
  );
  
  ServiceLocator.register<PhoneAuthUseCase>(
    PhoneAuthUseCase(ServiceLocator.get<AuthRepository>()),
  );
  
  // 4. BLoC (depends on all use cases)
  ServiceLocator.register<AuthBloc>(
    AuthBloc(
      repository: ServiceLocator.get<AuthRepository>(),
      loginUseCase: ServiceLocator.get<LoginUseCase>(),
      registerUseCase: ServiceLocator.get<RegisterUseCase>(),
      registerVendorUseCase: ServiceLocator.get<RegisterVendorUseCase>(),
      phoneAuthUseCase: ServiceLocator.get<PhoneAuthUseCase>(),
    ),
  );
}
