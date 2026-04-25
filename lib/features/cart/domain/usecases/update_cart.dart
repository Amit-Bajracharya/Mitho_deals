import 'package:mitho_deals/features/cart/domain/repository/cart_repository.dart';

class UpdateCartUseCase {
  final CartRepository repository;

  UpdateCartUseCase(this.repository);

  Future<void> call(String dealId, int quantity) async{
    await repository.updateQuantity(dealId, quantity);
  }
}