import 'dart:io';
import 'package:mitho_deals/feature/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/feature/deals/domain/repo/deal_repository.dart';

class AddDealUseCase {
  final DealRepository dealRepository;

  AddDealUseCase(this.dealRepository);

  Future<void> call(DealEntity deal, File? imageFile) async {
    if (deal.availablePortions <= 0) {
      throw Exception('A deal must have at least one portion left');
    }
    if (deal.originalPrice <= deal.discountedPrice) {
      throw Exception('A deal must be lower than original price');
    }
    if (imageFile == null) {
      throw Exception('Please select an image for the deal');
    }
    await dealRepository.addDeal(deal, imageFile);
  }
}