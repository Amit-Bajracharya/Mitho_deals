import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/feature/orders/domain/entity/order_entity.dart';
import 'package:mitho_deals/feature/orders/presentation/bloc/orders_bloc.dart';
import 'package:mitho_deals/feature/orders/presentation/bloc/orders_event.dart';
import 'package:mitho_deals/feature/orders/presentation/bloc/orders_state.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late OrdersBloc _ordersBloc;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _ordersBloc = ServiceLocator.get<OrdersBloc>();
    _ordersBloc.add(const OrdersEvent.loadMyOrders());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _ordersBloc,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: _buildAppBar(),
        body: Column(
          children: [
            _buildTabBar(),
            Expanded(
              child: BlocBuilder<OrdersBloc, OrdersState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFFF97316), strokeWidth: 1.5,)),
                    error: (message) => Center(child: Text(message, style: GoogleFonts.poppins(color: Colors.red, fontSize: 11.sp))),
                    loaded: (orders) {
                      if (orders.isEmpty) return _buildEmptyState();
                      return TabBarView(
                        controller: _tabController,
                        children: [
                          _buildOrdersList(orders.where((o) => o.status == 'reserved').toList()),
                          _buildOrdersList(orders.where((o) => o.status != 'reserved').toList()),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'My Rescues', // Shorter title
        style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w700, color: const Color(0xFF1F2937)),
      ),
      centerTitle: true,
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        indicatorColor: const Color(0xFFF97316),
        labelColor: const Color(0xFFF97316),
        unselectedLabelColor: Colors.grey,
        indicatorWeight: 2,
        labelStyle: GoogleFonts.poppins(fontSize: 11.sp, fontWeight: FontWeight.w600), // Slim tab label
        tabs: const [Tab(text: 'Active'), Tab(text: 'History')],
      ),
    );
  }

  Widget _buildOrdersList(List<OrderEntity> orders) {
    if (orders.isEmpty) return _buildEmptyState();
    return RefreshIndicator(
      color: const Color(0xFFF97316),
      onRefresh: () async => _ordersBloc.add(const OrdersEvent.loadMyOrders()),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        itemCount: orders.length,
        itemBuilder: (context, index) => _buildOrderCard(orders[index]),
      ),
    );
  }

  Widget _buildOrderCard(OrderEntity order) {
    final deal = order.deal;
    final bool isActive = order.status == 'reserved';

    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  deal?.foodName ?? 'Food Deal',
                  style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w700, color: const Color(0xFF111827)),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(color: isActive ? const Color(0xFFFFF7ED) : Colors.grey[100], borderRadius: BorderRadius.circular(4.r)),
                child: Text(
                  order.status.toUpperCase(),
                  style: GoogleFonts.poppins(fontSize: 8.sp, fontWeight: FontWeight.w700, color: isActive ? const Color(0xFFF97316) : Colors.grey[600]),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Text('From ${order.vendorName}', style: GoogleFonts.poppins(fontSize: 9.sp, color: Colors.grey[500])),
          SizedBox(height: 10.h),
          const Divider(height: 1),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Placed', style: GoogleFonts.poppins(fontSize: 8.sp, color: Colors.grey)),
                  Text(DateFormat('MMM dd, hh:mm a').format(order.orderPlacedTime), style: GoogleFonts.poppins(fontSize: 10.sp, fontWeight: FontWeight.w500)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Paid', style: GoogleFonts.poppins(fontSize: 8.sp, color: Colors.grey)),
                  Text('NPR ${order.totalAmount.toStringAsFixed(0)}', style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          ),
          if (isActive) ...[
            SizedBox(height: 10.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(color: const Color(0xFFF97316).withOpacity(0.04), borderRadius: BorderRadius.circular(8.r), border: Border.all(color: const Color(0xFFF97316).withOpacity(0.1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.qr_code_2_rounded, color: const Color(0xFFF97316), size: 16.sp),
                  SizedBox(width: 6.w),
                  Text('Code: ', style: GoogleFonts.poppins(fontSize: 11.sp, fontWeight: FontWeight.w500)),
                  Text(order.pickupCode, style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w800, color: const Color(0xFFF97316), letterSpacing: 0.5)),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long_outlined, size: 40.sp, color: Colors.grey[300]),
          SizedBox(height: 12.h),
          Text('No orders yet', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.grey)),
          SizedBox(height: 4.h),
          Text('Find deals and they will show up here!', style: GoogleFonts.poppins(fontSize: 9.sp, color: Colors.grey)),
        ],
      ),
    );
  }
}
