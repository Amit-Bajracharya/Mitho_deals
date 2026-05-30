import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/auth/data/datasource/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/domain/usecases/register_vendor_usecase.dart';
import '../../features/auth/domain/usecases/phone_auth_usecase.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';


void setupAuthDependencies() {
  // 1. Supabase Data Source
  ServiceLocator.register<SupabaseAuthDataSource>(
    SupabaseAuthDataSourceImpl(Supabase.instance.client),
  );
  

  ServiceLocator.register<AuthRepository>(
    AuthRepositoryImpl(ServiceLocator.get<SupabaseAuthDataSource>()),
  );
  

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
