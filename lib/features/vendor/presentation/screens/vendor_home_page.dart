import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/features/vendor/domain/entities/vendor_stats.dart';
import 'package:mitho_deals/features/vendor/presentation/widgets/vendor_app_bar.dart';
import 'package:mitho_deals/features/vendor/presentation/widgets/vendor_bottom_nav.dart';
import 'package:mitho_deals/features/vendor/presentation/widgets/vendor_order_card.dart';
import 'package:mitho_deals/features/vendor/presentation/widgets/vendor_review_card.dart';
import 'package:mitho_deals/features/vendor/presentation/widgets/vendor_stat_card.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

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
        appBar: const VendorAppBar(),
        body: BlocBuilder<VendorBloc, VendorState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: AppText.body('Initializing...')),
              loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 2)),
              loaded: (stats, orders) => _buildContent(stats, orders),
              error: (message) => Center(child: AppText.error('Error: $message')),
            );
          },
        ),
        bottomNavigationBar: VendorBottomNav(currentIndex: _currentIndex, onTap: _onNavTapped),
      ),
    );
  }

  Widget _buildContent(VendorStats stats, List orders) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: VendorStatCard(
                  title: 'REVENUE',
                  value: 'Rs.${stats.todayRevenue.toStringAsFixed(0)}',
                  trend: '+14%',
                  icon: Icons.wallet_outlined,
                  color: AppTheme.primaryOrange,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: VendorStatCard(
                  title: 'SAVED',
                  value: '${stats.totalItemsSaved}',
                  trend: '+${stats.totalItemsSaved}',
                  icon: Icons.eco_outlined,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          AppButton(
            label: 'Scan for Pickup',
            icon: Icons.qr_code_scanner_rounded,
            onPressed: () {},
          ),
          SizedBox(height: 24.h),
          _buildSectionHeader('Current Pickups', orders.length),
          SizedBox(height: 12.h),
          ...orders.map(
            (order) => VendorOrderCard(
              orderId: order.id,
              items: order.dealId,
              customer: 'Customer',
              arrivalTime: '12:00',
            ),
          ),
          if (orders.isEmpty) Center(child: AppText.body('No active pickups', color: Colors.grey)),
          SizedBox(height: 24.h),
          _buildSectionHeader('Recent Reviews', null),
          SizedBox(height: 12.h),
          const VendorReviewCard(),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, int? count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText.body(title, fontSize: 15.sp, fontWeight: FontWeight.w700, color: const Color(0xFF2D3436)),
        if (count != null)
          AppText.caption('$count ACTIVE', fontWeight: FontWeight.w700, color: AppTheme.primaryOrange),
      ],
    );
  }
}
