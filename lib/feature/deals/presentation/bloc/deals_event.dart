part of 'deals_bloc.dart';

@freezed
class DealsEvent with _$DealsEvent {
  const factory DealsEvent.loadDeals() = LoadDeals;

  const factory DealsEvent.claimDeal({
    required String dealId,
    required int quantity,
  }) = ClaimDeal;
}
