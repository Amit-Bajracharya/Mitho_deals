import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:mitho_deals/core/constants/route_constants.dart';
import 'package:mitho_deals/feature/deals/domain/entitiy/deal_entity.dart';
import 'package:intl/intl.dart';

class DealCardWidget extends StatelessWidget {
  final DealEntity deal;
  final VoidCallback onClaim;

  const DealCardWidget({
    super.key,
    required this.deal,
    required this.onClaim,
  });

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('HH:mm');
    final startTimeString = timeFormat.format(deal.pickupStartTime.toLocal());
    final endTimeString = timeFormat.format(deal.pickupEndTime.toLocal());
    final pickupWindow = '$startTimeString - $endTimeString';
    
    final isSoldOut = deal.availablePortions <= 0;
    
    // Calculate save percentage
    int savePercent = 0;
    if (deal.originalPrice > 0) {
      savePercent = (((deal.originalPrice - deal.discountedPrice) / deal.originalPrice) * 100).round();
    }

    // A mock rating for now, later you can add it to DealEntity
    const rating = '4.8';

    return GestureDetector(
      onTap: isSoldOut ? null : () {
        context.push(RouteConstants.dealDetails, extra: deal);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Half: Image & Badges
            Stack(
              children: [
                // Deal Image
                Container(
                  height: 180.h,
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

                // Top Left: Orange Discount Badge
                Positioned(
                  bottom: 12.h,
                  left: 12.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF97316),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      '$savePercent% OFF',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),

                // Top Right: Portions Left Pill
                Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.local_fire_department, // Flame or circle icon
                          size: 12.sp,
                          color: const Color(0xFFF97316),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          isSoldOut ? 'Sold out soon' : '${deal.availablePortions} left',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFF97316),
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

            // Bottom Half: Text Details
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row 1: Restaurant Name & Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          deal.vendorId.substring(0, deal.vendorId.length > 10 ? 10 : deal.vendorId.length) + ' Bakery', // Mock restaurant name if vendor details aren't joined
                          style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF1F2937),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.star, size: 14.sp, color: const Color(0xFFF97316)),
                          SizedBox(width: 4.w),
                          Text(
                            rating,
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFF97316),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  
                  // Row 2: Food Name (Subtitle)
                  Text(
                    deal.foodName,
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  
                  SizedBox(height: 12.h),

                  // Row 3: Original Price & "PICKUP WINDOW"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rs. ${deal.originalPrice.toStringAsFixed(0)}',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: Colors.grey[400],
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'PICKUP WINDOW',
                        style: GoogleFonts.poppins(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[400],
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 2.h),

                  // Row 4: Discounted Price & Time Pill
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rs. ${deal.discountedPrice.toStringAsFixed(0)}',
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFF97316), // Orange
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6), // Note: very light grey
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Text(
                          pickupWindow,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF374151), // Dark Grey text
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
