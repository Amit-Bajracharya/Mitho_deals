import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class DealsAppBar extends StatelessWidget {
  const DealsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.restaurant, color: AppTheme.primaryOrange, size: 20.sp),
              SizedBox(width: 6.w),
              AppText.headline('Mitho Deals', fontWeight: FontWeight.w700, color: const Color(0xFF1F2937)),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => context.push('/cart'),
                child: Icon(Icons.shopping_cart_outlined, color: const Color(0xFF1F2937), size: 20.sp),
              ),
              SizedBox(width: 12.w),
              Icon(Icons.notifications_none_outlined, color: const Color(0xFF1F2937), size: 20.sp),
            ],
          ),
        ],
      ),
    );
  }
}
