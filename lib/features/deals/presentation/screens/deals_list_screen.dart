import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/features/deals/presentation/bloc/deals_bloc.dart';
import 'package:mitho_deals/features/deals/presentation/bloc/deals_event.dart';
import 'package:mitho_deals/features/deals/presentation/bloc/deals_state.dart';
import 'package:mitho_deals/features/deals/presentation/widgets/deal_card_widget.dart';
import 'package:mitho_deals/features/deals/presentation/widgets/deal_map_widget.dart';
import 'package:mitho_deals/features/deals/presentation/widgets/deals_app_bar.dart';
import 'package:mitho_deals/features/deals/presentation/widgets/deals_category_list.dart';
import 'package:mitho_deals/features/deals/presentation/widgets/deals_search_bar.dart';
import 'package:mitho_deals/features/deals/presentation/widgets/deals_section_header.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/sheets/quantity_selector_sheet.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class DealsListScreen extends StatefulWidget {
  const DealsListScreen({super.key});

  @override
  State<DealsListScreen> createState() => _DealsListScreenState();
}

class _DealsListScreenState extends State<DealsListScreen> {
  late final DealsBloc _dealsBloc;

  @override
  void initState() {
    super.initState();
    _dealsBloc = ServiceLocator.get<DealsBloc>();
    _dealsBloc.add(const DealsEvent.loadDeals());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _dealsBloc,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const Column(
                  children: [
                    DealsAppBar(),
                    DealsSearchBar(),
                  ],
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  color: AppTheme.primaryOrange,
                  onRefresh: () async {
                    _dealsBloc.add(const DealsEvent.loadDeals());
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.w, right: 16.w),
                          child: const DealsCategoryList(),
                        ),
                        BlocBuilder<DealsBloc, DealsState>(
                          builder: (context, state) {
                            final deals = state.maybeWhen(loaded: (d) => d, orElse: () => <DealEntity>[]);
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: DealMapWidget(deals: deals),
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: const DealsSectionHeader(title: 'Active Deals', actionLabel: 'View All'),
                        ),
                        SizedBox(height: 12.h),
                        BlocConsumer<DealsBloc, DealsState>(
                          listener: (context, state) {
                            state.maybeWhen(
                              claimedSuccess: () => AppSnackBar.showSuccess(context, 'Meal Reserved Successfully! 🎉'),
                              claimedError: (message) => AppSnackBar.showError(context, 'Failed: $message'),
                              orElse: () {},
                            );
                          },
                          builder: (context, state) {
                            return state.maybeWhen(
                              loading: () => const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(32.0),
                                  child: CircularProgressIndicator(color: AppTheme.primaryOrange),
                                ),
                              ),
                              error: (msg) => Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: AppText.error('Error: $msg'),
                                ),
                              ),
                              loaded: (deals) {
                                if (deals.isEmpty) {
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: AppText.body('No deals available right now 😢', color: Colors.grey),
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: deals.length,
                                  itemBuilder: (context, index) {
                                    final deal = deals[index];
                                    return DealCardWidget(
                                      deal: deal,
                                      onClaim: () => _confirmClaim(context, deal),
                                    );
                                  },
                                );
                              },
                              orElse: () => const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(32.0),
                                  child: CircularProgressIndicator(color: AppTheme.primaryOrange),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmClaim(BuildContext context, DealEntity deal) {
    QuantitySelectorSheet.show(
      context,
      title: 'Reserve ${deal.foodName}',
      maxQuantity: deal.availablePortions,
      confirmLabel: 'Confirm • NPR ${deal.discountedPrice.toStringAsFixed(0)}',
      onConfirm: (quantity) {
        _dealsBloc.add(DealsEvent.claimDeal(dealId: deal.id, quantity: quantity));
      },
    );
  }
}
