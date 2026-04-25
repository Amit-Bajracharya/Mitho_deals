import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitho_deals/features/cart/domain/usecases/update_cart.dart';
import '../../domain/usecases/add_to_cart.dart';
import '../../domain/usecases/clear_cart.dart';
import '../../domain/usecases/get_cart.dart';
import '../../domain/usecases/remove_from_cart.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartUseCase _getCart;
  final AddToCartUseCase _addToCart;
  final UpdateCartUseCase _updateQuantity;
  final RemoveFromCartUseCase _removeFromCart;
  final ClearCartUseCase _clearCart;

  CartBloc({
    required GetCartUseCase getCart,
    required AddToCartUseCase addToCart,
    required UpdateCartUseCase updateQuantity,
    required RemoveFromCartUseCase removeFromCart,
    required ClearCartUseCase clearCart,
  })  : _getCart = getCart,
        _addToCart = addToCart,
        _updateQuantity = updateQuantity,
        _removeFromCart = removeFromCart,
        _clearCart = clearCart,
        super(const CartState.initial()) {
    on<LoadCart>(_onLoadCart);
    on<AddToCart>(_onAddToCart);
    on<UpdateQuantity>(_onUpdateQuantity);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<ClearCart>(_onClearCart);
  }

  Future<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(const CartState.loading());
    try {
      final items = await _getCart();
      emit(CartState.loaded(items));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  Future<void> _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    try {
      await _addToCart(event.item);
      final items = await _getCart();
      emit(CartState.loaded(items));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  Future<void> _onUpdateQuantity(UpdateQuantity event, Emitter<CartState> emit) async {
    try {
      await _updateQuantity(event.dealId, event.quantity);
      final items = await _getCart();
      emit(CartState.loaded(items));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  Future<void> _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) async {
    try {
      await _removeFromCart(event.dealId);
      final items = await _getCart();
      emit(CartState.loaded(items));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  Future<void> _onClearCart(ClearCart event, Emitter<CartState> emit) async {
    try {
      await _clearCart();
      emit(const CartState.loaded([]));
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }
}