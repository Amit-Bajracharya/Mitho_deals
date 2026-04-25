import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../orders/domain/entity/order_entity.dart';
import '../../../deals/domain/entitiy/deal_entity.dart';
import '../entities/vendor_stats.dart';

abstract class VendorRepository {
  Future<Either<Failure, VendorStats>> getDashboardStats();
  Future<Either<Failure, List<OrderEntity>>> getActiveOrders();
  Future<Either<Failure, void>> fulfillOrder(String pickupCode);
  Future<Either<Failure, void>> updateShopStatus(bool isOpen);
  Future<Either<Failure, void>> updateLocation(double lat, double lng);
  Future<Either<Failure, List<DealEntity>>> getMyDeals();
  Future<Either<Failure, Map<String, dynamic>>> getCurrentVendorProfile();
}
