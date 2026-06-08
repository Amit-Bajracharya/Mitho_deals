import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';
import '../../domain/entity/cart_item.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;

  const CartItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(symbol: 'Rs. ', decimalDigits: 0);

    return Container(
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
        children: [
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: item.imageUrl.isNotEmpty
                      ? Image.network(
                          item.imageUrl,
                          width: 60.w,
                          height: 60.w,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => _imagePlaceholder(),
                        )
                      : _imagePlaceholder(),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.body(
                        item.foodName,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF1F2937),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2.h),
                      AppText.subtitle(item.vendorName, fontWeight: FontWeight.w500),
                      SizedBox(height: 6.h),
                      AppText.body(
                        currencyFormat.format(item.discountedPrice),
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primaryOrange,
                        fontSize: 14.sp,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => context.read<CartBloc>().add(CartEvent.removeFromCart(item.dealId)),
                  icon: Icon(Icons.delete_outline, color: Colors.red[300], size: 18.sp),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.r)),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _qtyBtn(
                        Icons.remove,
                        item.quantity > 1
                            ? () => context.read<CartBloc>().add(
                                  CartEvent.updateQuantity(item.dealId, item.quantity - 1),
                                )
                            : null,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: AppText.bodySmall('${item.quantity}', fontWeight: FontWeight.w700),
                      ),
                      _qtyBtn(
                        Icons.add,
                        () => context.read<CartBloc>().add(
                              CartEvent.updateQuantity(item.dealId, item.quantity + 1),
                            ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(Icons.access_time_rounded, size: 10.sp, color: Colors.grey[400]),
                    SizedBox(width: 4.w),
                    AppText.caption(
                      'Pickup: ${DateFormat('h:mm a').format(item.pickupStartTime)}',
                      fontSize: 8.sp,
                      color: Colors.grey[500],
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
      width: 60.w,
      height: 60.w,
      color: Colors.grey[100],
      child: Icon(Icons.fastfood, color: Colors.grey[300], size: 24.sp),
    );
  }

  Widget _qtyBtn(IconData icon, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.w),
        child: Icon(
          icon,
          size: 14.sp,
          color: onTap == null ? Colors.grey[300] : AppTheme.primaryOrange,
        ),
      ),
    );
  }
}
