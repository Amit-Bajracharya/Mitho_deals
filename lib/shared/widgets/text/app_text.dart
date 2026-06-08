import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_theme.dart';

enum AppTextVariant {
  display,
  headline,
  title,
  subtitle,
  body,
  bodySmall,
  label,
  caption,
  link,
  error,
}

class AppText extends StatelessWidget {
  final String text;
  final AppTextVariant variant;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextDecoration? decoration;
  final FontStyle? fontStyle;

  const AppText(
    this.text, {
    super.key,
    this.variant = AppTextVariant.body,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    this.decoration,
    this.fontStyle,
  });

  const AppText.headline(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    this.decoration,
    this.fontStyle,
  }) : variant = AppTextVariant.headline;

  const AppText.title(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    this.decoration,
    this.fontStyle,
  }) : variant = AppTextVariant.title;

  const AppText.subtitle(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    this.decoration,
    this.fontStyle,
  }) : variant = AppTextVariant.subtitle;

  const AppText.body(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    this.decoration,
    this.fontStyle,
  }) : variant = AppTextVariant.body;

  const AppText.bodySmall(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    this.decoration,
    this.fontStyle,
  }) : variant = AppTextVariant.bodySmall;

  const AppText.label(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    this.decoration,
    this.fontStyle,
  }) : variant = AppTextVariant.label;

  const AppText.caption(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    this.decoration,
    this.fontStyle,
  }) : variant = AppTextVariant.caption;

  const AppText.link(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    this.decoration,
    this.fontStyle,
  }) : variant = AppTextVariant.link;

  const AppText.error(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    this.decoration,
    this.fontStyle,
  }) : variant = AppTextVariant.error;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: resolveStyle(
        variant: variant,
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: decoration,
        fontStyle: fontStyle,
      ),
    );
  }

  static TextStyle resolveStyle({
    required AppTextVariant variant,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    final base = switch (variant) {
      AppTextVariant.display => GoogleFonts.poppins(
          fontSize: fontSize ?? 24.sp,
          fontWeight: fontWeight ?? FontWeight.bold,
          color: color ?? AppTheme.textPrimary,
        ),
      AppTextVariant.headline => GoogleFonts.poppins(
          fontSize: fontSize ?? 16.sp,
          fontWeight: fontWeight ?? FontWeight.bold,
          color: color ?? AppTheme.textPrimary,
          letterSpacing: -0.4,
        ),
      AppTextVariant.title => GoogleFonts.poppins(
          fontSize: fontSize ?? 18.sp,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: color ?? AppTheme.textPrimary,
        ),
      AppTextVariant.subtitle => GoogleFonts.poppins(
          fontSize: fontSize ?? 9.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? AppTheme.textSecondary,
        ),
      AppTextVariant.body => GoogleFonts.poppins(
          fontSize: fontSize ?? 13.sp,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color ?? AppTheme.textSecondary,
        ),
      AppTextVariant.bodySmall => GoogleFonts.poppins(
          fontSize: fontSize ?? 11.sp,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color ?? AppTheme.textSecondary,
        ),
      AppTextVariant.label => GoogleFonts.poppins(
          fontSize: fontSize ?? 9.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? AppTheme.textSecondary,
        ),
      AppTextVariant.caption => GoogleFonts.poppins(
          fontSize: fontSize ?? 10.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? AppTheme.textSecondary,
        ),
      AppTextVariant.link => GoogleFonts.poppins(
          fontSize: fontSize ?? 13.sp,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: color ?? AppTheme.primaryOrange,
        ),
      AppTextVariant.error => GoogleFonts.poppins(
          fontSize: fontSize ?? 11.sp,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color ?? AppTheme.accentError,
        ),
    };
    var style = base;
    if (decoration != null) style = style.copyWith(decoration: decoration);
    if (fontStyle != null) style = style.copyWith(fontStyle: fontStyle);
    return style;
  }
}
