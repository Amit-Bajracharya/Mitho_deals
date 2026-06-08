import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/introduction_page_entity.dart';
import '../../../../shared/theme/app_theme.dart';
import '../../../../shared/widgets/shared_widgets.dart';
import 'navigation_button.dart';
import 'page_indicators.dart';

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
          _buildImageContainer(),
          SizedBox(height: 16.h),
          _buildTitle(),
          SizedBox(height: 12.h),
          AppText.subtitle(
            page.description,
            textAlign: TextAlign.center,
            fontSize: 9.sp,
          ),
          const Spacer(),
          const PageIndicators(),
          SizedBox(height: 12.h),
          const NavigationButton(),
          if (page.stepIndicator != null)
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: AppText.caption(
                page.stepIndicator!,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
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
            Image.asset(
              page.imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
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
                  child: AppText.label(
                    page.badge,
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
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

  Widget _buildTitle() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: page.title,
            style: AppText.resolveStyle(variant: AppTextVariant.headline),
          ),
          if (page.highlight.isNotEmpty)
            TextSpan(
              text: '\n${page.highlight}',
              style: AppText.resolveStyle(
                variant: AppTextVariant.headline,
                color: AppTheme.primaryOrange,
              ),
            ),
        ],
      ),
    );
  }
}
