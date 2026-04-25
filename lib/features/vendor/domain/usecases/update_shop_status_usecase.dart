import 'package:dartz/dartz.dart';
import 'package:mitho_deals/features/vendor/domain/repository/vendor_repository.dart';
import '../../../../core/errors/failures.dart';


class UpdateShopStatusUseCase {
  final VendorRepository repository;
  UpdateShopStatusUseCase(this.repository);

  Future<Either<Failure, void>> call(bool isOpen) async {
    return await repository.updateShopStatus(isOpen);
  }
}
