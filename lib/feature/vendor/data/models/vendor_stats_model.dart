import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/vendor_stats.dart';

part 'vendor_stats_model.freezed.dart';
part 'vendor_stats_model.g.dart';

@freezed
abstract class VendorStatsModel with _$VendorStatsModel {
  const factory VendorStatsModel({
    required double todayRevenue,
    required int totalItemsSaved,
    required int activeOrdersCount,
  }) = _VendorStatsModel;

  factory VendorStatsModel.fromJson(Map<String, dynamic> json) =>
      _$VendorStatsModelFromJson(json);
}

extension VendorStatsModelExtension on VendorStatsModel {
  VendorStats toDomain() {
    return VendorStats(
      todayRevenue: todayRevenue,
      totalItemsSaved: totalItemsSaved,
      activeOrdersCount: activeOrdersCount,
    );
  }
}
