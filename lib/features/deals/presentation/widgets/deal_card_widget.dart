import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mitho_deals/core/constants/route_constants.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

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
      onTap: isSoldOut
          ? null
          : () {
              context.push(RouteConstants.dealDetails, extra: deal);
            },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
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
                  height: 140.h,
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
                      ? Center(child: Icon(Icons.fastfood, size: 32.sp, color: Colors.grey[200]))
                      : null,
                ),
                Positioned(
                  bottom: 8.h,
                  left: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryOrange,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: AppText.caption(
                      '$savePercent% OFF',
                      color: Colors.white,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w700,
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
                        Icon(Icons.local_fire_department, size: 10.sp, color: AppTheme.primaryOrange),
                        SizedBox(width: 3.w),
                        AppText.subtitle(
                          isSoldOut ? 'Sold' : '${deal.availablePortions} left',
                          color: AppTheme.primaryOrange,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppText.body(
                          deal.vendorName,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1F2937),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, size: 10.sp, color: AppTheme.primaryOrange),
                          SizedBox(width: 3.w),
                          AppText.caption(rating, color: AppTheme.primaryOrange, fontWeight: FontWeight.w600),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  AppText.subtitle(
                    deal.foodName,
                    fontWeight: FontWeight.w500,
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
                          AppText.caption(
                            'NPR ${deal.originalPrice.toStringAsFixed(0)}',
                            color: Colors.grey[400],
                            fontSize: 8.sp,
                            decoration: TextDecoration.lineThrough,
                          ),
                          AppText.body(
                            'NPR ${deal.discountedPrice.toStringAsFixed(0)}',
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF111827),
                            fontSize: 14.sp,
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
                            AppText.caption(
                              'PICKUP',
                              fontSize: 6.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[500],
                            ),
                            AppText.subtitle(
                              pickupWindow,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF374151),
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
