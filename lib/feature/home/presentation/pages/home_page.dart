import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:mitho_deals/feature/auth/presentation/bloc/auth_event.dart';
import 'package:mitho_deals/feature/auth/presentation/bloc/auth_state.dart';
import 'package:mitho_deals/feature/deals/presentation/screens/deals_list_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DealsListScreen(),
    _PlaceholderScreen('Orders'),
    _PlaceholderScreen('Saved'),
    _PlaceholderScreen('Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final authBloc = ServiceLocator.get<AuthBloc>();

    return BlocProvider.value(
      value: authBloc,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            unauthenticated: () {
              context.go('/login');
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red,
                ),
              );
            },
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
      padding: EdgeInsets.only(top: 8.h, bottom: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, -4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(Icons.explore, 'Explore', 0),
          _buildNavItem(Icons.receipt_long, 'Orders', 1),
          _buildNavItem(Icons.favorite, 'Saved', 2),
          _buildNavItem(Icons.person, 'Profile', 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isActive = _currentIndex == index;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (index == 3) {
          // Temporarily show the profile menu on tap for logout functionality
          _showProfileMenu(context);
        } else {
          setState(() {
            _currentIndex = index;
          });
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24.sp,
            color: isActive ? const Color(0xFFF97316) : Colors.grey[400],
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 10.sp,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              color: isActive ? const Color(0xFFF97316) : Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  void _showProfileMenu(BuildContext context) {
    final authBloc = ServiceLocator.get<AuthBloc>();
    
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 16.h),
            ListTile(
              leading: Icon(Icons.person, size: 20.sp),
              title: Text('My Profile', style: GoogleFonts.poppins(fontSize: 14.sp)),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.logout, size: 20.sp, color: Colors.red),
              title: Text(
                'Logout',
                style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.red, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context);
                authBloc.add(const AuthEvent.logoutRequested());
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

// Temporary placeholder for unbuilt screens
class _PlaceholderScreen extends StatelessWidget {
  final String title;
  const _PlaceholderScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$title Screen\n(Coming Soon)',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: 18.sp,
          color: Colors.grey,
        ),
      ),
    );
  }
}
