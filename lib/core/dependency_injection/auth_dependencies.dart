import 'package:mitho_deals/core/dependency_injection/service_locator.dart';


import '../../feature/auth/data/source/firebase_auth.dart';
import '../../feature/auth/data/repositories/auth_repository_impl.dart';
import '../../feature/auth/domain/repositories/auth_repository.dart';
import '../../feature/auth/domain/usecases/login_usecase.dart';
import '../../feature/auth/domain/usecases/register_usecase.dart';
import '../../feature/auth/domain/usecases/phone_auth_usecase.dart';
import '../../feature/auth/presentation/bloc/auth_bloc.dart';

/// Setup all auth dependencies in Service Locator
void setupAuthDependencies() {
  // 1. Firebase Data Source
  ServiceLocator.register<FirebaseAuthDataSource>(
    FirebaseAuthDataSource(),
  );
  
  // 2. Repository (depends on data source)
  ServiceLocator.register<AuthRepository>(
    AuthRepositoryImpl(ServiceLocator.get<FirebaseAuthDataSource>()),
  );
  
  // 3. Use Cases (depend on repository)
  ServiceLocator.register<LoginUseCase>(
    LoginUseCase(ServiceLocator.get<AuthRepository>()),
  );
  
  ServiceLocator.register<RegisterUseCase>(
    RegisterUseCase(ServiceLocator.get<AuthRepository>()),
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
      phoneAuthUseCase: ServiceLocator.get<PhoneAuthUseCase>(),
    ),
  );
}