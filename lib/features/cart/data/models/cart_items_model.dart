import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mitho_deals/features/cart/domain/entity/cart_item.dart';


part 'cart_items_model.freezed.dart';
part 'cart_items_model.g.dart';

@freezed
abstract class CartItemModel with _$CartItemModel {
  const factory CartItemModel({
    required String dealId,
    required String foodName,
    required String imageUrl,
    required double discountedPrice,
    required int quantity,
    required String vendorId,
    required String vendorName,
    required DateTime pickupStartTime,
    required DateTime pickupEndTime,
  }) = _CartItemModel;

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
}


extension CartItemModelX on CartItemModel {
  CartItem toEntity() => CartItem(
        dealId: dealId,
        foodName: foodName,
        imageUrl: imageUrl,
        discountedPrice: discountedPrice,
        quantity: quantity,
        vendorId: vendorId,
        vendorName: vendorName,
        pickupStartTime: pickupStartTime,
        pickupEndTime: pickupEndTime,
      );
}

// Convert Entity to Model (for storage)
extension CartItemX on CartItem {
  CartItemModel toModel() => CartItemModel(
        dealId: dealId,
        foodName: foodName,
        imageUrl: imageUrl,
        discountedPrice: discountedPrice,
        quantity: quantity,
        vendorId: vendorId,
        vendorName: vendorName,
        pickupStartTime: pickupStartTime,
        pickupEndTime: pickupEndTime,
      );
}