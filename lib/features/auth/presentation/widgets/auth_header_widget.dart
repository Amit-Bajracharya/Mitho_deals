import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  
  const AuthHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48.w, // Slimmer logo
          height: 48.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF6B35).withOpacity(0.15),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Image.asset('assets/images/main_logo.png', fit: BoxFit.contain,),
          )
        ),
        
        SizedBox(height: 16.h),
        
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 16.sp, // Title at 16sp
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2D3436),
            letterSpacing: -0.4,
          ),
        ),
        
        SizedBox(height: 4.h),
        
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 9.sp, // Normal text at 9sp
            color: const Color(0xFF636E72),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
