import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
                color: const Color(0xFFF97316),
                size: 20.sp, // Smaller icon
              ),
              SizedBox(width: 6.w),
              Text(
                'Mitho Deals',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp, // Title at 16sp
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1F2937),
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          
          // Right Side: Cart & Notification
          Row(
            children: [
              GestureDetector(
                onTap: () => context.push('/cart'),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: const Color(0xFF1F2937),
                  size: 20.sp, // Smaller icon
                ),
              ),
              SizedBox(width: 12.w),
              Icon(
                Icons.notifications_none_outlined,
                color: const Color(0xFF1F2937),
                size: 20.sp, // Smaller icon
              ),
            ],
          ),
        ],
      ),
    );
  }
}
