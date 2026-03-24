import 'package:mitho_deals/core/errors/exceptions.dart';
import 'package:mitho_deals/feature/deals/data/datasources/deals_remote_datasource.dart';
import 'package:mitho_deals/feature/deals/data/models/deal_model.dart';
import 'package:mitho_deals/feature/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/feature/deals/domain/repo/deal_repository.dart';

class DealsRepositoryImpl implements DealRepository{
  final DealsRemoteDataSource _dataSource;

  DealsRepositoryImpl(this._dataSource);
  @override
  Future<void> addDeal(DealEntity deal) async{
      try {
        await _dataSource.addDeal(DealModel.fromEntity(deal));
      } on ServerException catch (e) {
          throw Exception(e.message);
      }
  }

  @override
  Future<void> claimDeal(String dealId, int quantity) async {
    try{
      await _dataSource.claimDeal(dealId, quantity);
    }on ServerException catch (e){
      throw Exception(e.message);
    }
  }

  @override
  Future<List<DealEntity>> getAvailableDeals() {
    // TODO: implement getAvailableDeals
    throw UnimplementedError();
  }

}