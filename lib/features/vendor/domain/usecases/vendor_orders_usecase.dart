import 'package:dartz/dartz.dart';
import 'package:mitho_deals/features/vendor/domain/repository/vendor_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../orders/domain/entity/order_entity.dart';


class GetVendorOrdersUseCase {
  final VendorRepository repository;
  GetVendorOrdersUseCase(this.repository);

  Future<Either<Failure, List<OrderEntity>>> call() async {
    return await repository.getActiveOrders();
  }
}
