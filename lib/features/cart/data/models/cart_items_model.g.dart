// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    _CartItemModel(
      dealId: json['dealId'] as String,
      foodName: json['foodName'] as String,
      imageUrl: json['imageUrl'] as String,
      discountedPrice: (json['discountedPrice'] as num).toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      vendorId: json['vendorId'] as String,
      vendorName: json['vendorName'] as String,
      pickupStartTime: DateTime.parse(json['pickupStartTime'] as String),
      pickupEndTime: DateTime.parse(json['pickupEndTime'] as String),
    );

Map<String, dynamic> _$CartItemModelToJson(_CartItemModel instance) =>
    <String, dynamic>{
      'dealId': instance.dealId,
      'foodName': instance.foodName,
      'imageUrl': instance.imageUrl,
      'discountedPrice': instance.discountedPrice,
      'quantity': instance.quantity,
      'vendorId': instance.vendorId,
      'vendorName': instance.vendorName,
      'pickupStartTime': instance.pickupStartTime.toIso8601String(),
      'pickupEndTime': instance.pickupEndTime.toIso8601String(),
    };
