import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class DealsCategoryList extends StatelessWidget {
  const DealsCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildCategoryChip(label: 'All', icon: Icons.window, isSelected: true),
            SizedBox(width: 8.w),
            _buildCategoryChip(label: 'Bakery', icon: Icons.bakery_dining, isSelected: false),
            SizedBox(width: 8.w),
            _buildCategoryChip(label: 'Meals', icon: Icons.dinner_dining, isSelected: false),
            SizedBox(width: 8.w),
            _buildCategoryChip(label: 'Grocery', icon: Icons.shopping_basket, isSelected: false),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip({
    required String label,
    required IconData icon,
    required bool isSelected,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primaryOrange : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: isSelected ? null : Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppTheme.primaryOrange.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.sp, color: isSelected ? Colors.white : const Color(0xFF4B5563)),
          SizedBox(width: 6.w),
          AppText.body(
            label,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : const Color(0xFF4B5563),
          ),
        ],
      ),
    );
  }
}
