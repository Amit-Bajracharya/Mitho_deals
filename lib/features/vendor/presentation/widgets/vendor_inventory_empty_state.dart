import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class VendorInventoryEmptyState extends StatelessWidget {
  const VendorInventoryEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 64.sp, color: Colors.grey),
          SizedBox(height: 16.h),
          AppText.title('No deals yet', fontSize: 18.sp, color: Colors.grey),
          SizedBox(height: 8.h),
          AppText.body('Tap + to add your first deal', color: Colors.grey[600]),
        ],
      ),
    );
  }
}
