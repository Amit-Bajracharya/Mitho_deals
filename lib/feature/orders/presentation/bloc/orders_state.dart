import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mitho_deals/feature/orders/domain/entity/order_entity.dart';

part 'orders_state.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = Initial;
  const factory OrdersState.loading() = Loading;
  const factory OrdersState.loaded(List<OrderEntity> orders) = Loaded;
  const factory OrdersState.error(String message) = Error;
}
