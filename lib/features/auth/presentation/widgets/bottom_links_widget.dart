import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomLinksWidget extends StatelessWidget {
  final VoidCallback? onPhoneAuth;
  final VoidCallback? onRegister;
  final VoidCallback? onLogin;
  final bool showRegisterLink;
  
  const BottomLinksWidget({
    super.key,
    this.onPhoneAuth,
    this.onRegister,
    this.onLogin,
    this.showRegisterLink = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Phone Auth Option
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'OR',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF636E72),
                  fontSize: 14.sp,
                ),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),
        
        SizedBox(height: 20.h),
        
        // Phone Login Button
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: OutlinedButton.icon(
            onPressed: onPhoneAuth,
            icon: const Icon(Icons.phone, color: Color(0xFFFF6B35)),
            label: Text(
              'Login with Phone',
              style: GoogleFonts.poppins(
                color: const Color(0xFFFF6B35),
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFFFF6B35)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),
        
        SizedBox(height: 15.h),
        
        // Register/Login Link
        if (showRegisterLink)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: GoogleFonts.poppins(
                  color: const Color(0xFF636E72),
                  fontSize: 13.sp,
                ),
              ),
              GestureDetector(
                onTap: onRegister,
                child: Text(
                  'Register',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFFF6B35),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          )
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: GoogleFonts.poppins(
                  color: const Color(0xFF636E72),
                  fontSize: 13.sp,
                ),
              ),
              GestureDetector(
                onTap: onLogin,
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFFF6B35),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        
        SizedBox(height: 20.h),
      ],
    );
  }
}
