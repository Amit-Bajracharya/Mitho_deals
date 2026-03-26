import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DealsAppBar extends StatelessWidget {
  const DealsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side: App Logo & Name
          Row(
            children: [
              // Logo Icon
              Icon(
                Icons.restaurant,
                color: const Color(0xFFF97316), // Orange
                size: 28.sp,
              ),
              SizedBox(width: 8.w),
              Text(
                'Mitho Deals',
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1F2937),
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          
          // Right Side: Notification Icon
          Icon(
            Icons.notifications,
            color: const Color(0xFF1F2937),
            size: 24.sp,
          ),
        ],
      ),
    );
  }
}
