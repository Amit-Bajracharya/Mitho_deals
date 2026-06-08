import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class DealDetailsLocationSection extends StatelessWidget {
  final DealEntity deal;

  const DealDetailsLocationSection({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AppText.title('Location', fontWeight: FontWeight.w700, color: Color(0xFF111827)),
            AppButton(
              label: 'Get Directions',
              variant: AppButtonVariant.text,
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Container(
          height: 140.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            image: const DecorationImage(
              image: NetworkImage(
                'https://maps.googleapis.com/maps/api/staticmap?center=27.7172,85.3240&zoom=15&size=600x300&markers=color:orange%7C27.7172,85.3240&key=',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(8.w),
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: AppTheme.primaryOrange, size: 16.sp),
                    SizedBox(width: 6.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.bodySmall(
                            deal.vendorAddress,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF111827),
                          ),
                          const AppText.caption('2.4 km away', color: Color(0xFF6B7280)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
