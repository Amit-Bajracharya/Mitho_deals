import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';

enum AppButtonVariant { primary, outlined, text }
enum AppButtonSize { compact, normal, large }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final IconData? icon;
  final bool iconTrailing;
  final double? width;
  final Color? foregroundColor;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.normal,
    this.icon,
    this.iconTrailing = false,
    this.width,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final height = switch (size) {
      AppButtonSize.compact => 40.h,
      AppButtonSize.normal => 50.h,
      AppButtonSize.large => 56.h,
    };

    final fontSize = switch (size) {
      AppButtonSize.compact => 12.sp,
      AppButtonSize.normal => 14.sp,
      AppButtonSize.large => 18.sp,
    };

    final borderRadius = switch (size) {
      AppButtonSize.compact => 10.r,
      AppButtonSize.normal => 12.r,
      AppButtonSize.large => 16.r,
    };

    final child = isLoading
        ? SizedBox(
            width: 20.w,
            height: 20.h,
            child: CircularProgressIndicator(
              color: variant == AppButtonVariant.primary ? Colors.white : AppTheme.primaryOrange,
              strokeWidth: 2,
            ),
          )
        : _buildLabel(fontSize);

    final button = switch (variant) {
      AppButtonVariant.primary => ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryOrange,
            foregroundColor: AppTheme.textLight,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: child,
        ),
      AppButtonVariant.outlined => OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppTheme.primaryOrange,
            side: const BorderSide(color: AppTheme.primaryOrange),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: child,
        ),
      AppButtonVariant.text => TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            foregroundColor: foregroundColor ?? AppTheme.primaryOrange,
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: child,
        ),
    };

    return SizedBox(
      width: width ?? double.infinity,
      height: variant == AppButtonVariant.text ? null : height,
      child: button,
    );
  }

  Widget _buildLabel(double fontSize) {
    final textColor = variant == AppButtonVariant.primary
        ? AppTheme.textLight
        : (foregroundColor ?? AppTheme.primaryOrange);

    final text = Text(
      label,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
    );

    if (icon == null) return text;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: iconTrailing
          ? [text, SizedBox(width: 8.w), Icon(icon, size: fontSize + 4)]
          : [Icon(icon, size: fontSize + 4), SizedBox(width: 8.w), text],
    );
  }
}
