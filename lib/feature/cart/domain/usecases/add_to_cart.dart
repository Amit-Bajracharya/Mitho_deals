import 'package:mitho_deals/feature/cart/domain/entity/cart_item.dart';
import 'package:mitho_deals/feature/cart/domain/repository/cart_repository.dart';

class AddToCartUseCase {
    final CartRepository repository;

    AddToCartUseCase(this.repository);

    Future<void> call(CartItem item) async{
        await repository.addToCart(item);
    }
}