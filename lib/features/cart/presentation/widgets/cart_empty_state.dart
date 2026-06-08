import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class CartEmptyState extends StatelessWidget {
  const CartEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 60.sp, color: Colors.grey[300]),
          SizedBox(height: 16.h),
          AppText.body('Your cart is empty', fontWeight: FontWeight.w600, color: Colors.grey[600]),
          SizedBox(height: 4.h),
          AppText.subtitle('Add some delicious deals!'),
          SizedBox(height: 24.h),
          AppButton(
            label: 'Browse Deals',
            buttonWidth: AppButtonWidth.inline,
            onPressed: () => context.go('/'),
          ),
        ],
      ),
    );
  }
}
