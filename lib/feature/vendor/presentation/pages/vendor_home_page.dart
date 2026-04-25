import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitho_deals/feature/vendor/domain/entities/vendor_stats.dart';
import 'package:mitho_deals/feature/vendor/presentation/pages/vendor_inventory_page.dart';
import '../bloc/vendor_bloc.dart';
import '../../../../core/dependency_injection/vendor_dependencies.dart';

class VendorHomePage extends StatefulWidget {
  const VendorHomePage({super.key});

  @override
  State<VendorHomePage> createState() => _VendorHomePageState();
}

class _VendorHomePageState extends State<VendorHomePage> {
  int _currentIndex = 0;

  void _onNavTapped(int index) {
    if (index == 2) return;
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = sl<VendorBloc>();
        bloc.add(const VendorEvent.loadDashboard());
        return bloc;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: _buildAppBar(),
        body: BlocBuilder<VendorBloc, VendorState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: Text('Initializing...')),
              loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 2)),
              loaded: (stats, orders) => _buildContent(stats, orders),
              error: (message) => Center(child: Text('Error: $message')),
            );
          },
        ),
        bottomNavigationBar: _buildBottomNav(),
      ),
    );
  }

  Widget _buildContent(VendorStats stats, List orders) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatsSection(stats),
          SizedBox(height: 16.h),
          _buildScanButton(),
          SizedBox(height: 24.h),
          _buildSectionHeader('Current Pickups', orders.length),
          SizedBox(height: 12.h),
          ...orders.map((order) => _buildOrderCard(
            orderId: order.id,
            items: order.dealId,
            customer: "Customer",
            arrivalTime: "12:00",
          )).toList(),
          if (orders.isEmpty) _buildEmptyState('No active pickups'),
          SizedBox(height: 24.h),
          _buildSectionHeader('Recent Reviews', null),
          SizedBox(height: 12.h),
          _buildReviewCard(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          CircleAvatar(radius: 16.r, backgroundColor: const Color(0xFFFFEAD1), child: Icon(Icons.bakery_dining, color: Colors.brown, size: 18.sp)),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mitho Bakery', style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.black)),
              Text('VERIFIED', style: GoogleFonts.poppins(fontSize: 8.sp, fontWeight: FontWeight.w600, color: Colors.grey)),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none_rounded, color: Colors.black, size: 20.sp)),
        SizedBox(width: 8.w),
      ],
    );
  }

  Widget _buildStatsSection(VendorStats stats) {
    return Row(
      children: [
        Expanded(child: _buildStatCard(title: "REVENUE", value: "Rs.${stats.todayRevenue.toFixed(0)}", trend: "+14%", icon: Icons.wallet_outlined, color: const Color(0xFFFF6B35))),
        SizedBox(width: 12.w),
        Expanded(child: _buildStatCard(title: "SAVED", value: "${stats.totalItemsSaved}", trend: "+${stats.totalItemsSaved}", icon: Icons.eco_outlined, color: Colors.green)),
      ],
    );
  }

  Widget _buildStatCard({required String title, required String value, required String trend, required IconData icon, required Color color}) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.r), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: GoogleFonts.poppins(fontSize: 8.sp, fontWeight: FontWeight.w600, color: Colors.grey)),
              Icon(icon, color: color.withOpacity(0.4), size: 12.sp),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w700)),
              SizedBox(width: 4.w),
              Text(trend, style: GoogleFonts.poppins(fontSize: 9.sp, fontWeight: FontWeight.w600, color: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScanButton() {
    return Container(
      width: double.infinity,
      height: 50.h, // Slimmer btn
      decoration: BoxDecoration(
        color: const Color(0xFFFF6B35),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: const Color(0xFFFF6B35).withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.qr_code_scanner_rounded, color: Colors.white, size: 20.sp),
          SizedBox(width: 8.w),
          Text('Scan for Pickup', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, int? count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: GoogleFonts.poppins(fontSize: 15.sp, fontWeight: FontWeight.w700, color: const Color(0xFF2D3436))),
        if (count != null) Text('$count ACTIVE', style: GoogleFonts.poppins(fontSize: 8.sp, fontWeight: FontWeight.w700, color: const Color(0xFFFF6B35))),
      ],
    );
  }

  Widget _buildOrderCard({required String orderId, required String items, required String customer, required String arrivalTime}) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey[200]!), borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('#$orderId', style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w700)),
              Row(children: [
                Icon(Icons.access_time_filled_rounded, color: Colors.orange[400], size: 14.sp),
                SizedBox(width: 4.w),
                Text(arrivalTime, style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w700)),
              ]),
            ],
          ),
          SizedBox(height: 4.h),
          Text(items, style: GoogleFonts.poppins(fontSize: 11.sp, color: Colors.grey[600])),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(customer, style: GoogleFonts.poppins(fontSize: 11.sp, fontWeight: FontWeight.w500)),
              TextButton(onPressed: () {}, child: Text('Details', style: GoogleFonts.poppins(fontSize: 11.sp, color: const Color(0xFFFF6B35)))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(String msg) {
    return Center(child: Text(msg, style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey)));
  }

  Widget _buildReviewCard() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: List.generate(5, (i) => Icon(Icons.star_rounded, color: Colors.amber, size: 14.sp))),
          SizedBox(height: 8.h),
          Text('"Delicious deals!"', style: GoogleFonts.poppins(fontSize: 11.sp, fontStyle: FontStyle.italic)),
          SizedBox(height: 4.h),
          Text('- ROHAN', style: GoogleFonts.poppins(fontSize: 8.sp, fontWeight: FontWeight.w700, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 64.h, // Slimmer nav
      decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, -2))]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.grid_view_rounded, 'Home', 0),
          _buildNavItem(Icons.receipt_long_rounded, 'Orders', 1),
          _buildNavItem(Icons.inventory_2_rounded, 'Inv', 3), // Shorter label
          _buildNavItem(Icons.person_rounded, 'Me', 4), // Shorter label
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () => index == 3 ? Navigator.push(context, MaterialPageRoute(builder: (_) => const VendorInventoryPage())) : _onNavTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20.sp, color: isActive ? const Color(0xFFFF6B35) : Colors.grey[400]),
          Text(label, style: GoogleFonts.poppins(fontSize: 9.sp, fontWeight: isActive ? FontWeight.w600 : FontWeight.w500, color: isActive ? const Color(0xFFFF6B35) : Colors.grey)),
        ],
      ),
    );
  }
}

extension DoubleExt on double { String toFixed(int d) => toStringAsFixed(d); }
