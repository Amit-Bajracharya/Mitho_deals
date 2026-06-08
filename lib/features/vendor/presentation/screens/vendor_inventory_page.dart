import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/features/deals/presentation/bloc/deals_bloc.dart';
import 'package:mitho_deals/features/deals/presentation/bloc/deals_event.dart';
import 'package:mitho_deals/features/deals/presentation/bloc/deals_state.dart';
import 'package:mitho_deals/features/vendor/presentation/widgets/vendor_deal_card.dart';
import 'package:mitho_deals/features/vendor/presentation/widgets/vendor_inventory_empty_state.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class VendorInventoryPage extends StatefulWidget {
  const VendorInventoryPage({super.key});

  @override
  State<VendorInventoryPage> createState() => _VendorInventoryPageState();
}

class _VendorInventoryPageState extends State<VendorInventoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = ServiceLocator.get<DealsBloc>();
        bloc.add(const DealsEvent.loadVendorDeals());
        return bloc;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: AppText.title('My Deals', fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.black),
          actions: [
            IconButton(
              onPressed: () => context.push('/add-deal'),
              icon: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppTheme.primaryOrange,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(Icons.add, color: Colors.white, size: 20.sp),
              ),
            ),
            SizedBox(width: 16.w),
          ],
        ),
        body: BlocBuilder<DealsBloc, DealsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (_) => const SizedBox(),
              error: (message) => Center(child: AppText.error('Error: $message')),
              addingDeal: () => const Center(child: CircularProgressIndicator()),
              addDealSuccess: () => const SizedBox(),
              addDealError: (_) => const SizedBox(),
              claimedSuccess: () => const SizedBox(),
              claimedError: (_) => const SizedBox(),
              vendorDealsLoading: () => const Center(child: CircularProgressIndicator()),
              vendorDealsLoaded: (deals) => _buildDealsList(deals),
              vendorDealsError: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.error('Error: $message'),
                    AppButton(
                      label: 'Retry',
                      size: AppButtonSize.compact,
                      width: null,
                      onPressed: () {
                        context.read<DealsBloc>().add(const DealsEvent.loadVendorDeals());
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDealsList(List<DealEntity> deals) {
    if (deals.isEmpty) return const VendorInventoryEmptyState();

    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: deals.length,
      itemBuilder: (context, index) => VendorDealCard(deal: deals[index]),
    );
  }
}
