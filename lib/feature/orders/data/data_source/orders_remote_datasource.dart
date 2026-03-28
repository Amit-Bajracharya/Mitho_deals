import 'package:mitho_deals/core/errors/exceptions.dart';
import 'package:mitho_deals/feature/orders/data/models/order_model.dart';
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
      // 1. Get the current user ID
      final userId = supabaseClient.auth.currentUser?.id;
      if (userId == null) {
        throw ServerException(message: "User not logged in");
      }

   

      final response = await supabaseClient
          .from('orders')
          .select('*, deals(*)') 
          .eq('user_id', userId)
          .order('created_at', ascending: false);

    
      return (response as List)
          .map((json) => OrderModel.fromJson(json))
          .toList();
          
    } catch (e) {
     
      throw ServerException(message: "Failed to fetch orders: $e");
    }
  }
}
