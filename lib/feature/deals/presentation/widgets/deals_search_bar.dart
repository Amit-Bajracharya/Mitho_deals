import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DealsSearchBar extends StatelessWidget {
  const DealsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        height: 36.h, // Slimmer search bar
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r), // Less rounded for a cleaner look
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          style: GoogleFonts.poppins(fontSize: 10.sp),
          decoration: InputDecoration(
            hintText: 'Search deals...',
            hintStyle: GoogleFonts.poppins(
              color: Colors.grey[400],
              fontSize: 9.sp, // Normal text at 9sp
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey[400],
              size: 16.sp, // Smaller icon
            ),
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 8.h),
          ),
        ),
      ),
    );
  }
}
