import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

import '../widgets/role_option_card.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 64.w,
                height: 64.w,
                decoration: BoxDecoration(
                  color: AppTheme.primaryOrange.withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(Icons.restaurant_menu_rounded, size: 32.sp, color: AppTheme.primaryOrange),
                ),
              ),
              SizedBox(height: 24.h),
              const AppText.headline('Join Mitho Deals'),
              SizedBox(height: 6.h),
              const AppText.subtitle('Save money, reduce waste!', textAlign: TextAlign.center),
              SizedBox(height: 40.h),
              RoleOptionCard(
                title: "I'm a Food Saver",
                subtitle: 'Find amazing food deals',
                icon: Icons.person_search_rounded,
                color: AppTheme.primaryOrange,
                onTap: () => context.push('/register'),
              ),
              SizedBox(height: 12.h),
              RoleOptionCard(
                title: "I'm a Restaurant",
                subtitle: 'Sell your surplus food',
                icon: Icons.storefront_rounded,
                color: const Color(0xFF0984E3),
                onTap: () => context.push('/vendor-register'),
              ),
              SizedBox(height: 24.h),
              AppButton(
                label: 'Already have an account? Login',
                variant: AppButtonVariant.text,
                width: null,
                onPressed: () => context.go('/login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
