import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/feature/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/feature/deals/presentation/bloc/deals_bloc.dart';

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
    // Get BLoC from ServiceLocator and fire the LoadDeals event immediately
    _dealsBloc = ServiceLocator.get<DealsBloc>();
    _dealsBloc.add(const DealsEvent.loadDeals());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _dealsBloc,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F8F8),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Nearby Deals',
            style: GoogleFonts.poppins(
              color: const Color(0xFF2D3436),
              fontWeight: FontWeight.w600,
            ),
          ),
          iconTheme: const IconThemeData(color: Color(0xFF2D3436)),
        ),
        body: BlocConsumer<DealsBloc, DealsState>(
          listener: (context, state) {
            // Listen for one-off events like success or error dialogs
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
          // Build the UI based on the current state
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFFFF6B35))),
              error: (msg) => Center(child: Text('Error: $msg', style: const TextStyle(color: Colors.red))),
              loaded: (deals) {
                if (deals.isEmpty) {
                  return Center(
                    child: Text(
                      'No deals available right now 😢',
                      style: GoogleFonts.poppins(color: Colors.grey),
                    ),
                  );
                }
                return RefreshIndicator(
                  color: const Color(0xFFFF6B35),
                  onRefresh: () async {
                    _dealsBloc.add(const DealsEvent.loadDeals());
                  },
                  child: ListView.builder(
                    padding: EdgeInsets.all(16.w),
                    itemCount: deals.length,
                    itemBuilder: (context, index) {
                      final deal = deals[index];
                      return _buildDealCard(context, deal);
                    },
                  ),
                );
              },
              // For initial or any unhandled state, show a loading spinner
              orElse: () => const Center(child: CircularProgressIndicator(color: Color(0xFFFF6B35))),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDealCard(BuildContext context, DealEntity deal) {
    // Format the dates to readable times (e.g., 9:00 PM - 10:00 PM)
    final timeFormat = DateFormat('h:mm a');
    final startTime = timeFormat.format(deal.pickupStartTime.toLocal());
    final endTime = timeFormat.format(deal.pickupEndTime.toLocal());
    final isSoldOut = deal.availablePortions <= 0;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
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
          // Header Image & Badge
          Stack(
            children: [
              Container(
                height: 140.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                  color: Colors.grey[200],
                  image: deal.imageUrl.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(deal.imageUrl),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: deal.imageUrl.isEmpty
                    ? Center(
                        child: Icon(Icons.fastfood, size: 48.sp, color: Colors.grey[400]),
                      )
                    : null,
              ),
              // Portions left badge
              Positioned(
                top: 12.h,
                left: 12.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: isSoldOut ? Colors.grey : const Color(0xFFFF6B35),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.inventory_2, size: 14.sp, color: Colors.white),
                      SizedBox(width: 4.w),
                      Text(
                        isSoldOut ? 'Sold Out' : '${deal.availablePortions} left',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Details Section
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        deal.foodName,
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2D3436),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      'Rs. ${deal.discountedPrice.toStringAsFixed(0)}',
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF4CAF50),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      'Was Rs. ${deal.originalPrice.toStringAsFixed(0)}',
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        'Save ${(((deal.originalPrice - deal.discountedPrice) / deal.originalPrice) * 100).toStringAsFixed(0)}%',
                        style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 12.h),
                
                // Pickup Time Box
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F8FF),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.blue.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.access_time_filled, color: Colors.blue, size: 20.sp),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pick up today',
                            style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              color: Colors.blue[700],
                            ),
                          ),
                          Text(
                            '$startTime - $endTime',
                            style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF2D3436),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 16.h),
                
                // Claim Button
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: isSoldOut
                        ? null // Disabled if sold out
                        : () => _confirmClaim(context, deal),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6B35),
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      isSoldOut ? 'Sold Out' : 'Reserve Meal',
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
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
                        color: const Color(0xFFFF6B35),
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
                        color: const Color(0xFFFF6B35),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(bottomSheetContext); // Close bottom sheet
                        // Fire BLoC event
                        _dealsBloc.add(DealsEvent.claimDeal(
                          dealId: deal.id,
                          quantity: quantity,
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF6B35),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        'Confirm • Rs. ${(deal.discountedPrice * quantity).toStringAsFixed(0)}',
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
