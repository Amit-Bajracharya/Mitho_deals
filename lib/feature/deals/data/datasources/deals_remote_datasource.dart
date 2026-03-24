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
      final response = await supabaseClient
          .from('deals')
          .select('available_portions')
          .eq('id', dealId)
          .single();
      final current = response['available_potions'] as int;
      if (current < quantity) {
        throw ServerException(message: "Not enough portion available");
      }
      await supabaseClient
          .from('deals')
          .update({
            'available_portions': current - quantity,
            'is_available': (current - quantity) > 0,
          })
          .eq('id', dealId);
    } catch (e) {
      throw ServerException(message: "Failed to claim the deal");
    }
  }

  @override
  Future<List<DealModel>> getAvailableDeals() async {
    // TODO: implement getAvailableDeals

    try {
      final response = await supabaseClient
          .from('deals')
          .select()
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
