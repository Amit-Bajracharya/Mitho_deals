import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class VendorMapPickerWidget extends StatelessWidget {
  final dynamic selectedLocation;
  final bool isLoading;
  final VoidCallback onPickLocation;

  const VendorMapPickerWidget({
    super.key,
    required this.selectedLocation,
    required this.isLoading,
    required this.onPickLocation,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedLocation == null) {
      return InkWell(
        onTap: isLoading ? null : onPickLocation,
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFF1F2F6)),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              Icon(Icons.map_outlined, size: 20.sp, color: AppTheme.textSecondary),
              SizedBox(width: 12.w),
              Expanded(child: AppText.bodySmall('Tap to Pick Location on Map')),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: isLoading ? null : onPickLocation,
      child: Container(
        height: 150.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppTheme.primaryOrange, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: AbsorbPointer(
                child: MapLibreMap(
                  initialCameraPosition: CameraPosition(
                    target: selectedLocation!,
                    zoom: 14.0,
                  ),
                  styleString: 'https://map-init.gallimap.com/styles/light/style.json',
                  myLocationEnabled: false,
                  onStyleLoadedCallback: () {},
                ),
              ),
            ),
            Center(
              child: Icon(Icons.location_on, color: AppTheme.primaryOrange, size: 30.sp),
            ),
            Positioned(
              top: 8.h,
              right: 8.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.edit, size: 12.sp, color: AppTheme.primaryOrange),
                    SizedBox(width: 4.w),
                    AppText.caption('Edit', color: AppTheme.primaryOrange, fontWeight: FontWeight.w600),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
