import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DealMapWidget extends StatelessWidget {
  const DealMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        height: 190.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Stack(
            children: [
              // Dummy Map Image Background
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/map_placeholder.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Image.asset(
                  'assets/images/map_placeholder.png', // Or use a network map placeholder if asset doesn't exist
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback if image asset is not loaded yet
                    return Container(
                      color: const Color(0xFFE8F5E8),
                      child: Stack(
                        children: [
                          Center(
                            child: Icon(Icons.map_outlined, size: 60.sp, color: Colors.grey[400]),
                          ),
                          // Simulated map markers
                          Positioned(top: 40.h, left: 80.w, child: Icon(Icons.location_on, color: Colors.orange, size: 24.sp)),
                          Positioned(top: 80.h, right: 60.w, child: Icon(Icons.location_on, color: Colors.red, size: 24.sp)),
                          Positioned(bottom: 30.h, left: 150.w, child: Icon(Icons.location_on, color: Colors.blue, size: 24.sp)),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Bottom Left Pill
              Positioned(
                bottom: 12.h,
                left: 12.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.navigation, // Small arrow pointer
                        size: 14.sp,
                        color: const Color(0xFFF97316),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        '12 Deals Near Jhamsikhel',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1F2937),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
