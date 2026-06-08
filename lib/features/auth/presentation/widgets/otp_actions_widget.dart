import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class OtpActionsWidget extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onVerify;
  final VoidCallback onResend;
  final VoidCallback onChangePhone;

  const OtpActionsWidget({
    super.key,
    required this.isLoading,
    required this.onVerify,
    required this.onResend,
    required this.onChangePhone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          label: 'Verify OTP',
          isLoading: isLoading,
          onPressed: onVerify,
        ),
        SizedBox(height: 24.h),
        Center(
          child: AppButton(
            label: 'Resend OTP',
            variant: AppButtonVariant.text,
            onPressed: isLoading ? null : onResend,
          ),
        ),
        SizedBox(height: 16.h),
        Center(
          child: AppButton(
            label: 'Change phone number',
            variant: AppButtonVariant.text,
            foregroundColor: const Color(0xFF636E72),
            onPressed: onChangePhone,
          ),
        ),
      ],
    );
  }
}
