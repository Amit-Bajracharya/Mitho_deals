import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class DealDetailsDescriptionSection extends StatelessWidget {
  final String description;

  const DealDetailsDescriptionSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppText.title('Description', fontWeight: FontWeight.w700, color: Color(0xFF111827)),
        SizedBox(height: 8.h),
        AppText.subtitle(description, color: const Color(0xFF4B5563)),
      ],
    );
  }
}
