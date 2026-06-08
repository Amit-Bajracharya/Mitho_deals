import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mitho_deals/features/orders/domain/entity/order_entity.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class OrderCardWidget extends StatelessWidget {
  final OrderEntity order;

  const OrderCardWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final deal = order.deal;
    final isActive = order.status == 'reserved';

    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppText.body(
                  deal?.foodName ?? 'Food Deal',
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF111827),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFFFFF7ED) : Colors.grey[100],
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: AppText.caption(
                  order.status.toUpperCase(),
                  fontWeight: FontWeight.w700,
                  color: isActive ? AppTheme.primaryOrange : Colors.grey[600],
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          AppText.subtitle('From ${order.vendorName}', color: Colors.grey[500]),
          SizedBox(height: 10.h),
          const Divider(height: 1),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText.caption('Placed', color: Colors.grey),
                  AppText.caption(
                    DateFormat('MMM dd, hh:mm a').format(order.orderPlacedTime),
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const AppText.caption('Paid', color: Colors.grey),
                  AppText.body(
                    'NPR ${order.totalAmount.toStringAsFixed(0)}',
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ],
              ),
            ],
          ),
          if (isActive) ...[
            SizedBox(height: 10.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppTheme.primaryOrange.withOpacity(0.04),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppTheme.primaryOrange.withOpacity(0.1)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.qr_code_2_rounded, color: AppTheme.primaryOrange, size: 16.sp),
                  SizedBox(width: 6.w),
                  const AppText.bodySmall('Code: ', fontWeight: FontWeight.w500),
                  AppText.title(
                    order.pickupCode,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.primaryOrange,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
