import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:get_it/get_it.dart';
import 'package:mitho_deals/features/cart/domain/entity/cart_item.dart';
import 'package:mitho_deals/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:mitho_deals/features/cart/presentation/bloc/cart_event.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/features/deals/presentation/bloc/deals_bloc.dart';
import 'package:mitho_deals/features/deals/presentation/bloc/deals_event.dart';

class DealDetailsScreen extends StatefulWidget {
  final DealEntity deal;

  const DealDetailsScreen({super.key, required this.deal});

  @override
  State<DealDetailsScreen> createState() => _DealDetailsScreenState();
}

class _DealDetailsScreenState extends State<DealDetailsScreen> {
  late Timer _timer;
  Duration _timeLeft = Duration.zero;

  @override
  void initState() {
    super.initState();
    _calculateTimeLeft();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _calculateTimeLeft();
    });
  }

  void _calculateTimeLeft() {
    final now = DateTime.now();
    if (mounted) {
      setState(() {
        _timeLeft = widget.deal.pickupEndTime.isAfter(now)
            ? widget.deal.pickupEndTime.difference(now)
            : Duration.zero;
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildContent(),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderImage(),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleSection(),
                SizedBox(height: 16.h),
                _buildTimerSection(),
                SizedBox(height: 20.h),
                _buildDescriptionSection(),
                SizedBox(height: 20.h),
                _buildPickupSection(),
                SizedBox(height: 20.h),
                _buildLocationSection(),
                SizedBox(height: 100.h), // Space for fixed bottom bar
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Stack(
      children: [
        Hero(
          tag: 'deal_image_${widget.deal.id}',
          child: Container(
            height: 320.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: widget.deal.imageUrl.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(widget.deal.imageUrl),
                      fit: BoxFit.cover,
                    )
                  : null,
              color: Colors.grey[200],
            ),
          ),
        ),
        Positioned(
          top: 32.h,
          left: 12.w,
          child: CircleAvatar(
            radius: 18.r,
            backgroundColor: Colors.white,
            child: IconButton(
              iconSize: 18.sp,
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitleSection() {
    final savePercent = widget.deal.originalPrice > 0
        ? (((widget.deal.originalPrice - widget.deal.discountedPrice) /
                    widget.deal.originalPrice) *
                100)
            .round()
        : 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.deal.foodName,
                style: GoogleFonts.poppins(
                  fontSize: 16.sp, // Title at 16sp
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF111827),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                widget.deal.vendorName,
                style: GoogleFonts.poppins(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFF97316),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF7ED),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            'Save $savePercent%',
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFF97316),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimerSection() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.timer_outlined, color: const Color(0xFFF97316), size: 16.sp),
              SizedBox(width: 6.w),
              Text(
                'LIMITED TIME LEFT',
                style: GoogleFonts.poppins(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                  color: const Color(0xFFF97316),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTimeUnit(_timeLeft.inHours.toString().padLeft(2, '0'), 'HOURS'),
              _buildTimeUnit((_timeLeft.inMinutes % 60).toString().padLeft(2, '0'), 'MINS'),
              _buildTimeUnit((_timeLeft.inSeconds % 60).toString().padLeft(2, '0'), 'SECS'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeUnit(String value, String label) {
    return Column(
      children: [
        Container(
          width: 60.w,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: const Color(0xFFF97316),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF9CA3AF),
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF111827),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          widget.deal.description,
          style: GoogleFonts.poppins(
            fontSize: 9.sp, // Normal text at 9sp
            color: const Color(0xFF4B5563),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildPickupSection() {
    final startTime = DateFormat('hh:mm a').format(widget.deal.pickupStartTime);
    final endTime = DateFormat('hh:mm a').format(widget.deal.pickupEndTime);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pickup Window',
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF111827),
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7ED),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(Icons.access_time_filled, color: const Color(0xFFF97316), size: 18.sp),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today, $startTime – $endTime',
                      style: GoogleFonts.poppins(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF111827),
                      ),
                    ),
                    Text(
                      'Arrive within this time window',
                      style: GoogleFonts.poppins(
                        fontSize: 9.sp, // Normal text at 9sp
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Location',
              style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w700, color: const Color(0xFF111827)),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size(0, 30.h)),
              child: Text(
                'Get Directions',
                style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w600, color: const Color(0xFFF97316)),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Container(
          height: 140.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            image: const DecorationImage(
              image: NetworkImage('https://maps.googleapis.com/maps/api/staticmap?center=27.7172,85.3240&zoom=15&size=600x300&markers=color:orange%7C27.7172,85.3240&key='), 
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(8.w),
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: const Color(0xFFF97316), size: 16.sp),
                    SizedBox(width: 6.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.deal.vendorAddress, style: GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w700, color: const Color(0xFF111827))),
                          Text('2.4 km away', style: GoogleFonts.poppins(fontSize: 10.sp, color: const Color(0xFF6B7280))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))]),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Total Price', style: GoogleFonts.poppins(fontSize: 11.sp, color: const Color(0xFF6B7280))),
                Row(
                  children: [
                    Text('NPR ${widget.deal.discountedPrice.toStringAsFixed(0)}', style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w800, color: const Color(0xFF111827))),
                    SizedBox(width: 6.w),
                    Text('NPR ${widget.deal.originalPrice.toStringAsFixed(0)}', style: GoogleFonts.poppins(fontSize: 12.sp, color: const Color(0xFF9CA3AF), decoration: TextDecoration.lineThrough)),
                  ],
                ),
              ],
            ),
            SizedBox(width: 20.w),
            // Add to Cart Button
            Expanded(
              child: OutlinedButton(
                onPressed: () => _showAddToCartSelector(),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFF97316)),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                ),
                child: Text('Add to Cart', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w700, color: const Color(0xFFF97316))),
              ),
            ),
            SizedBox(width: 12.w),
            // Reserve Now Button
            Expanded(
              child: ElevatedButton(
                onPressed: () => _showQuantitySelector(),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF97316), padding: EdgeInsets.symmetric(vertical: 14.h), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r))),
                child: Text('Reserve Now', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w700, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showQuantitySelector() {
    int quantity = 1;
    final dealsBloc = ServiceLocator.get<DealsBloc>();
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.r))),
      builder: (bottomSheetContext) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Portions', style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: quantity > 1 ? () => setModalState(() => quantity--) : null, iconSize: 24.sp, icon: const Icon(Icons.remove_circle_outline, color: Color(0xFFF97316))),
                      SizedBox(width: 16.w),
                      Text(quantity.toString(), style: GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                      SizedBox(width: 16.w),
                      IconButton(onPressed: quantity < widget.deal.availablePortions ? () => setModalState(() => quantity++) : null, iconSize: 24.sp, icon: const Icon(Icons.add_circle_outline, color: Color(0xFFF97316))),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(bottomSheetContext);
                        dealsBloc.add(DealsEvent.claimDeal(dealId: widget.deal.id, quantity: quantity));
                        Navigator.pop(context); 
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF97316), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r))),
                      child: Text('Confirm', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showAddToCartSelector() {
    int quantity = 1;
    final cartBloc = GetIt.instance<CartBloc>();
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.r))),
      builder: (bottomSheetContext) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Add to Cart', style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8.h),
                  Text(widget.deal.foodName, style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.grey[600])),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: quantity > 1 ? () => setModalState(() => quantity--) : null, iconSize: 24.sp, icon: const Icon(Icons.remove_circle_outline, color: Color(0xFFF97316))),
                      SizedBox(width: 16.w),
                      Text(quantity.toString(), style: GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                      SizedBox(width: 16.w),
                      IconButton(onPressed: quantity < widget.deal.availablePortions ? () => setModalState(() => quantity++) : null, iconSize: 24.sp, icon: const Icon(Icons.add_circle_outline, color: Color(0xFFF97316))),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () {
                        final cartItem = CartItem(
                          dealId: widget.deal.id,
                          foodName: widget.deal.foodName,
                          imageUrl: widget.deal.imageUrl,
                          discountedPrice: widget.deal.discountedPrice,
                          quantity: quantity,
                          vendorId: widget.deal.vendorId,
                          vendorName: widget.deal.vendorName,
                          pickupStartTime: widget.deal.pickupStartTime,
                          pickupEndTime: widget.deal.pickupEndTime,
                        );
                        cartBloc.add(CartEvent.addToCart(cartItem));
                        Navigator.pop(bottomSheetContext);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added to cart!', style: GoogleFonts.poppins(fontSize: 13.sp)),
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'View Cart',
                              textColor: Colors.white,
                              onPressed: () => context.push('/cart'),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF97316), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r))),
                      child: Text('Add to Cart', style: GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
