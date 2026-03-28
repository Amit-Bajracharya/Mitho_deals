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
        // Logo
        Container(
          width: 64.w,
          height: 64.h,
          decoration: BoxDecoration(
            color: Colors.white, // Orange color
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF6B35).withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Image.asset('assets/images/main_logo.png', fit: BoxFit.contain,),
          )
        ),
        
        SizedBox(height: 20.h),
        
        // Title
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2D3436),
            letterSpacing: -0.5,
          ),
        ),
        
        SizedBox(height: 6.h),
        
        // Subtitle
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: const Color(0xFF636E72),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
