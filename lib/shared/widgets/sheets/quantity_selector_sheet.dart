import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class QuantitySelectorSheet extends StatefulWidget {
  final String title;
  final String? subtitle;
  final int maxQuantity;
  final String confirmLabel;
  final ValueChanged<int> onConfirm;

  const QuantitySelectorSheet({
    super.key,
    required this.title,
    this.subtitle,
    required this.maxQuantity,
    required this.confirmLabel,
    required this.onConfirm,
  });

  static Future<void> show(
    BuildContext context, {
    required String title,
    String? subtitle,
    required int maxQuantity,
    required String confirmLabel,
    required ValueChanged<int> onConfirm,
  }) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (_) => QuantitySelectorSheet(
        title: title,
        subtitle: subtitle,
        maxQuantity: maxQuantity,
        confirmLabel: confirmLabel,
        onConfirm: onConfirm,
      ),
    );
  }

  @override
  State<QuantitySelectorSheet> createState() => _QuantitySelectorSheetState();
}

class _QuantitySelectorSheetState extends State<QuantitySelectorSheet> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText.title(widget.title, fontSize: 16.sp),
          if (widget.subtitle != null) ...[
            SizedBox(height: 8.h),
            AppText.body(widget.subtitle!, color: Colors.grey[600]),
          ],
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
                iconSize: 24.sp,
                icon: Icon(Icons.remove_circle_outline, color: AppTheme.primaryOrange),
              ),
              SizedBox(width: 16.w),
              AppText.title('$_quantity', fontSize: 20.sp),
              SizedBox(width: 16.w),
              IconButton(
                onPressed: _quantity < widget.maxQuantity ? () => setState(() => _quantity++) : null,
                iconSize: 24.sp,
                icon: Icon(Icons.add_circle_outline, color: AppTheme.primaryOrange),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          AppButton(
            label: widget.confirmLabel,
            size: AppButtonSize.compact,
            onPressed: () {
              Navigator.pop(context);
              widget.onConfirm(_quantity);
            },
          ),
        ],
      ),
    );
  }
}
