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

    // A mock rating for now
    const rating = '4.8';

    return GestureDetector(
      onTap: isSoldOut ? null : () {
        context.push(RouteConstants.dealDetails, extra: deal);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
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
                  height: 160.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
                    color: const Color(0xFFF9FAFB),
                    image: deal.imageUrl.isNotEmpty
                        ? DecorationImage(
                            image: NetworkImage(deal.imageUrl),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: deal.imageUrl.isEmpty
                      ? Center(
                          child: Icon(Icons.fastfood, size: 40.sp, color: Colors.grey[300]),
                        )
                      : null,
                ),

                // Bottom Left: Orange Discount Badge
                Positioned(
                  bottom: 10.h,
                  left: 10.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF97316),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      '$savePercent% OFF',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),

                // Top Right: Portions Left Pill
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          size: 11.sp,
                          color: const Color(0xFFF97316),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          isSoldOut ? 'Sold out' : '${deal.availablePortions} left',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFF97316),
                            fontSize: 11.sp,
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
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row 1: Restaurant Name & Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          deal.vendorName,
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
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
                          Icon(Icons.star, size: 12.sp, color: const Color(0xFFF97316)),
                          SizedBox(width: 4.w),
                          Text(
                            rating,
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFF97316),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  
                  // Row 2: Food Name (Subtitle)
                  Text(
                    deal.foodName,
                    style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  SizedBox(height: 12.h),

                  // Row 3: Price & Time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NPR ${deal.originalPrice.toStringAsFixed(0)}',
                            style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              color: Colors.grey[400],
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'NPR ${deal.discountedPrice.toStringAsFixed(0)}',
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF111827),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F2F6),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'PICKUP AT',
                              style: GoogleFonts.poppins(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[500],
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                              pickupWindow,
                              style: GoogleFonts.poppins(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF374151),
                              ),
                            ),
                          ],
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
