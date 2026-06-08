import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class DealDetailsPickupSection extends StatelessWidget {
  final DealEntity deal;

  const DealDetailsPickupSection({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    final startTime = DateFormat('hh:mm a').format(deal.pickupStartTime);
    final endTime = DateFormat('hh:mm a').format(deal.pickupEndTime);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText.title('Pickup Window', fontWeight: FontWeight.w700, color: Color(0xFF111827)),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7ED),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(Icons.access_time_filled, color: AppTheme.primaryOrange, size: 18.sp),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.bodySmall(
                      'Today, $startTime – $endTime',
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF111827),
                    ),
                    const AppText.subtitle('Arrive within this time window'),
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
