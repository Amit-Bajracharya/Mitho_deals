import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/feature/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/feature/deals/presentation/bloc/deals_bloc.dart';
import 'package:mitho_deals/feature/deals/presentation/widgets/deals_app_bar.dart';
import 'package:mitho_deals/feature/deals/presentation/widgets/deals_search_bar.dart';
import 'package:mitho_deals/feature/deals/presentation/widgets/deals_category_list.dart';
import 'package:mitho_deals/feature/deals/presentation/widgets/deal_card_widget.dart';
import 'package:mitho_deals/feature/deals/presentation/widgets/deal_map_widget.dart';

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
        backgroundColor: const Color(0xFFF9FAFB), // Very light grey background
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Fixed Header Section (App Bar, Search)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const Column(
                  children: [
                    DealsAppBar(),
                    DealsSearchBar(),
                  ],
                ),
              ),
              
              // Scrollable Content
              Expanded(
                child: RefreshIndicator(
                  color: const Color(0xFFF97316),
                  onRefresh: () async {
                    _dealsBloc.add(const DealsEvent.loadDeals());
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Categories List (Horizontal Scroll inside)
                        Padding(
                          padding: EdgeInsets.only(left: 16.w, right: 16.w),
                          child: const DealsCategoryList(),
                        ),
                        
                        // Map Section
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: const DealMapWidget(),
                        ),
                        
                        // Section Title: Active Deals
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Active Deals',
                                style: GoogleFonts.poppins(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF1F2937),
                                ),
                              ),
                              Text(
                                'View All',
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFF97316),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        SizedBox(height: 16.h),
                        
                        // List of Deals
                        BlocConsumer<DealsBloc, DealsState>(
                          listener: (context, state) {
                            state.maybeWhen(
                              claimedSuccess: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Meal Reserved Successfully! 🎉'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              },
                              claimedError: (message) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Failed: $message'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                              orElse: () {},
                            );
                          },
                          builder: (context, state) {
                            return state.maybeWhen(
                              loading: () => const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(32.0),
                                  child: CircularProgressIndicator(color: Color(0xFFF97316)),
                                ),
                              ),
                              error: (msg) => Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Text(
                                    'Error: $msg',
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),
                              loaded: (deals) {
                                if (deals.isEmpty) {
                                  return Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: Text(
                                        'No deals available right now 😢',
                                        style: GoogleFonts.poppins(color: Colors.grey),
                                      ),
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(), // Important since it's inside a SingleChildScrollView
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
                                  child: CircularProgressIndicator(color: Color(0xFFF97316)),
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

  // Dialog to confirm how many portions the user wants
  void _confirmClaim(BuildContext context, DealEntity deal) {
    int quantity = 1;
    
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (bottomSheetContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Reserve ${deal.foodName}',
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: quantity > 1
                            ? () => setState(() => quantity--)
                            : null,
                        icon: Icon(Icons.remove_circle_outline, size: 32.sp),
                        color: const Color(0xFFF97316),
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        quantity.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      IconButton(
                        onPressed: quantity < deal.availablePortions
                            ? () => setState(() => quantity++)
                            : null,
                        icon: Icon(Icons.add_circle_outline, size: 32.sp),
                        color: const Color(0xFFF97316),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(bottomSheetContext);
                        _dealsBloc.add(DealsEvent.claimDeal(
                          dealId: deal.id,
                          quantity: quantity,
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF97316),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        'Confirm • NPR ${(deal.discountedPrice * quantity).toStringAsFixed(0)}',
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        );
      },
    );
  }
}
