// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DealModel _$DealModelFromJson(Map<String, dynamic> json) => _DealModel(
  id: json['id'] as String,
  vendorId: json['vendor_id'] as String,
  foodName: json['food_name'] as String,
  description: json['description'] as String,
  originalPrice: (json['original_price'] as num).toDouble(),
  discountedPrice: (json['discounted_price'] as num).toDouble(),
  availablePortions: (json['available_portions'] as num).toInt(),
  pickupStartTime: DateTime.parse(json['pickup_start_time'] as String),
  pickupEndTime: DateTime.parse(json['pickup_end_time'] as String),
  imageUrl: json['image_url'] as String? ?? '',
  isAvailable: json['is_available'] as bool? ?? true,
  vendorInfo: json['vendors'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$DealModelToJson(_DealModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vendor_id': instance.vendorId,
      'food_name': instance.foodName,
      'description': instance.description,
      'original_price': instance.originalPrice,
      'discounted_price': instance.discountedPrice,
      'available_portions': instance.availablePortions,
      'pickup_start_time': instance.pickupStartTime.toIso8601String(),
      'pickup_end_time': instance.pickupEndTime.toIso8601String(),
      'image_url': instance.imageUrl,
      'is_available': instance.isAvailable,
      'vendors': instance.vendorInfo,
    };
