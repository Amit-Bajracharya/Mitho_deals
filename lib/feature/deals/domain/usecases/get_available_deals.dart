import 'package:mitho_deals/feature/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/feature/deals/domain/repo/deal_repository.dart';

class GetAvailableDealsUseCase{
  final DealRepository repository;

  GetAvailableDealsUseCase(this.repository);

  Future<List<DealEntity>> call() async{
    return await repository.getAvailableDeals();
  }
}