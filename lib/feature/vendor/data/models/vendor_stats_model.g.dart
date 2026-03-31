// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VendorStatsModel _$VendorStatsModelFromJson(Map<String, dynamic> json) =>
    _VendorStatsModel(
      todayRevenue: (json['todayRevenue'] as num).toDouble(),
      totalItemsSaved: (json['totalItemsSaved'] as num).toInt(),
      activeOrdersCount: (json['activeOrdersCount'] as num).toInt(),
    );

Map<String, dynamic> _$VendorStatsModelToJson(_VendorStatsModel instance) =>
    <String, dynamic>{
      'todayRevenue': instance.todayRevenue,
      'totalItemsSaved': instance.totalItemsSaved,
      'activeOrdersCount': instance.activeOrdersCount,
    };
