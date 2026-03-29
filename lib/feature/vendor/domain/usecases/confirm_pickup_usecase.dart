import 'package:dartz/dartz.dart';
import 'package:mitho_deals/feature/vendor/domain/repository/vendor_repository.dart';
import '../../../../core/errors/failures.dart';


class ConfirmPickupUseCase {
  final VendorRepository repository;
  ConfirmPickupUseCase(this.repository);

  Future<Either<Failure, void>> call(String pickupCode) async {
    return await repository.fulfillOrder(pickupCode);
  }
}
