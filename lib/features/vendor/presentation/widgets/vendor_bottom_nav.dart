import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/features/vendor/presentation/screens/vendor_inventory_page.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class VendorBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const VendorBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(icon: Icons.grid_view_rounded, label: 'Home', index: 0, currentIndex: currentIndex, onTap: onTap),
          _NavItem(icon: Icons.receipt_long_rounded, label: 'Orders', index: 1, currentIndex: currentIndex, onTap: onTap),
          _NavItem(
            icon: Icons.inventory_2_rounded,
            label: 'Inv',
            index: 3,
            currentIndex: currentIndex,
            onTap: (_) => Navigator.push(context, MaterialPageRoute(builder: (_) => const VendorInventoryPage())),
          ),
          _NavItem(icon: Icons.person_rounded, label: 'Me', index: 4, currentIndex: currentIndex, onTap: onTap),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20.sp, color: isActive ? AppTheme.primaryOrange : Colors.grey[400]),
          AppText.subtitle(
            label,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            color: isActive ? AppTheme.primaryOrange : Colors.grey,
          ),
        ],
      ),
    );
  }
}
