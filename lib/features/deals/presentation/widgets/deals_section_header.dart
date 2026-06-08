import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class DealsSectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  const DealsSectionHeader({
    super.key,
    required this.title,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText.body(title, fontWeight: FontWeight.w700, color: const Color(0xFF1F2937)),
        if (actionLabel != null)
          GestureDetector(
            onTap: onAction,
            child: AppText.caption(actionLabel!, color: AppTheme.primaryOrange, fontWeight: FontWeight.w600),
          ),
      ],
    );
  }
}
