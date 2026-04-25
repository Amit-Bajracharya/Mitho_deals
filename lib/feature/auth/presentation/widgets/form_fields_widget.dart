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
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            enabled: !isLoading,
            style: GoogleFonts.poppins(fontSize: 11.sp),
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              prefixIcon: Icon(Icons.email_outlined, size: 16.sp),
              contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: const BorderSide(color: Color(0xFFFF6B35), width: 1.2)),
              labelStyle: GoogleFonts.poppins(fontSize: 9.sp, color: const Color(0xFF636E72)),
              hintStyle: GoogleFonts.poppins(fontSize: 9.sp, color: const Color(0xFFB2BEC3)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Required';
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) return 'Invalid email';
              return null;
            },
          ),
          SizedBox(height: 12.h),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            enabled: !isLoading,
            style: GoogleFonts.poppins(fontSize: 11.sp),
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
              prefixIcon: Icon(Icons.lock_outline, size: 16.sp),
              contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: const BorderSide(color: Color(0xFFE0E0E0))),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: const BorderSide(color: Color(0xFFFF6B35), width: 1.2)),
              labelStyle: GoogleFonts.poppins(fontSize: 9.sp, color: const Color(0xFF636E72)),
              hintStyle: GoogleFonts.poppins(fontSize: 9.sp, color: const Color(0xFFB2BEC3)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Required';
              return null;
            },
          ),
          if (onForgotPassword != null)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: isLoading ? null : onForgotPassword,
                style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                child: Text('Forgot?', style: GoogleFonts.poppins(color: const Color(0xFFFF6B35), fontSize: 9.sp)),
              ),
            ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.infinity,
            height: 40.h, // Slimmer button
            child: ElevatedButton(
              onPressed: isLoading ? null : onLoginPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6B35),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
              ),
              child: isLoading
                  ? SizedBox(width: 16.w, height: 16.h, child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                  : Text('Login', style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}
