import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_items_model.dart';

abstract class CartLocalDataSource {
  Future<List<CartItemModel>> getCart();
  Future<void> saveCart(List<CartItemModel> items);
  Future<void> clearCart();
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final SharedPreferences _prefs;
  static const String _cartKey = 'CART_ITEMS';

  CartLocalDataSourceImpl(this._prefs);

  @override
  Future<List<CartItemModel>> getCart() async {
    final String? cartJson = _prefs.getString(_cartKey);
    
    if (cartJson == null || cartJson.isEmpty) {
      return [];
    }

    final List<dynamic> jsonList = jsonDecode(cartJson);
    return jsonList
        .map((json) => CartItemModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> saveCart(List<CartItemModel> items) async {
    final List<Map<String, dynamic>> jsonList = 
        items.map((item) => item.toJson()).toList();
    final String cartJson = jsonEncode(jsonList);
    await _prefs.setString(_cartKey, cartJson);
  }

  @override
  Future<void> clearCart() async {
    await _prefs.remove(_cartKey);
  }
}