import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';

enum AppButtonVariant { primary, outlined, text }

enum AppButtonWidth {
  block,
  inline,
}

class AppButton extends StatelessWidget {
  static const double height = 48;
  static const double radius = 12;
  static const double fontSize = 14;
  static const double hPadding = 20;

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final AppButtonVariant variant;
  final AppButtonWidth buttonWidth;
  final IconData? icon;
  final bool iconTrailing;
  final Color? foregroundColor;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.variant = AppButtonVariant.primary,
    this.buttonWidth = AppButtonWidth.block,
    this.icon,
    this.iconTrailing = false,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final h = height.h;
    final r = radius.r;
    final fs = fontSize.sp;
    final padH = hPadding.w;

    final child = isLoading
        ? SizedBox(
            width: 20.w,
            height: 20.h,
            child: CircularProgressIndicator(
              color: variant == AppButtonVariant.primary ? Colors.white : AppTheme.primaryOrange,
              strokeWidth: 2,
            ),
          )
        : _buildLabel(fs);

    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(r));

    final isFullWidth =
        variant != AppButtonVariant.text && buttonWidth == AppButtonWidth.block;

    final baseStyle = ButtonStyle(
      minimumSize: WidgetStateProperty.all(Size(0, h)),
      maximumSize: WidgetStateProperty.all(Size(double.infinity, h)),
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(
          horizontal: variant == AppButtonVariant.text ? 8.w : padH,
        ),
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.standard,
      shape: WidgetStateProperty.all(shape),
    );

    final button = switch (variant) {
      AppButtonVariant.primary => ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: baseStyle.merge(
            ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryOrange,
              foregroundColor: AppTheme.textLight,
              elevation: 0,
              shadowColor: Colors.transparent,
            ),
          ),
          child: child,
        ),
      AppButtonVariant.outlined => OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: baseStyle.merge(
            OutlinedButton.styleFrom(
              foregroundColor: AppTheme.primaryOrange,
              side: const BorderSide(color: AppTheme.primaryOrange, width: 1.5),
            ),
          ),
          child: child,
        ),
      AppButtonVariant.text => TextButton(
          onPressed: isLoading ? null : onPressed,
          style: baseStyle.merge(
            TextButton.styleFrom(
              foregroundColor: foregroundColor ?? AppTheme.primaryOrange,
              backgroundColor: Colors.transparent,
            ),
          ),
          child: child,
        ),
    };

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: h,
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
          ? [text, SizedBox(width: 8.w), Icon(icon, size: fontSize + 2, color: textColor)]
          : [Icon(icon, size: fontSize + 2, color: textColor), SizedBox(width: 8.w), text],
    );
  }
}
