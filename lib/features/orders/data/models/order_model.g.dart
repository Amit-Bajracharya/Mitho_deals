// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  dealId: json['deal_id'] as String,
  vendorId: json['vendor_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  totalAmount: (json['total_amount'] as num).toDouble(),
  status: json['status'] as String,
  pickupCode: json['pickup_code'] as String,
  orderPlacedTime: DateTime.parse(json['order_placed_time'] as String),
  deal: json['deals'] == null
      ? null
      : DealModel.fromJson(json['deals'] as Map<String, dynamic>),
  vendorInfo: json['vendors'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'deal_id': instance.dealId,
      'vendor_id': instance.vendorId,
      'quantity': instance.quantity,
      'total_amount': instance.totalAmount,
      'status': instance.status,
      'pickup_code': instance.pickupCode,
      'order_placed_time': instance.orderPlacedTime.toIso8601String(),
      'deals': instance.deal,
      'vendors': instance.vendorInfo,
    };
