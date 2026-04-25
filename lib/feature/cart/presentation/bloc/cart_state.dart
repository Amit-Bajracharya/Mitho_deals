import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/cart_item.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.loaded(List<CartItem> items) = _Loaded;
  const factory CartState.error(String message) = _Error;
}