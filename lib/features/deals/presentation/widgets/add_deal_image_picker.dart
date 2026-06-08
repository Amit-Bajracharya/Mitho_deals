import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class AddDealImagePicker extends StatelessWidget {
  final File? selectedImage;
  final VoidCallback onTap;

  const AddDealImagePicker({
    super.key,
    required this.selectedImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 200.h,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: selectedImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.file(selectedImage!, fit: BoxFit.cover),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_photo_alternate, size: 48.sp, color: Colors.grey),
                  SizedBox(height: 8.h),
                  const AppText.body('Tap to add photo', color: Colors.grey),
                ],
              ),
      ),
    );
  }
}
