import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:mitho_deals/core/constants/route_constants.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';
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
    
    int savePercent = 0;
    if (deal.originalPrice > 0) {
      savePercent = (((deal.originalPrice - deal.discountedPrice) / deal.originalPrice) * 100).round();
    }

    const rating = '4.8';

    return GestureDetector(
      onTap: isSoldOut ? null : () {
        context.push(RouteConstants.dealDetails, extra: deal);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h), // Smaller margin
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 140.h, // Smaller box height
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
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
                          child: Icon(Icons.fastfood, size: 32.sp, color: Colors.grey[200]),
                        )
                      : null,
                ),
                Positioned(
                  bottom: 8.h,
                  left: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF97316),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      '$savePercent% OFF',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 8.sp, // Slim text
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.local_fire_department, size: 10.sp, color: const Color(0xFFF97316)),
                        SizedBox(width: 3.w),
                        Text(
                          isSoldOut ? 'Sold' : '${deal.availablePortions} left',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFF97316),
                            fontSize: 9.sp, // Slim text
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.w), // Smaller padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          deal.vendorName,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp, // Smaller title
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF1F2937),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, size: 10.sp, color: const Color(0xFFF97316)),
                          SizedBox(width: 3.w),
                          Text(
                            rating,
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFF97316),
                              fontSize: 10.sp, // Slim text
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    deal.foodName,
                    style: GoogleFonts.poppins(
                      fontSize: 9.sp, // Normal text at 9sp
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NPR ${deal.originalPrice.toStringAsFixed(0)}',
                            style: GoogleFonts.poppins(
                              fontSize: 8.sp,
                              color: Colors.grey[400],
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Text(
                            'NPR ${deal.discountedPrice.toStringAsFixed(0)}',
                            style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF111827),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'PICKUP',
                              style: GoogleFonts.poppins(
                                fontSize: 6.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[500],
                                letterSpacing: 0.5,
                              ),
                            ),
                            Text(
                              pickupWindow,
                              style: GoogleFonts.poppins(
                                fontSize: 9.sp, // Normal text at 9sp
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
