import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/features/orders/domain/entity/order_entity.dart';
import 'package:mitho_deals/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:mitho_deals/features/orders/presentation/bloc/orders_event.dart';
import 'package:mitho_deals/features/orders/presentation/bloc/orders_state.dart';
import 'package:mitho_deals/features/orders/presentation/widgets/order_card_widget.dart';
import 'package:mitho_deals/features/orders/presentation/widgets/orders_empty_state.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: AppText.headline('My Rescues', fontWeight: FontWeight.w700, color: const Color(0xFF1F2937)),
        ),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                indicatorColor: AppTheme.primaryOrange,
                labelColor: AppTheme.primaryOrange,
                unselectedLabelColor: Colors.grey,
                indicatorWeight: 2,
                labelStyle: AppText.resolveStyle(variant: AppTextVariant.bodySmall, fontWeight: FontWeight.w600),
                tabs: const [Tab(text: 'Active'), Tab(text: 'History')],
              ),
            ),
            Expanded(
              child: BlocBuilder<OrdersBloc, OrdersState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const Center(
                      child: CircularProgressIndicator(color: AppTheme.primaryOrange, strokeWidth: 1.5),
                    ),
                    error: (message) => Center(child: AppText.error(message)),
                    loaded: (orders) {
                      if (orders.isEmpty) return const OrdersEmptyState();
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

  Widget _buildOrdersList(List<OrderEntity> orders) {
    if (orders.isEmpty) return const OrdersEmptyState();
    return RefreshIndicator(
      color: AppTheme.primaryOrange,
      onRefresh: () async => _ordersBloc.add(const OrdersEvent.loadMyOrders()),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        itemCount: orders.length,
        itemBuilder: (context, index) => OrderCardWidget(order: orders[index]),
      ),
    );
  }
}
