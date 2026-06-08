import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class OrdersEmptyState extends StatelessWidget {
  const OrdersEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long_outlined, size: 40.sp, color: Colors.grey[300]),
          SizedBox(height: 12.h),
          AppText.body('No orders yet', fontWeight: FontWeight.w600, color: Colors.grey),
          SizedBox(height: 4.h),
          const AppText.subtitle('Find deals and they will show up here!'),
        ],
      ),
    );
  }
}
