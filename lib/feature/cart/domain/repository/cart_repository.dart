import '../entity/cart_item.dart';

abstract class CartRepository {
  Future<List<CartItem>> getCart();
  Future<void> addToCart(CartItem item);
  Future<void> updateQuantity(String dealId, int quantity);
  Future<void> removeFromCart(String dealId);
  Future<void> clearCart();
}