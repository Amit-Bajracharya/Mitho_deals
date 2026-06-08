import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class VendorReviewCard extends StatelessWidget {
  const VendorReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: List.generate(5, (i) => Icon(Icons.star_rounded, color: Colors.amber, size: 14.sp))),
          SizedBox(height: 8.h),
          const AppText.bodySmall('"Delicious deals!"', fontStyle: FontStyle.italic),
          SizedBox(height: 4.h),
          AppText.caption('- ROHAN', fontWeight: FontWeight.w700, color: Colors.grey),
        ],
      ),
    );
  }
}
