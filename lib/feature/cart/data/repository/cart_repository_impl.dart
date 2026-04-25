import 'package:mitho_deals/feature/cart/data/datasource/cart_local_datasource.dart';

import '../../domain/entity/cart_item.dart';
import '../../domain/repository/cart_repository.dart';
import '../models/cart_items_model.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource _localDataSource;

  CartRepositoryImpl(this._localDataSource);

  @override
  Future<List<CartItem>> getCart() async {
    final models = await _localDataSource.getCart();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> addToCart(CartItem item) async {
    final currentCart = await _localDataSource.getCart();
    
    // Check if item already exists
    final existingIndex = currentCart.indexWhere(
      (model) => model.dealId == item.dealId,
    );
    
    if (existingIndex >= 0) {
      // Update quantity if exists
      currentCart[existingIndex] = currentCart[existingIndex].copyWith(
        quantity: currentCart[existingIndex].quantity + item.quantity,
      );
    } else {
      // Add new item
      currentCart.add(item.toModel());
    }
    
    await _localDataSource.saveCart(currentCart);
  }

  @override
  Future<void> updateQuantity(String dealId, int quantity) async {
    final currentCart = await _localDataSource.getCart();
    
    final index = currentCart.indexWhere((model) => model.dealId == dealId);
    if (index >= 0) {
      currentCart[index] = currentCart[index].copyWith(quantity: quantity);
      await _localDataSource.saveCart(currentCart);
    }
  }

  @override
  Future<void> removeFromCart(String dealId) async {
    final currentCart = await _localDataSource.getCart();
    currentCart.removeWhere((model) => model.dealId == dealId);
    await _localDataSource.saveCart(currentCart);
  }

  @override
  Future<void> clearCart() async {
    await _localDataSource.clearCart();
  }
}