import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entities/introduction_page_entity.dart';
import '../../../../shared/theme/app_theme.dart';
import 'page_indicators.dart';
import 'navigation_button.dart';

class IntroductionPageContent extends StatelessWidget {
  final IntroductionPageEntity page;
  final bool isCurrentPage;

  const IntroductionPageContent({
    super.key,
    required this.page,
    required this.isCurrentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(height: 12.h),
          
          // Image Container
          _buildImageContainer(),
          
          SizedBox(height: 16.h),
          
          // Title
          _buildTitle(context),
          
          SizedBox(height: 12.h),
          
          // Description
          Text(
            page.description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 9.sp, // Normal text at 9sp
              fontWeight: FontWeight.normal,
              color: AppTheme.textSecondary,
              height: 1.5,
            ),
          ),
          
          const Spacer(),
          
          // Page Indicators
          const PageIndicators(),
          
          SizedBox(height: 12.h),
          
          // Navigation Button
          const NavigationButton(),
          
          // Step indicator for page 2
          if (page.stepIndicator != null)
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Text(
                page.stepIndicator!,
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textSecondary,
                  letterSpacing: 1.sp,
                ),
              ),
            ),
            
          if (page.stepIndicator == null) SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildImageContainer() {
    return Container(
      width: double.infinity,
      height: 240.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.grey[300],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Actual Image
            Image.asset(
              page.imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Fallback to colored container with icon if image fails to load
                return Container(
                  color: _getBackgroundColor(),
                  child: Center(
                    child: Icon(
                      _getIconData(),
                      size: 48.sp,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                );
              },
            ),
            
            // Badge overlay
            if (page.badge.isNotEmpty)
              Positioned(
                bottom: 12.h,
                left: 12.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    page.badge,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (page.title.contains('Save Food')) {
      return AppTheme.primaryOrangeDark;
    } else if (page.title.contains('Support')) {
      return AppTheme.primaryOrangeLight;
    } else {
      return AppTheme.accentGreen;
    }
  }

  IconData _getIconData() {
    if (page.title.contains('Save Food')) {
      return Icons.food_bank;
    } else if (page.title.contains('Support')) {
      return Icons.store;
    } else {
      return Icons.landscape;
    }
  }

  Widget _buildTitle(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: page.title,
            style: GoogleFonts.poppins(
              fontSize: 16.sp, // Title at 16sp
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
              height: 1.3,
            ),
          ),
          if (page.highlight.isNotEmpty)
            TextSpan(
              text: '\n${page.highlight}',
              style: GoogleFonts.poppins(
                fontSize: 16.sp, // Highlight title at 16sp
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryOrange,
                height: 1.3,
              ),
            ),
        ],
      ),
    );
  }
}
