import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FormFieldsWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  final VoidCallback? onForgotPassword;
  final VoidCallback? onLoginPressed;
  
  const FormFieldsWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.isLoading = false,
    this.onForgotPassword,
    this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Email Field
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            enabled: !isLoading,
            style: GoogleFonts.poppins(fontSize: 13.sp),
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              prefixIcon: Icon(Icons.email_outlined, size: 18.sp),
              contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Color(0xFFFF6B35), width: 1.5),
              ),
              labelStyle: GoogleFonts.poppins(fontSize: 12.sp, color: const Color(0xFF636E72)),
              hintStyle: GoogleFonts.poppins(fontSize: 12.sp, color: const Color(0xFFB2BEC3)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          
          SizedBox(height: 16.h),
          
          // Password Field
          TextFormField(
            controller: passwordController,
            obscureText: true,
            enabled: !isLoading,
            style: GoogleFonts.poppins(fontSize: 13.sp),
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
              prefixIcon: Icon(Icons.lock_outline, size: 18.sp),
              contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Color(0xFFFF6B35), width: 1.5),
              ),
              labelStyle: GoogleFonts.poppins(fontSize: 12.sp, color: const Color(0xFF636E72)),
              hintStyle: GoogleFonts.poppins(fontSize: 12.sp, color: const Color(0xFFB2BEC3)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          
          SizedBox(height: 4.h),
          
          // Forgot Password
          if (onForgotPassword != null)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: isLoading ? null : onForgotPassword,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFFF6B35),
                    fontSize: 11.sp,
                  ),
                ),
              ),
            ),
          
          SizedBox(height: 12.h),
          
          // Login Button
          SizedBox(
            width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              onPressed: isLoading ? null : onLoginPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6B35),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 18.w,
                          height: 18.h,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text('Wait...', style: GoogleFonts.poppins(fontSize: 13.sp)),
                      ],
                    )
                  : Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
