import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class DealDetailsTitleSection extends StatelessWidget {
  final DealEntity deal;

  const DealDetailsTitleSection({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    final savePercent = deal.originalPrice > 0
        ? (((deal.originalPrice - deal.discountedPrice) / deal.originalPrice) * 100).round()
        : 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.headline(deal.foodName, fontWeight: FontWeight.w700, color: const Color(0xFF111827)),
              SizedBox(height: 2.h),
              AppText.bodySmall(deal.vendorName, fontWeight: FontWeight.w600, color: AppTheme.primaryOrange),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF7ED),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: AppText.bodySmall(
            'Save $savePercent%',
            fontWeight: FontWeight.w700,
            color: AppTheme.primaryOrange,
          ),
        ),
      ],
    );
  }
}
