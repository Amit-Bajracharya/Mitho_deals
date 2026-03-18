import 'package:mitho_deals/feature/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/feature/deals/domain/repo/deal_repository.dart';

class AddDealUseCase{
  final DealRepository dealRepository;

  AddDealUseCase(this.dealRepository);

  Future<void> call(DealEntity deal) async {
    if(deal.availablePortions <= 0){
      throw Exception('A deal must have atleast one potion left');
    }
    if(deal.originalPrice <= deal.discountedPrice){
      throw Exception('A deal must be lower then original price');
    }
    await dealRepository.addDeal(deal);
  }
}