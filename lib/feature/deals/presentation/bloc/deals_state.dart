part of 'deals_bloc.dart';

@freezed
class DealsState with _$DealsState {
  const factory DealsState.initial() = _Initial;
  const factory DealsState.loading() = _Loading;
  const factory DealsState.loaded(List<DealEntity> deals) =  _Loaded;

  const factory DealsState.error(String message) = _Error;
  const factory DealsState.claimedSuccess() = _ClaimedSuccess;
  const factory DealsState.claimedError(String message) = _ClaimedError;
}
