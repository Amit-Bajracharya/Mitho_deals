import 'package:mitho_deals/feature/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/feature/deals/domain/repo/deal_repository.dart';

class GetVendorDealsUseCase{
  final DealRepository dealRepository;


GetVendorDealsUseCase(this.dealRepository);

Future<List<DealEntity>> call () async{
  return await dealRepository.getVendorDeals();
}
}