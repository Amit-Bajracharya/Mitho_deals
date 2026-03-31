part of 'vendor_bloc.dart';

@freezed
class VendorState with _$VendorState {
  const factory VendorState.initial() = Initial;
  const factory VendorState.loading() = Loading;
  const factory VendorState.loaded({
    required VendorStats stats,
    required List<OrderEntity> orders,
  }) = Loaded;
  const factory VendorState.error(String message) = Error;
}
