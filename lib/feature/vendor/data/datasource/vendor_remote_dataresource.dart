// lib/feature/vendor/data/datasources/vendor_remote_datasource.dart

import 'package:mitho_deals/feature/deals/data/models/deal_model.dart';
import 'package:mitho_deals/feature/orders/data/models/order_model.dart';
import 'package:mitho_deals/feature/vendor/data/models/vendor_stats_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/errors/exceptions.dart';


abstract class VendorRemoteDataSource {
  Future<VendorStats> getDashboardStats();
  Future<List<OrderModel>> getActiveOrders();
  Future<void> fulfillOrder(String pickupCode);
  Future<void> updateShopStatus(bool isOpen);
  Future<void> updateLocation(double lat, double lng);
  Future<List<DealModel>> getMyDeals();
  Future<Map<String, dynamic>> getCurrentVendorProfile();
}

class VendorRemoteDataSourceImpl implements VendorRemoteDataSource {
  final SupabaseClient supabaseClient;

  VendorRemoteDataSourceImpl(this.supabaseClient);

  String? get _currentUserId => supabaseClient.auth.currentUser?.id;

  Future<String> _getVendorId() async {
    final userId = _currentUserId;
    if (userId == null) {
      throw const ServerException(message: 'User not logged in');
    }

    final response = await supabaseClient
        .from('vendors')
        .select('id')
        .eq('owner_id', userId)
        .single();

    return response['id'] as String;
  }

  @override
  Future<VendorStatsModel> getDashboardStats() async {
    try {
      final vendorId = await _getVendorId();

      final today = DateTime.now();
      final startOfDay = DateTime(today.year, today.month, today.day).toIso8601String();

      final ordersResponse = await supabaseClient
          .from('orders')
          .select('total_amount, quantity')
          .eq('vendor_id', vendorId)
          .eq('status', 'picked_up')
          .gte('order_placed_time', startOfDay);

      double todayRevenue = 0;
      int totalItemsSaved = 0;

      for (final order in ordersResponse as List) {
        todayRevenue += (order['total_amount'] as num).toDouble();
        totalItemsSaved += (order['quantity'] as int);
      }

      // Fixed: use .count() instead of CountOption inside select()
      final activeResponse = await supabaseClient
          .from('orders')
          .select()
          .eq('vendor_id', vendorId)
          .eq('status', 'reserved')
          .count(CountOption.exact);

      final activeOrdersCount = activeResponse.count ?? 0;

      return VendorStatsModel(
        todayRevenue: todayRevenue,
        totalItemsSaved: totalItemsSaved,
        activeOrdersCount: activeOrdersCount,
      );
    } catch (e) {
      throw ServerException(message: 'Failed to load dashboard stats: $e');
    }
  }

  @override
  Future<List<OrderModel>> getActiveOrders() async {
    try {
      final vendorId = await _getVendorId();

      final response = await supabaseClient
          .from('orders')
          .select('*, deals(*), users:user_id(*)')
          .eq('vendor_id', vendorId)
          .eq('status', 'reserved')
          .order('order_placed_time', ascending: false);

      return (response as List)
          .map((json) => OrderModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException(message: 'Failed to fetch active orders: $e');
    }
  }

  @override
  Future<void> fulfillOrder(String pickupCode) async {
    try {
      final vendorId = await _getVendorId();

      final response = await supabaseClient
          .from('orders')
          .select('id, vendor_id, status')
          .eq('pickup_code', pickupCode)
          .single();

      if (response['vendor_id'] != vendorId) {
        throw const ServerException(message: 'Invalid pickup code for this vendor');
      }

      if (response['status'] != 'reserved') {
        throw const ServerException(message: 'Order is not in reserved status');
      }

      await supabaseClient
          .from('orders')
          .update({'status': 'picked_up'})
          .eq('id', response['id']);
    } catch (e) {
      throw ServerException(message: 'Failed to fulfill order: $e');
    }
  }

  @override
  Future<void> updateShopStatus(bool isOpen) async {
    try {
      final vendorId = await _getVendorId();

      await supabaseClient
          .from('vendors')
          .update({'is_open': isOpen})
          .eq('id', vendorId);
    } catch (e) {
      throw ServerException(message: 'Failed to update shop status: $e');
    }
  }

  @override
  Future<void> updateLocation(double lat, double lng) async {
    try {
      final vendorId = await _getVendorId();

      await supabaseClient
          .from('vendors')
          .update({
            'latitude': lat,
            'longitude': lng,
          })
          .eq('id', vendorId);
    } catch (e) {
      throw ServerException(message: 'Failed to update location: $e');
    }
  }

  @override
  Future<List<DealModel>> getMyDeals() async {
    try {
      final vendorId = await _getVendorId();

      final response = await supabaseClient
          .from('deals')
          .select('*, vendors(*)')
          .eq('vendor_id', vendorId)
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => DealModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException(message: 'Failed to fetch your deals: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> getCurrentVendorProfile() async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        throw const ServerException(message: 'User not logged in');
      }

      final response = await supabaseClient
          .from('vendors')
          .select('id, business_name, address, latitude, longitude')
          .eq('owner_id', userId)
          .single();

      return response;
    } catch (e) {
      throw ServerException(message: 'Failed to fetch vendor profile: $e');
    }
  }
}