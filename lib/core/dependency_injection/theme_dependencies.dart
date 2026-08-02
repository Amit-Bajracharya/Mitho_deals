import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import '../../core/theme/data/repositories/theme_repository_impl.dart';
import '../../core/theme/domain/repositories/theme_repository.dart';
import '../../core/theme/presentation/bloc/theme_bloc.dart';

void setupThemeDependencies() {
  // Register Theme Repository
  ServiceLocator.register<ThemeRepository>(
    ThemeRepositoryImpl(),
  );
  
  // Register Theme Bloc
  ServiceLocator.register<ThemeBloc>(
    ThemeBloc(
      repository: ServiceLocator.get<ThemeRepository>(),
    ),
  );
}
