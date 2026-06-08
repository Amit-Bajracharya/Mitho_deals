import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class AuthHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryOrange.withOpacity(0.15),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Image.asset('assets/images/main_logo.png', fit: BoxFit.contain),
          ),
        ),
        SizedBox(height: 16.h),
        AppText.headline(title, textAlign: TextAlign.center),
        SizedBox(height: 4.h),
        AppText.subtitle(subtitle, textAlign: TextAlign.center),
      ],
    );
  }
}
