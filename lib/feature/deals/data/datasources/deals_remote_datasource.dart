import 'package:mitho_deals/core/errors/exceptions.dart';
import 'package:mitho_deals/feature/deals/data/models/deal_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class DealsRemoteDataSource {
  Future<List<DealModel>> getAvailableDeals();
  Future<void> addDeal(DealModel deal);
  Future<void> claimDeal(String dealId, int quantity);
}

class DealsRemoteDataSourceImpl implements DealsRemoteDataSource {
  final SupabaseClient supabaseClient;
  DealsRemoteDataSourceImpl(this.supabaseClient);
  @override
  Future<void> addDeal(DealModel deal) async {
    // TODO: implement addDeal
    try {
      await supabaseClient.from('deals').insert(deal.toString());
    } catch (e) {
      throw ServerException(message: "Failed to add deal : $e");
    }
  }

  @override
  Future<void> claimDeal(String dealId, int quantity) async {
    try {
      final user = supabaseClient.auth.currentUser;
      if (user == null) {
        throw const ServerException(message: 'User must be logged in to claim a deal');
      }

      // 1. Fetch deal details for order creation
      final dealResponse = await supabaseClient
          .from('deals')
          .select('available_portions, vendor_id, discounted_price')
          .eq('id', dealId)
          .single();

      final current = dealResponse['available_portions'] as int;
      final vendorId = dealResponse['vendor_id'] as String;
      final discountedPrice = (dealResponse['discounted_price'] as num).toDouble();

      if (current < quantity) {
        throw ServerException(message: "Not enough portions available");
      }

      // 2. Transact: Update stock AND Create order
      // We use a manual sequence as client-side transactions are best handled via RPC if needed,
      // but simple sequential tasks work for MVP.
      
      // Update portions
      await supabaseClient
          .from('deals')
          .update({
            'available_portions': current - quantity,
            'is_available': (current - quantity) > 0,
          })
          .eq('id', dealId);

      // Create Order
      final String pickupCode = 'M-${(DateTime.now().millisecondsSinceEpoch % 10000).toString().padLeft(4, '0')}';
      
      await supabaseClient.from('orders').insert({
        'user_id': user.id,
        'deal_id': dealId,
        'vendor_id': vendorId,
        'quantity': quantity,
        'total_amount': discountedPrice * quantity,
        'status': 'reserved',
        'pickup_code': pickupCode,
        'order_placed_time': DateTime.now().toIso8601String(),
      });

    } catch (e) {
      throw ServerException(message: "Failed to claim the deal: $e");
    }
  }

  @override
  Future<List<DealModel>> getAvailableDeals() async {
    // TODO: implement getAvailableDeals

    try {
      final response = await supabaseClient
          .from('deals')
          .select('*, vendors(*)')
          .eq('is_available', true)
          .order('pickup_start_time', ascending: true);
      return (response as List)
          .map((json) => DealModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException(message: "Failed to featch deal");
    }
  }
}
