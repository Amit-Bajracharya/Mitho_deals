import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class AddDealTimePicker extends StatelessWidget {
  final String label;
  final DateTime? time;
  final VoidCallback onTap;

  const AddDealTimePicker({
    super.key,
    required this.label,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.caption(label, color: Colors.grey),
            SizedBox(height: 4.h),
            AppText.title(
              time != null ? DateFormat('MMM d, h:mm a').format(time!) : 'Select',
              fontSize: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}
