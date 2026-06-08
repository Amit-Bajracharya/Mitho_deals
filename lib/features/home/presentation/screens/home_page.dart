import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mitho_deals/features/auth/presentation/bloc/auth_event.dart';
import 'package:mitho_deals/features/auth/presentation/bloc/auth_state.dart';
import 'package:mitho_deals/features/deals/presentation/screens/deals_list_screen.dart';
import 'package:mitho_deals/features/orders/presentation/screens/orders_screen.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

import '../widgets/placeholder_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DealsListScreen(),
    const OrdersScreen(),
    const PlaceholderScreen('Saved'),
    const PlaceholderScreen('Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final authBloc = ServiceLocator.get<AuthBloc>();

    return BlocProvider.value(
      value: authBloc,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            unauthenticated: () => context.go('/login'),
            error: (message) => AppSnackBar.showError(context, message),
          );
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFF9FAFB),
          body: _pages[_currentIndex],
          bottomNavigationBar: _buildBottomNav(),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: EdgeInsets.only(top: 10.h, bottom: 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            offset: const Offset(0, -2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(Icons.explore_outlined, Icons.explore, 'Explore', 0),
          _buildNavItem(Icons.receipt_long_outlined, Icons.receipt_long, 'Orders', 1),
          _buildNavItem(Icons.favorite_outline, Icons.favorite, 'Saved', 2),
          _buildNavItem(Icons.person_outline, Icons.person, 'Profile', 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData outlineIcon, IconData solidIcon, String label, int index) {
    final isActive = _currentIndex == index;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (index == 3) {
          _showProfileMenu(context);
        } else {
          setState(() => _currentIndex = index);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? solidIcon : outlineIcon,
              size: 20.sp,
              color: isActive ? AppTheme.primaryOrange : Colors.grey[400],
            ),
            SizedBox(height: 4.h),
            AppText.caption(
              label,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              color: isActive ? AppTheme.primaryOrange : Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }

  void _showProfileMenu(BuildContext context) {
    final authBloc = ServiceLocator.get<AuthBloc>();

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 16.h),
            ListTile(
              leading: Icon(Icons.person_outline, size: 18.sp),
              title: const AppText.body('My Profile'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.logout_rounded, size: 18.sp, color: Colors.redAccent),
              title: const AppText.body('Logout', color: Colors.redAccent, fontWeight: FontWeight.w500),
              onTap: () {
                Navigator.pop(context);
                authBloc.add(const AuthEvent.logoutRequested());
              },
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
