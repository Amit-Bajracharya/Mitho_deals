import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../text/app_text.dart';

class AppDividerLabel extends StatelessWidget {
  final String label;

  const AppDividerLabel({super.key, this.label = 'OR'});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: AppText.body(label),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
