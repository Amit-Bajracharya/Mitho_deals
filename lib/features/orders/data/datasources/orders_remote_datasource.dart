import 'package:mitho_deals/core/errors/exceptions.dart';
import 'package:mitho_deals/features/orders/data/models/order_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderModel>> getMyOrders();
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final SupabaseClient supabaseClient;

  OrdersRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<OrderModel>> getMyOrders() async {
    try {
      final user = supabaseClient.auth.currentUser;
      if (user == null) {
        throw const ServerException(message: 'User must be logged in to fetch orders');
      }

      // We join with 'deals' table to get food details
      final response = await supabaseClient
          .from('orders')
          .select('*, deals(*), vendors(name)')
          .eq('user_id', user.id)
          .order('order_placed_time', ascending: false);

      return (response as List)
          .map((json) => OrderModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException(message: 'Failed to fetch orders: $e');
    }
  }
}
