import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class DealDetailsBottomBar extends StatelessWidget {
  final DealEntity deal;
  final VoidCallback onAddToCart;
  final VoidCallback onReserve;

  const DealDetailsBottomBar({
    super.key,
    required this.deal,
    required this.onAddToCart,
    required this.onReserve,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppText.bodySmall('Total Price', color: Color(0xFF6B7280)),
                Row(
                  children: [
                    AppText.title(
                      'NPR ${deal.discountedPrice.toStringAsFixed(0)}',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF111827),
                    ),
                    SizedBox(width: 6.w),
                    AppText.bodySmall(
                      'NPR ${deal.originalPrice.toStringAsFixed(0)}',
                      color: const Color(0xFF9CA3AF),
                      decoration: TextDecoration.lineThrough,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: AppButton(
                label: 'Add to Cart',
                variant: AppButtonVariant.outlined,
                onPressed: onAddToCart,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: AppButton(
                label: 'Reserve Now',
                onPressed: onReserve,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
