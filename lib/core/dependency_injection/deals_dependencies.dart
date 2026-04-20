import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mitho_deals/feature/deals/data/datasources/deals_remote_datasource.dart';
import 'package:mitho_deals/feature/deals/data/repositories/deals_repository_impl.dart';
import 'package:mitho_deals/feature/deals/domain/repo/deal_repository.dart';
import 'package:mitho_deals/feature/deals/domain/usecases/add_deals.dart';
import 'package:mitho_deals/feature/deals/domain/usecases/get_available_deals.dart';
import 'package:mitho_deals/feature/deals/domain/usecases/get_vendor_deals.dart';
import 'package:mitho_deals/feature/deals/presentation/bloc/deals_bloc.dart';

void setupDealsDependencies() {
  ServiceLocator.register<DealsRemoteDataSource>(
    DealsRemoteDataSourceImpl(Supabase.instance.client),
  );

  ServiceLocator.register<DealRepository>(
    DealsRepositoryImpl(ServiceLocator.get<DealsRemoteDataSource>()),
  );

  ServiceLocator.register<GetAvailableDealsUseCase>(
    GetAvailableDealsUseCase(ServiceLocator.get<DealRepository>()),
  );

  ServiceLocator.register<AddDealUseCase>(
    AddDealUseCase(ServiceLocator.get<DealRepository>()),
  );

  ServiceLocator.register<GetVendorDealsUseCase>(
    GetVendorDealsUseCase(ServiceLocator.get<DealRepository>()),
  );

  ServiceLocator.register<DealsBloc>(
    DealsBloc(
      getAvailableDealsUseCase: ServiceLocator.get<GetAvailableDealsUseCase>(),
      addDealUseCase: ServiceLocator.get<AddDealUseCase>(),
      getVendorDealsUseCase: ServiceLocator.get<GetVendorDealsUseCase>(),
      dealRepository: ServiceLocator.get<DealRepository>(),
    ),
  );
}
