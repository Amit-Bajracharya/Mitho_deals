import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class DealDetailsTimerSection extends StatelessWidget {
  final Duration timeLeft;

  const DealDetailsTimerSection({super.key, required this.timeLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.timer_outlined, color: AppTheme.primaryOrange, size: 16.sp),
              SizedBox(width: 6.w),
              AppText.bodySmall(
                'LIMITED TIME LEFT',
                fontWeight: FontWeight.w700,
                color: AppTheme.primaryOrange,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _TimeUnit(value: timeLeft.inHours.toString().padLeft(2, '0'), label: 'HOURS'),
              _TimeUnit(value: (timeLeft.inMinutes % 60).toString().padLeft(2, '0'), label: 'MINS'),
              _TimeUnit(value: (timeLeft.inSeconds % 60).toString().padLeft(2, '0'), label: 'SECS'),
            ],
          ),
        ],
      ),
    );
  }
}

class _TimeUnit extends StatelessWidget {
  final String value;
  final String label;

  const _TimeUnit({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60.w,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: AppTheme.primaryOrange,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: AppText.title(value, fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(height: 6.h),
        AppText.caption(label, fontWeight: FontWeight.w600, color: const Color(0xFF9CA3AF)),
      ],
    );
  }
}
