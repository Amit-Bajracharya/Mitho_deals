import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';

class DealDetailsHeaderImage extends StatelessWidget {
  final DealEntity deal;

  const DealDetailsHeaderImage({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: 'deal_image_${deal.id}',
          child: Container(
            height: 320.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: deal.imageUrl.isNotEmpty
                  ? DecorationImage(image: NetworkImage(deal.imageUrl), fit: BoxFit.cover)
                  : null,
              color: Colors.grey[200],
            ),
          ),
        ),
        Positioned(
          top: 32.h,
          left: 12.w,
          child: CircleAvatar(
            radius: 18.r,
            backgroundColor: Colors.white,
            child: IconButton(
              iconSize: 18.sp,
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }
}
