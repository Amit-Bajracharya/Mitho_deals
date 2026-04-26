import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/features/deals/presentation/bloc/deals_bloc.dart';
import 'package:mitho_deals/features/deals/presentation/bloc/deals_event.dart';
import 'package:mitho_deals/features/deals/presentation/bloc/deals_state.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

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
        // Load vendor deals when bloc is created
        bloc.add(const DealsEvent.loadVendorDeals());
        return bloc;
      },
      child: Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My Deals',
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        actions: [
          // Add new deal button
          IconButton(
            onPressed: () {
              // Navigate to AddDealScreen
              context.push('/add-deal');
            },
            icon: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: const Color(0xFFFF6B35),
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
            error: (message) => Center(child: Text('Error: $message')),
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
                  Text('Error: $message'),
                  ElevatedButton(
                    onPressed: () {
                      context.read<DealsBloc>().add(const DealsEvent.loadVendorDeals());
                    },
                    child: const Text('Retry'),
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
    if (deals.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox_outlined, size: 64.sp, color: Colors.grey),
            SizedBox(height: 16.h),
            Text(
              'No deals yet',
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Tap + to add your first deal',
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: deals.length,
      itemBuilder: (context, index) {
        final deal = deals[index];
        return _buildDealCard(deal);
      },
    );
  }

  Widget _buildDealCard(DealEntity deal) {
    final currencyFormat = NumberFormat.currency(
      symbol: 'Rs. ',
      decimalDigits: 0,
    );

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Deal Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            child: deal.imageUrl.isNotEmpty
                ? Image.network(
                    deal.imageUrl,
                    height: 180.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 180.h,
                        color: Colors.grey[200],
                        child: Icon(Icons.image_not_supported, color: Colors.grey),
                      );
                    },
                  )
                : Container(
                    height: 180.h,
                    color: Colors.grey[200],
                    child: Icon(Icons.fastfood, color: Colors.grey),
                  ),
          ),
          
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Food name and availability badge
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        deal.foodName,
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: deal.isAvailable ? Colors.green[100] : Colors.red[100],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        deal.isAvailable ? 'ACTIVE' : 'SOLD OUT',
                        style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                          color: deal.isAvailable ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 8.h),
                
                // Price info
                Row(
                  children: [
                    Text(
                      currencyFormat.format(deal.discountedPrice),
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFFF6B35),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      currencyFormat.format(deal.originalPrice),
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${deal.availablePortions} left',
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 12.h),
                
                // Pickup time
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16.sp, color: Colors.grey),
                    SizedBox(width: 4.w),
                    Text(
                      'Pickup: ${DateFormat('MMM d, h:mm a').format(deal.pickupStartTime)} - ${DateFormat('h:mm a').format(deal.pickupEndTime)}',
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
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
  }
}
