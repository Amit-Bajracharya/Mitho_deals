import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class VendorAppBar extends StatelessWidget implements PreferredSizeWidget {
  const VendorAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          CircleAvatar(
            radius: 16.r,
            backgroundColor: const Color(0xFFFFEAD1),
            child: Icon(Icons.bakery_dining, color: Colors.brown, size: 18.sp),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.headline('Mitho Bakery', fontWeight: FontWeight.w700, color: Colors.black),
              AppText.caption('VERIFIED', fontWeight: FontWeight.w600, color: Colors.grey),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_none_rounded, color: Colors.black, size: 20.sp),
        ),
        SizedBox(width: 8.w),
      ],
    );
  }
}
