import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';

part 'deals_state.freezed.dart';

@freezed
class DealsState with _$DealsState {
  const factory DealsState.initial() = _Initial;
  const factory DealsState.loading() = _Loading;
  const factory DealsState.loaded(List<DealEntity> deals) = _Loaded;
  const factory DealsState.error(String message) = _Error;

  // Add Deal states
  const factory DealsState.addingDeal() = _AddingDeal;
  const factory DealsState.addDealSuccess() = _AddDealSuccess;
  const factory DealsState.addDealError(String message) = _AddDealError;

  // Claim states
  const factory DealsState.claimedSuccess() = _ClaimedSuccess;
  const factory DealsState.claimedError(String message) = _ClaimedError;

  // Vendor deals states
  const factory DealsState.vendorDealsLoading() = _VendorDealsLoading;
  const factory DealsState.vendorDealsLoaded(List<DealEntity> deals) = _VendorDealsLoaded;
  const factory DealsState.vendorDealsError(String message) = _VendorDealsError;
}
