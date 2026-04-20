import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mitho_deals/feature/deals/domain/entitiy/deal_entity.dart';

part 'deals_event.freezed.dart';

@freezed
class DealsEvent with _$DealsEvent {
  const factory DealsEvent.loadDeals() = LoadDeals;

  const factory DealsEvent.addDeal({
    required DealEntity deal,
    required File? imageFile,
  }) = AddDeal;

  const factory DealsEvent.claimDeal({
    required String dealId,
    required int quantity,
  }) = ClaimDeal;

  const factory DealsEvent.loadVendorDeals() = LoadVendorDeals;
}
