import 'package:dartz/dartz.dart';
import 'package:mitho_deals/feature/deals/data/models/deal_model.dart';
import 'package:mitho_deals/feature/orders/data/models/order_model.dart';
import 'package:mitho_deals/feature/vendor/domain/entities/vendor_stats.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class VendorRemoteDataSource {
  Future<VendorStats> getDashboardStats();

  Future<List<OrderModel>> getActiveOrders();

  Future<void> fulfillOrder(String pickupCode);

  Future<void> updateShopStatus(bool isOpen);

  Future<void> updateLocation(double lat, double lng);

  Future<List<DealModel>> getMyDeals();


}

class VendorRemoteDataSourceImpl implements VendorRemoteDataSource{
  final SupabaseClient client;

  @override
  Future<void> fulfillOrder(String pickupCode) {
    // TODO: implement fulfillOrder
    throw UnimplementedError();
  }

  @override
  Future<List<OrderModel>> getActiveOrders() {
    // TODO: implement getActiveOrders
    throw UnimplementedError();
  }

  @override
  Future<VendorStats> getDashboardStats() {
    // TODO: implement getDashboardStats
    throw UnimplementedError();
  }

  @override
  Future<List<DealModel>> getMyDeals() {
    // TODO: implement getMyDeals
    throw UnimplementedError();
  }

  @override
  Future<void> updateLocation(double lat, double lng) {
    // TODO: implement updateLocation
    throw UnimplementedError();
  }

  @override
  Future<void> updateShopStatus(bool isOpen) {
    // TODO: implement updateShopStatus
    throw UnimplementedError();
  }

}