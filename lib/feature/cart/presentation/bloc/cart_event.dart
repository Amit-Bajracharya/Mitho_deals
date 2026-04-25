import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entity/cart_item.dart';

part 'cart_event.freezed.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.loadCart() = LoadCart;
  const factory CartEvent.addToCart(CartItem item) = AddToCart;
  const factory CartEvent.updateQuantity(String dealId, int quantity) = UpdateQuantity;
  const factory CartEvent.removeFromCart(String dealId) = RemoveFromCart;
  const factory CartEvent.clearCart() = ClearCart;
}