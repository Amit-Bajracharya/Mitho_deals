import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../orders/domain/entity/order_entity.dart';
import '../../../deals/domain/entitiy/deal_entity.dart'; // Note: check if yours is 'entitiy' or 'entity'
import '../entities/vendor_stats.dart';

abstract class VendorRepository {
  /// Fetches real-time dashboard stats (Revenue, Items Saved, active counts)
  Future<Either<Failure, VendorStats>> getDashboardStats();

  /// Fetches all active/pending reservations for this restaurant
  Future<Either<Failure, List<OrderEntity>>> getActiveOrders();

  /// Confirms that a customer has picked up their food using the pickup code
  Future<Either<Failure, void>> fulfillOrder(String pickupCode);

  /// Toggles the 'is_open' status for the vendor
  Future<Either<Failure, void>> updateShopStatus(bool isOpen);

  /// Updates the GPS coordinates for the restaurant storefront
  Future<Either<Failure, void>> updateLocation(double lat, double lng);

  /// Fetches all deals created by this specific vendor (active or expired)
  Future<Either<Failure, List<DealEntity>>> getMyDeals();
}
