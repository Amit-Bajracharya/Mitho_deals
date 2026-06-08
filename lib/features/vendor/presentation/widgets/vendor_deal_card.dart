import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class VendorDealCard extends StatelessWidget {
  final DealEntity deal;

  const VendorDealCard({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(symbol: 'Rs. ', decimalDigits: 0);

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
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            child: deal.imageUrl.isNotEmpty
                ? Image.network(
                    deal.imageUrl,
                    height: 180.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _imagePlaceholder(),
                  )
                : _imagePlaceholder(),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppText.title(deal.foodName, fontSize: 18.sp, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: deal.isAvailable ? Colors.green[100] : Colors.red[100],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: AppText.caption(
                        deal.isAvailable ? 'ACTIVE' : 'SOLD OUT',
                        fontWeight: FontWeight.w700,
                        color: deal.isAvailable ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    AppText.title(
                      currencyFormat.format(deal.discountedPrice),
                      color: AppTheme.primaryOrange,
                      fontSize: 20.sp,
                    ),
                    SizedBox(width: 8.w),
                    AppText.body(
                      currencyFormat.format(deal.originalPrice),
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                    const Spacer(),
                    AppText.bodySmall('${deal.availablePortions} left', color: Colors.grey[600]),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16.sp, color: Colors.grey),
                    SizedBox(width: 4.w),
                    AppText.bodySmall(
                      'Pickup: ${DateFormat('MMM d, h:mm a').format(deal.pickupStartTime)} - ${DateFormat('h:mm a').format(deal.pickupEndTime)}',
                      color: Colors.grey[600],
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

  Widget _imagePlaceholder() {
    return Container(
      height: 180.h,
      color: Colors.grey[200],
      child: Icon(Icons.fastfood, color: Colors.grey),
    );
  }
}
