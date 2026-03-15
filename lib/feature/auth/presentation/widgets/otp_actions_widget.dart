import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
        // Verify OTP Button
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: ElevatedButton(
            onPressed: isLoading ? null : onVerify,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF6B35),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 0,
            ),
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : Text(
                    'Verify OTP',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
        
        SizedBox(height: 24.h),
        
        // Resend OTP
        Center(
          child: TextButton(
            onPressed: isLoading ? null : onResend,
            child: Text(
              'Resend OTP',
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: const Color(0xFFFF6B35),
              ),
            ),
          ),
        ),
        
        SizedBox(height: 16.h),
        
        // Change Phone Number
        Center(
          child: TextButton(
            onPressed: onChangePhone,
            child: Text(
              'Change phone number',
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: const Color(0xFF636E72),
              ),
            ),
          ),
        ),
      ],
    );
  }
}