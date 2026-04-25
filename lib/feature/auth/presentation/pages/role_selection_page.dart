import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 64.w, // Slimmer icon box
                height: 64.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B35).withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.restaurant_menu_rounded,
                    size: 32.sp,
                    color: const Color(0xFFFF6B35),
                  ),
                ),
              ),
              
              SizedBox(height: 24.h),
              
              Text(
                'Join Mitho Deals',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp, // Title at 16sp
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2D3436),
                ),
              ),
              
              SizedBox(height: 6.h),
              
              Text(
                'Save money, reduce waste!',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 9.sp, // Normal text at 9sp
                  color: const Color(0xFF636E72),
                ),
              ),
              
              SizedBox(height: 40.h),
              
              _buildOptionCard(
                title: "I'm a Food Saver",
                subtitle: 'Find amazing food deals',
                icon: Icons.person_search_rounded,
                color: const Color(0xFFFF6B35),
                onTap: () => context.push('/register'),
              ),
              
              SizedBox(height: 12.h),
              
              _buildOptionCard(
                title: "I'm a Restaurant",
                subtitle: 'Sell your surplus food',
                icon: Icons.storefront_rounded,
                color: const Color(0xFF0984E3),
                onTap: () => context.push('/vendor-register'),
              ),
              
              SizedBox(height: 24.h),
              
              TextButton(
                onPressed: () => context.go('/login'),
                child: Text(
                  'Already have an account? Login',
                  style: GoogleFonts.poppins(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFF6B35),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xFFF1F2F6)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: color.withOpacity(0.08),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon, color: color, size: 20.sp),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF2D3436),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 9.sp, // Normal text at 9sp
                      color: const Color(0xFF636E72),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 10.sp,
              color: const Color(0xFFB2BEC3),
            ),
          ],
        ),
      ),
    );
  }
}
