import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_stats.freezed.dart';

@freezed
abstract class VendorStats with _$VendorStats {
  const factory VendorStats({
    required double todayRevenue,
    required int totalItemsSaved,
    required int activeOrdersCount,
  }) = _VendorStats;
}
