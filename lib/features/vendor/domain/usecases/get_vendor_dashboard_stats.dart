import 'package:dartz/dartz.dart';
import 'package:mitho_deals/features/vendor/domain/repository/vendor_repository.dart';
import '../../../../core/errors/failures.dart';
import '../entities/vendor_stats.dart';


class GetVendorDashboardStatsUseCase {
  final VendorRepository repository;
  GetVendorDashboardStatsUseCase(this.repository);

  Future<Either<Failure, VendorStats>> call() async {
    return await repository.getDashboardStats();
  }
}
