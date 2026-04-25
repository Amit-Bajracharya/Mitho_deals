part of 'vendor_bloc.dart';

@freezed
class VendorEvent with _$VendorEvent {
  const factory VendorEvent.loadDashboard() = LoadDashboard;
  const factory VendorEvent.refreshData() = RefreshData;
  const factory VendorEvent.fulfillOrder(String pickupCode) = FulfillOrder;
  const factory VendorEvent.updateShopStatus(bool isOpen) = UpdateShopStatus;
}
