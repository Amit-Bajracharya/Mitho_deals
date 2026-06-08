import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class OtpTitleWidget extends StatelessWidget {
  final String phoneNumber;

  const OtpTitleWidget({
    super.key,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.title('Verify OTP', fontSize: 24.sp),
        SizedBox(height: 8.h),
        AppText.body('Enter the 6-digit code sent to $phoneNumber'),
      ],
    );
  }
}
