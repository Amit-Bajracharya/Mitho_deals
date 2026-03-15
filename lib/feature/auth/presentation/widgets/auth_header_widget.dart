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
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            color: Colors.white, // Orange color
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFFF6B35).withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/main_logo.png'),
          )
        ),
        
        SizedBox(height: 24.h),
        
        // Title
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 26.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2D3436),
          ),
        ),
        
        SizedBox(height: 8.h),
        
        // Subtitle
        Text(
          subtitle,
          style: GoogleFonts.poppins(
            fontSize: 13.sp,
            color: const Color(0xFF636E72),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
