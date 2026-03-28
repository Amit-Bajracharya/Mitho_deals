import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mitho_deals/feature/deals/domain/entitiy/deal_entity.dart';

part 'deal_model.freezed.dart';
part 'deal_model.g.dart';

@freezed
abstract class DealModel with _$DealModel {
  const DealModel._(); // needed to add custom methods below

  const factory DealModel({
    required String id,
    @JsonKey(name: 'vendor_id') required String vendorId,
    @JsonKey(name: 'food_name') required String foodName,
    required String description,
    @JsonKey(name: 'original_price') required double originalPrice,
    @JsonKey(name: 'discounted_price') required double discountedPrice,
    @JsonKey(name: 'available_portions') required int availablePortions,
    @JsonKey(name: 'pickup_start_time') required DateTime pickupStartTime,
    @JsonKey(name: 'pickup_end_time') required DateTime pickupEndTime,
    @JsonKey(name: 'image_url') @Default('') String imageUrl,
    @JsonKey(name: 'is_available') @Default(true) bool isAvailable,
    
    // Joined vendor info from Supabase: .select('*, vendors(*)')
    @JsonKey(name: 'vendors') Map<String, dynamic>? vendorInfo,
  }) = _DealModel;

  factory DealModel.fromJson(Map<String, dynamic> json) =>
      _$DealModelFromJson(json);

  // Data → Domain (used by repository)
  DealEntity toEntity() {
    return DealEntity(
      id: id,
      vendorId: vendorId,
      foodName: foodName,
      description: description,
      originalPrice: originalPrice,
      discountedPrice: discountedPrice,
      availablePortions: availablePortions,
      pickupStartTime: pickupStartTime,
      pickupEndTime: pickupEndTime,
      imageUrl: imageUrl,
      isAvailable: isAvailable,
      vendorName: vendorInfo?['name'] ?? 'Restaurant',
      vendorAddress: vendorInfo?['address'] ?? 'Thamel, Kathmandu',
      latitude: (vendorInfo?['latitude'] as num?)?.toDouble() ?? 27.7172,
      longitude: (vendorInfo?['longitude'] as num?)?.toDouble() ?? 85.3240,
    );
  }

  // Domain → Data (used when posting a deal)
  factory DealModel.fromEntity(DealEntity entity) {
    return DealModel(
      id: entity.id,
      vendorId: entity.vendorId,
      foodName: entity.foodName,
      description: entity.description,
      originalPrice: entity.originalPrice,
      discountedPrice: entity.discountedPrice,
      availablePortions: entity.availablePortions,
      pickupStartTime: entity.pickupStartTime,
      pickupEndTime: entity.pickupEndTime,
      imageUrl: entity.imageUrl,
      isAvailable: entity.isAvailable,
      vendorInfo: {
        'name': entity.vendorName,
        'address': entity.vendorAddress,
        'latitude': entity.latitude,
        'longitude': entity.longitude,
      },
    );
  }
}
