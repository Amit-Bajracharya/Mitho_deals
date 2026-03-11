import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:mitho_deals/feature/auth/presentation/bloc/auth_event.dart';
import 'package:mitho_deals/feature/auth/presentation/bloc/auth_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = ServiceLocator.get<AuthBloc>();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: BlocProvider.value(
        value: authBloc,
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              loading: () {},
              authenticated: (user) {},
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
              phoneCodeSent: (verificationId, phoneNumber) {},
              phoneVerificationLoading: () {},
            );
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return _buildHomeContent(context, state);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHomeContent(BuildContext context, AuthState state) {
    final userName = state.maybeWhen(
      authenticated: (user) => user.name,
      orElse: () => 'User',
    );

    return SafeArea(
      child: Column(
        children: [
          // Fixed Header
          _buildHeader(userName, context),
          
          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Map Section (reduced height)
                  _buildMapSection(),
                  
                  SizedBox(height: 12.h),
                  
                  // Search Bar
                  _buildSearchBar(),
                  
                  SizedBox(height: 16.h),
                  
                  // Special Offers Section
                  _buildSectionHeader('Special Offers'),
                  SizedBox(height: 8.h),
                  _buildSpecialOffers(),
                  
                  SizedBox(height: 16.h),
                  
                  // Categories Section
                  _buildSectionHeader('Categories'),
                  SizedBox(height: 8.h),
                  _buildCategories(),
                  
                  SizedBox(height: 16.h),
                  
                  // Popular Deals Section (reduced items)
                  _buildSectionHeader('Popular Deals'),
                  SizedBox(height: 8.h),
                  _buildPopularDeals(),
                  
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
          
          // Fixed Bottom Navigation
          _buildBottomNav(),
        ],
      ),
    );
  }

  Widget _buildHeader(String userName, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile Icon (Left side)
          GestureDetector(
            onTap: () => _showProfileMenu(context),
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E8),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Icon(
                Icons.person,
                size: 20.sp,
                color: const Color(0xFF4CAF50),
              ),
            ),
          ),
          
          Spacer(),
          
          // Logo in center
          Column(
            children: [
              Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B35),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.restaurant,
                  color: Colors.white,
                  size: 16.sp,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Mitho Deals',
                style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2D3436),
                ),
              ),
            ],
          ),
          
          Spacer(),
          
          // Notification Icon (Right side)
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3E0),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.notifications_outlined,
                    size: 20.sp,
                    color: const Color(0xFFFF6B35),
                  ),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapSection() {
    return Container(
      height: 150.h, // Reduced from 200h to 150h
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Stack(
          children: [
            // Map Background
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFE8F5E8),
                    const Color(0xFFF0F8FF),
                  ],
                ),
              ),
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/images/map_placeholder.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.map,
                              size: 48.sp,
                              color: Colors.grey[400],
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Map View',
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            
            // Map Overlay
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.2),
                  ],
                ),
              ),
            ),
            
            // Map Controls
            Positioned(
              top: 12.h,
              right: 12.w,
              child: Column(
                children: [
                  Container(
                    width: 36.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.my_location,
                      size: 18.sp,
                      color: const Color(0xFFFF6B35),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 36.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.layers,
                      size: 18.sp,
                      color: const Color(0xFF636E72),
                    ),
                  ),
                ],
              ),
            ),
            
            // Location Info
            Positioned(
              bottom: 12.h,
              left: 12.w,
              right: 12.w,
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16.sp,
                      color: const Color(0xFFFF6B35),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nearby Restaurants',
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF2D3436),
                            ),
                          ),
                          Text(
                            '15 restaurants within 2km',
                            style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              color: const Color(0xFF636E72),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 16.sp,
                      color: const Color(0xFF636E72),
                    ),
                  ],
                ),
              ),
            ),
            
            // Map Markers (Sample)
            Positioned(
              top: 60.h,
              left: 80.w,
              child: Container(
                width: 12.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B35),
                  borderRadius: BorderRadius.circular(6.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFF6B35).withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 100.h,
              right: 100.w,
              child: Container(
                width: 12.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50),
                  borderRadius: BorderRadius.circular(6.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4CAF50).withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 80.h,
              left: 120.w,
              child: Container(
                width: 12.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF2196F3),
                  borderRadius: BorderRadius.circular(6.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF2196F3).withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: 20.sp,
            color: const Color(0xFF636E72),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              'Search for restaurants, cuisines...',
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: const Color(0xFFB2BEC3),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B35),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Icon(
              Icons.tune,
              size: 16.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2D3436),
          ),
        ),
        Text(
          'See all',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: const Color(0xFFFF6B35),
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialOffers() {
    return Container(
      height: 100.h, // Further reduced from 120h to 100h
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            width: 160.w, // Further reduced from 180w to 160w
            margin: EdgeInsets.only(right: 12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Deal Image
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF6B35).withOpacity(0.1),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.local_offer,
                        size: 32.sp,
                        color: const Color(0xFFFF6B35),
                      ),
                    ),
                  ),
                ),
                
                // Deal Info
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(8.w), // Reduced from 12.w to 8.w
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min, // Added to prevent overflow
                      children: [
                        Text(
                          '50% OFF',
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp, // Reduced from 16sp to 14sp
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFFF6B35),
                          ),
                        ),
                        Text(
                          'Burger Palace',
                          style: GoogleFonts.poppins(
                            fontSize: 10.sp, // Reduced from 12sp to 10sp
                            color: const Color(0xFF636E72),
                          ),
                        ),
                        Text(
                          'Valid until Dec 31',
                          style: GoogleFonts.poppins(
                            fontSize: 9.sp, // Reduced from 10sp to 9sp
                            color: const Color(0xFFB2BEC3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategories() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.8,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        final categories = [
          {'name': 'Pizza', 'icon': Icons.local_pizza, 'color': Color(0xFFE8F5E8)},
          {'name': 'Burger', 'icon': Icons.lunch_dining, 'color': Color(0xFFFFF3E0)},
          {'name': 'Sushi', 'icon': Icons.set_meal, 'color': Color(0xFFF3E5F5)},
          {'name': 'Coffee', 'icon': Icons.coffee, 'color': Color(0xFFE1F5FE)},
          {'name': 'Dessert', 'icon': Icons.cake, 'color': Color(0xFFFCE4EC)},
          {'name': 'Salad', 'icon': Icons.eco, 'color': Color(0xFFE8F5E8)},
          {'name': 'Drink', 'icon': Icons.local_bar, 'color': Color(0xFFFFF3E0)},
          {'name': 'More', 'icon': Icons.more_horiz, 'color': Color(0xFFF3E5F5)},
        ];
        
        final category = categories[index];
        
        return Container(
          decoration: BoxDecoration(
            color: category['color'] as Color,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                category['icon'] as IconData,
                size: 24.sp,
                color: const Color(0xFF2D3436),
              ),
              SizedBox(height: 4.h),
              Text(
                category['name'] as String,
                style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  color: const Color(0xFF2D3436),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPopularDeals() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2, // Reduced from 3 to 2 items
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Deal Image
              Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B35).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.restaurant,
                  size: 32.sp,
                  color: const Color(0xFFFF6B35),
                ),
              ),
              
              SizedBox(width: 12.w),
              
              // Deal Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Special Deal ${index + 1}',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF2D3436),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Get amazing discounts on your favorite food',
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: const Color(0xFF636E72),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF6B35),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            '30% OFF',
                            style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          '\$${(15.99 - (15.99 * 0.3)).toStringAsFixed(2)}',
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2D3436),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h), // Reduced from 16h to 8h
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(Icons.home, 'Home', true),
          _buildNavItem(Icons.search, 'Search', false),
          _buildNavItem(Icons.favorite_border, 'Favorites', false),
          _buildNavItem(Icons.person, 'Profile', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 24.sp,
          color: isActive ? const Color(0xFFFF6B35) : const Color(0xFF636E72),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 10.sp,
            color: isActive ? const Color(0xFFFF6B35) : const Color(0xFF636E72),
          ),
        ),
      ],
    );
  }

  void _showProfileMenu(BuildContext context) {
    final authBloc = ServiceLocator.get<AuthBloc>();
    
    showModalBottomSheet(
      context: context,
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
            
            // Profile Options
            ListTile(
              leading: Icon(Icons.person, size: 20.sp),
              title: Text(
                'My Profile',
                style: GoogleFonts.poppins(fontSize: 14.sp),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            
            ListTile(
              leading: Icon(Icons.settings, size: 20.sp),
              title: Text(
                'Settings',
                style: GoogleFonts.poppins(fontSize: 14.sp),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            
            ListTile(
              leading: Icon(Icons.help_outline, size: 20.sp),
              title: Text(
                'Help & Support',
                style: GoogleFonts.poppins(fontSize: 14.sp),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            
            Divider(height: 24.h),
            
            ListTile(
              leading: Icon(Icons.logout, size: 20.sp, color: Colors.red),
              title: Text(
                'Logout',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                authBloc.add(const AuthEvent.logoutRequested());
              },
            ),
          ],
        ),
      ),
    );
  }
}
