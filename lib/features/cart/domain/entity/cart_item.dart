import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';
@freezed
abstract class CartItem  with _$CartItem{
  const factory CartItem({
      required String dealId,
      required String foodName,
      required String imageUrl,
      required double discountedPrice,
      required int quantity,
      required String vendorId,
      required String vendorName,
      required DateTime pickupStartTime,
      required DateTime pickupEndTime

  }) = _CartItem;
}