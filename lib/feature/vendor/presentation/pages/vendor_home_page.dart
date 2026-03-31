import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitho_deals/feature/vendor/domain/entities/vendor_stats.dart';
import '../bloc/vendor_bloc.dart';
import '../../../../core/dependency_injection/vendor_dependencies.dart';

class VendorHomePage extends StatefulWidget {
  const VendorHomePage({super.key});

  @override
  State<VendorHomePage> createState() => _VendorHomePageState();
}

class _VendorHomePageState extends State<VendorHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<VendorBloc>().add(const VendorEvent.loadDashboard());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<VendorBloc>(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: _buildAppBar(),
        body: BlocBuilder<VendorBloc, VendorState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: Text('Initializing...')),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (stats, orders) => _buildContent(stats, orders),
              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: $message'),
                    ElevatedButton(
                      onPressed: () {
                        context.read<VendorBloc>().add(const VendorEvent.loadDashboard());
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: _buildBottomNav(),
      ),
    );
  }

  Widget _buildContent(VendorStats stats, List orders) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatsSection(stats),
          SizedBox(height: 24.h),
          _buildScanButton(),
          SizedBox(height: 32.h),
          _buildCurrentPickupsHeader(orders.length),
          SizedBox(height: 16.h),
          ...orders.map((order) => _buildOrderCard(
            orderId: order.id,
            items: order.dealId, // You might want to enhance this with deal details
            customer: "Customer", // You might want to add customer info to order
            arrivalTime: "12:00", // You might want to add pickup time to order
          )).toList(),
          if (orders.isEmpty) 
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32.h),
              child: Center(
                child: Text(
                  'No active pickups',
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
          SizedBox(height: 32.h),
          _buildRecentReviewsHeader(),
          SizedBox(height: 16.h),
          _buildReviewCard(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: const Color(0xFFFFEAD1),
            child: Icon(Icons.bakery_dining, color: Colors.brown, size: 24.sp),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mitho Bakery',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              Text(
                'VERIFIED VENDOR',
                style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Icon(Icons.notifications_none_rounded, color: Colors.blueGrey[800], size: 22.sp),
          ),
        ),
        SizedBox(width: 8.w),
      ],
    );
  }

  Widget _buildStatsSection(VendorStats stats) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            title: "TODAY'S REVENUE",
            value: "Rs. ${stats.todayRevenue.toStringAsFixed(0)}",
            trend: "+14%",
            icon: Icons.account_balance_wallet_outlined,
            color: const Color(0xFFFF6B35),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: _buildStatCard(
            title: "ITEMS SAVED",
            value: "${stats.totalItemsSaved}",
            trend: "+${stats.totalItemsSaved}",
            icon: Icons.eco_outlined,
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String trend,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              Icon(icon, color: color.withOpacity(0.5), size: 14.sp),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                trend,
                style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScanButton() {
    return Container(
      width: double.infinity,
      height: 70.h,
      decoration: BoxDecoration(
        color: const Color(0xFFFF6B35),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF6B35).withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.qr_code_scanner_rounded, color: Colors.white, size: 28.sp),
          SizedBox(width: 12.w),
          Text(
            'Scan QR for Pickup',
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentPickupsHeader(int orderCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Current Pickups',
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF2D3436),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: const Color(0xFFFFEAD1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            '$orderCount ACTIVE',
            style: GoogleFonts.poppins(
              fontSize: 10.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFFF6B35),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderCard({
    required String orderId,
    required String items,
    required String customer,
    required String arrivalTime,
  }) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: Colors.blue.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order #$orderId',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.access_time_filled_rounded, color: const Color(0xFFFF6B35).withOpacity(0.6), size: 16.sp),
                  SizedBox(width: 4.w),
                  Text(
                    arrivalTime,
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'EST. ARRIVAL',
                style: GoogleFonts.poppins(fontSize: 8.sp, color: Colors.grey, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              items,
              style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.grey[600]),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 12.r,
                    backgroundColor: Colors.blueGrey[50],
                    child: Icon(Icons.person, size: 14.sp, color: Colors.blueGrey),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    customer,
                    style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: const Color(0xFFFF6B35).withOpacity(0.5)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                ),
                child: Text(
                  'View Details',
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFF6B35),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecentReviewsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recent Reviews',
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF2D3436),
          ),
        ),
        Text(
          'See All',
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFFF6B35),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(
                  5,
                  (i) => Icon(Icons.star_rounded, color: Colors.amber, size: 18.sp),
                ),
              ),
              Text(
                'Yesterday',
                style: GoogleFonts.poppins(fontSize: 11.sp, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            '"Love that I could save these delicious pastries from being wasted! Great deal."',
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontStyle: FontStyle.italic,
              color: Colors.blueGrey[800],
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            '- ROHAN P.',
            style: GoogleFonts.poppins(
              fontSize: 11.sp,
              fontWeight: FontWeight.w700,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.grid_view_rounded, 'Home', true),
              _buildNavItem(Icons.receipt_long_rounded, 'Orders', false),
              SizedBox(width: 40.w), // Space for centered QR button
              _buildNavItem(Icons.restaurant_rounded, 'Inventory', false),
              _buildNavItem(Icons.person_rounded, 'Profile', false),
            ],
          ),
          Positioned(
            top: -25.h,
            child: Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                color: const Color(0xFFFF6B35),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF6B35).withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(Icons.qr_code_scanner_rounded, color: Colors.white, size: 28.sp),
            ),
          ),
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
          color: isActive ? const Color(0xFFFF6B35) : Colors.grey[400],
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 11.sp,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            color: isActive ? const Color(0xFFFF6B35) : Colors.grey,
          ),
        ),
      ],
    );
  }
}
