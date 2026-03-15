import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
        Text(
          'Verify OTP',
          style: GoogleFonts.poppins(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2D3436),
          ),
        ),
        
        SizedBox(height: 8.h),
        
        Text(
          'Enter the 6-digit code sent to $phoneNumber',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: const Color(0xFF636E72),
          ),
        ),
      ],
    );
  }
}