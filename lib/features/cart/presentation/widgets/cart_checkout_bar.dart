import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';
import '../../domain/entity/cart_item.dart';

class CartCheckoutBar extends StatelessWidget {
  final List<CartItem> items;

  const CartCheckoutBar({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final total = items.fold<double>(0, (sum, item) => sum + (item.discountedPrice * item.quantity));
    final currencyFormat = NumberFormat.currency(symbol: 'Rs. ', decimalDigits: 0);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.subtitle('Total (${items.length} items)', fontWeight: FontWeight.w500),
                AppText.headline(
                  currencyFormat.format(total),
                  fontWeight: FontWeight.w800,
                  color: AppTheme.primaryOrange,
                ),
              ],
            ),
            const Spacer(),
            AppButton(
              label: 'Checkout',
              size: AppButtonSize.compact,
              width: null,
              onPressed: () {
                AppSnackBar.showInfo(context, 'Checkout feature coming soon!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
