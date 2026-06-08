import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';
import '../text/app_text.dart';

enum AppTextFieldVariant { auth, form, search, plain }

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final IconData? prefixIcon;
  final bool obscureText;
  final bool enabled;
  final int maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final AppTextFieldVariant variant;
  final InputBorder? border;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;

  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.prefixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.maxLines = 1,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.variant = AppTextFieldVariant.auth,
    this.border,
    this.suffixIcon,
    this.focusNode,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    final field = TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      enabled: enabled,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      style: GoogleFonts.poppins(fontSize: 11.sp),
      decoration: _buildDecoration(),
    );

    if (variant == AppTextFieldVariant.form && label != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.label(label!, fontWeight: FontWeight.w500, fontSize: 14.sp),
          SizedBox(height: 8.h),
          field,
        ],
      );
    }

    return field;
  }

  InputDecoration _buildDecoration() {
    return switch (variant) {
      AppTextFieldVariant.auth => InputDecoration(
          labelText: label,
          hintText: hint,
          isDense: true,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 16.sp) : null,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppTheme.divider),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppTheme.divider),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppTheme.primaryOrange, width: 1.2),
          ),
          labelStyle: GoogleFonts.poppins(fontSize: 9.sp, color: AppTheme.textSecondary),
          hintStyle: GoogleFonts.poppins(fontSize: 9.sp, color: AppTheme.border),
        ),
      AppTextFieldVariant.form => InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        ),
      AppTextFieldVariant.search => InputDecoration(
          hintText: hint,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 18.sp) : null,
          contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
          border: InputBorder.none,
          hintStyle: GoogleFonts.poppins(fontSize: 9.sp, color: AppTheme.border),
        ),
      AppTextFieldVariant.plain => InputDecoration(
          hintText: hint,
          border: border ?? InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        ),
    };
  }
}
