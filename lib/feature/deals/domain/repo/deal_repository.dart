import 'dart:io';
import 'package:mitho_deals/feature/deals/domain/entitiy/deal_entity.dart';

abstract class DealRepository {
  Future<List<DealEntity>> getAvailableDeals();
  Future<void> addDeal(DealEntity deal, File imageFile);
  Future<void> claimDeal(String dealId, int quantity); 
  Future<List<DealEntity>> getVendorDeals();
}

/* 
Think of it as a contract or menu. 
Our app says: "I need to be able to get nearby deals, post a new deal, and buy a deal."
 The Domain Layer only writes down those demands, but it does not care how they are fulfilled. 
 */