import 'package:mitho_deals/features/cart/domain/repository/cart_repository.dart';

class RemoveFromCartUseCase {
  final CartRepository repository;


  RemoveFromCartUseCase(this.repository);

  Future<void> call (String dealId) async{
      await repository.removeFromCart(dealId);
  }
}