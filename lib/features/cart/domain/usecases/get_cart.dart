import 'package:mitho_deals/features/cart/domain/entity/cart_item.dart';
import 'package:mitho_deals/features/cart/domain/repository/cart_repository.dart';

class GetCartUseCase {
  final CartRepository repository;

  GetCartUseCase(this.repository);

  Future<List<CartItem>> call() async{
    return await repository.getCart();
  }
}