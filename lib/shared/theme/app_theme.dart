import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors
  static const Color primaryOrange = Color(0xFFF07C1F);
  static const Color primaryOrangeDark = Color(0xFFE85D04);
  static const Color primaryOrangeLight = Color(0xFFF4A261);
  
  // Background Colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundLight = Color(0xFFF8F8F8);
  static const Color backgroundDark = Color(0xFF1A1A2E);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textLight = Color(0xFFFFFFFF);
  
  // Accent Colors
  static const Color accentGreen = Color(0xFF2A9D8F);
  static const Color accentError = Color(0xFFE63946);
  static const Color accentSuccess = Color(0xFF2A9D8F);
  
  // Divider/Border Colors
  static const Color divider = Color(0xFFE5E7EB);
  static const Color border = Color(0xFFD1D5DB);
  
  // Shadow
  static List<BoxShadow> get softShadow => [
    BoxShadow(
      color: primaryOrange.withOpacity(0.1),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ];

  // Poppins Text Theme with Responsive Font Sizes (.sp)
  static TextTheme get poppinsTextTheme {
    return TextTheme(
      // Display Large
      displayLarge: GoogleFonts.poppins(
        fontSize: 57.sp,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        letterSpacing: -0.25.sp,
      ),
      // Display Medium
      displayMedium: GoogleFonts.poppins(
        fontSize: 45.sp,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        letterSpacing: -0.25.sp,
      ),
      // Display Small
      displaySmall: GoogleFonts.poppins(
        fontSize: 36.sp,
        fontWeight: FontWeight.w600,
        color: textPrimary,
      ),
      // Headline Large
      headlineLarge: GoogleFonts.poppins(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        height: 1.2,
      ),
      // Headline Medium
      headlineMedium: GoogleFonts.poppins(
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        height: 1.3,
      ),
      // Headline Small
      headlineSmall: GoogleFonts.poppins(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: textPrimary,
      ),
      // Title Large
      titleLarge: GoogleFonts.poppins(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: textPrimary,
      ),
      // Title Medium
      titleMedium: GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: 0.15.sp,
      ),
      // Title Small
      titleSmall: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: textSecondary,
        letterSpacing: 0.1.sp,
      ),
      // Body Large
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: textSecondary,
        height: 1.5,
        letterSpacing: 0.5.sp,
      ),
      // Body Medium
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: textSecondary,
        height: 1.5,
        letterSpacing: 0.25.sp,
      ),
      // Body Small - 12.sp as requested
      bodySmall: GoogleFonts.poppins(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: textSecondary,
        height: 1.5,
        letterSpacing: 0.4.sp,
      ),
      // Label Large
      labelLarge: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: textPrimary,
        letterSpacing: 0.1.sp,
      ),
      // Label Medium - 12.sp as requested
      labelMedium: GoogleFonts.poppins(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: textSecondary,
        letterSpacing: 0.5.sp,
      ),
      // Label Small - 12.sp as requested (minimum size)
      labelSmall: GoogleFonts.poppins(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: textSecondary,
        letterSpacing: 0.5.sp,
      ),
    );
  }

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryOrange,
      scaffoldBackgroundColor: backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: primaryOrange,
        onPrimary: textLight,
        primaryContainer: primaryOrangeLight,
        onPrimaryContainer: textPrimary,
        secondary: primaryOrangeDark,
        onSecondary: textLight,
        secondaryContainer: primaryOrangeLight,
        onSecondaryContainer: textPrimary,
        surface: background,
        onSurface: textPrimary,
        surfaceVariant: backgroundLight,
        onSurfaceVariant: textSecondary,
        background: backgroundLight,
        onBackground: textPrimary,
        error: accentError,
        onError: textLight,
        outline: border,
        shadow: Colors.black26,
      ),
      textTheme: poppinsTextTheme,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: background,
        foregroundColor: textPrimary,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryOrange,
          foregroundColor: textLight,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          textStyle: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryOrange,
          side: const BorderSide(color: primaryOrange, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          textStyle: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryOrange,
          textStyle: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: background,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: primaryOrange, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: accentError),
        ),
        labelStyle: GoogleFonts.poppins(
          fontSize: 14.sp,
          color: textSecondary,
        ),
        hintStyle: GoogleFonts.poppins(
          fontSize: 14.sp,
          color: textSecondary.withOpacity(0.6),
        ),
      ),
     
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: background,
        selectedItemColor: primaryOrange,
        unselectedItemColor: textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryOrange,
        foregroundColor: textLight,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: divider,
        thickness: 1,
        space: 1,
      ),
    );
  }

  // Dark Theme (Optional)
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryOrange,
      scaffoldBackgroundColor: backgroundDark,
      textTheme: poppinsTextTheme.apply(
        bodyColor: textLight,
        displayColor: textLight,
      ),
      colorScheme: const ColorScheme.dark(
        primary: primaryOrange,
        onPrimary: textLight,
        secondary: primaryOrangeLight,
        onSecondary: textPrimary,
        surface: Color(0xFF2D2D44),
        onSurface: textLight,
        background: backgroundDark,
        onBackground: textLight,
        error: accentError,
        onError: textLight,
      ),
    );
  }
}
