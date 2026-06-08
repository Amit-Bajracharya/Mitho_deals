import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class VendorOrderCard extends StatelessWidget {
  final String orderId;
  final String items;
  final String customer;
  final String arrivalTime;

  const VendorOrderCard({
    super.key,
    required this.orderId,
    required this.items,
    required this.customer,
    required this.arrivalTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.body('#$orderId', fontWeight: FontWeight.w700, fontSize: 13.sp),
              Row(
                children: [
                  Icon(Icons.access_time_filled_rounded, color: Colors.orange[400], size: 14.sp),
                  SizedBox(width: 4.w),
                  AppText.body(arrivalTime, fontWeight: FontWeight.w700, fontSize: 12.sp),
                ],
              ),
            ],
          ),
          SizedBox(height: 4.h),
          AppText.bodySmall(items, color: Colors.grey[600]),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.bodySmall(customer, fontWeight: FontWeight.w500),
              AppButton(
                label: 'Details',
                variant: AppButtonVariant.text,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
