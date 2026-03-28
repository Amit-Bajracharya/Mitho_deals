// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  dealId: json['deal_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  totalPrice: (json['total_price'] as num).toDouble(),
  status: json['status'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  deal: json['deals'] == null
      ? null
      : DealModel.fromJson(json['deals'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'deal_id': instance.dealId,
      'quantity': instance.quantity,
      'total_price': instance.totalPrice,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'deals': instance.deal,
    };
