import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mitho_deals/core/constants/route_constants.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class LocationPickerField extends StatefulWidget {
  final LatLng? initialLocation;
  final String? initialLabel;
  final String hint;
  final double previewHeight;
  final ValueChanged<LatLng>? onLocationSelected;

  const LocationPickerField({
    super.key,
    this.initialLocation,
    this.initialLabel,
    this.hint = 'Fetching your location…',
    this.previewHeight = 180,
    this.onLocationSelected,
  });

  @override
  State<LocationPickerField> createState() => _LocationPickerFieldState();
}

class _LocationPickerFieldState extends State<LocationPickerField> {
  static const _styleUrl =
      'https://map-init.gallimap.com/styles/light/style.json';

  LatLng? _selectedLocation;
  LatLng? _initialCameraPos;
  String? _resolvedLabel;
  bool _isFetchingLocation = false;
  bool _mapReady = false;
  MapLibreMapController? _previewController;

  @override
  void initState() {
    super.initState();
    if (widget.initialLocation != null) {
      _selectedLocation = widget.initialLocation;
      _initialCameraPos = widget.initialLocation;
      _resolvedLabel = widget.initialLabel;
    } else {
      _fetchCurrentLocation();
    }
  }

  // ── GPS ───────────────────────────────────────────────────────────────────

  Future<void> _fetchCurrentLocation() async {
    if (!mounted) return;
    setState(() => _isFetchingLocation = true);

    try {
      final status = await Permission.locationWhenInUse.request();
      if (!mounted) return;

      if (!status.isGranted) {
        setState(() => _isFetchingLocation = false);
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      if (!mounted) return;

      final pos = LatLng(position.latitude, position.longitude);

      setState(() {
        _selectedLocation = pos;
        _initialCameraPos ??= pos;
        _resolvedLabel = null;
        _isFetchingLocation = false;
      });

      if (_mapReady && _previewController != null) {
        await _moveCamera(pos);
      }

      final label = await _reverseGeocode(pos);
      if (mounted) setState(() => _resolvedLabel = label);

      widget.onLocationSelected?.call(pos);
    } catch (e) {
      debugPrint('Error getting location: $e');
      if (mounted) setState(() => _isFetchingLocation = false);
    }
  }

  // ── map helpers ───────────────────────────────────────────────────────────

  /// Just moves the camera — no symbol/marker needed, pin is a Flutter widget
  Future<void> _moveCamera(LatLng pos) async {
    await _previewController?.animateCamera(
      CameraUpdate.newLatLngZoom(pos, 15.0),
    );
  }

  // ── reverse geocode ───────────────────────────────────────────────────────

  Future<String?> _reverseGeocode(LatLng pos) async {
    try {
      final url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse'
        '?lat=${pos.latitude}&lon=${pos.longitude}&format=json',
      );
      final res =
          await http.get(url, headers: {'User-Agent': 'MithoDealsApp/1.0'});
      if (res.statusCode == 200) {
        final data = json.decode(res.body) as Map<String, dynamic>;
        return data['display_name'] as String?;
      }
    } catch (_) {}
    return null;
  }

  // ── open full map picker ──────────────────────────────────────────────────

  Future<void> _openMapPicker() async {
    final result = await context.push<LatLng>(
      RouteConstants.mapPicker,
      extra: _selectedLocation,
    );
    if (result == null || !mounted) return;

    setState(() {
      _selectedLocation = result;
      _initialCameraPos ??= result;
      _resolvedLabel = null;
    });

    if (_mapReady && _previewController != null) {
      await _moveCamera(result);
    }

    widget.onLocationSelected?.call(result);

    final label = await _reverseGeocode(result);
    if (mounted) setState(() => _resolvedLabel = label);
  }

  // ── helpers ───────────────────────────────────────────────────────────────

  bool get _hasLocation => _selectedLocation != null;

  // ── build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: _hasLocation ? AppTheme.primaryOrange : AppTheme.border,
          width: _hasLocation ? 1.5 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildMapPreview(),
          _buildLabelStrip(),
        ],
      ),
    );
  }

  Widget _buildMapPreview() {
    return SizedBox(
      height: widget.previewHeight.h,
      child: Stack(
        children: [
          // ── map ──────────────────────────────────────────────────────────
          if (_initialCameraPos != null)
            MapLibreMap(
              initialCameraPosition: CameraPosition(
                target: _initialCameraPos!,
                zoom: 15.0,
              ),
              styleString: _styleUrl,
              onMapCreated: (ctrl) async {
                _previewController = ctrl;
                _mapReady = true;
                if (_selectedLocation != null) {
                  await _moveCamera(_selectedLocation!);
                }
              },
              myLocationEnabled: true,
              myLocationRenderMode: MyLocationRenderMode.normal,
              myLocationTrackingMode: MyLocationTrackingMode.none,
              scrollGesturesEnabled: false,
              zoomGesturesEnabled: false,
              rotateGesturesEnabled: false,
              tiltGesturesEnabled: false,
              trackCameraPosition: false,
            )
          else
            // Grey placeholder while GPS resolves
            Container(
              color: const Color(0xFFEEEEEE),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(color: AppTheme.primaryOrange),
                    SizedBox(height: 10.h),
                    AppText.bodySmall(
                      'Getting your location…',
                      color: AppTheme.textSecondary,
                    ),
                  ],
                ),
              ),
            ),

          // ── GPS fetching overlay ──────────────────────────────────────────
          if (_isFetchingLocation && _initialCameraPos != null)
            Container(
              color: Colors.white.withOpacity(0.75),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(color: AppTheme.primaryOrange),
                    SizedBox(height: 10.h),
                    AppText.bodySmall(
                      'Getting your location…',
                      color: AppTheme.textSecondary,
                    ),
                  ],
                ),
              ),
            ),

          // ── Orange pin — same Flutter Icon widget as MapPickerScreen ──────
          // Always centred, always visible — no sprite dependency at all
          if (!_isFetchingLocation)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Icon(
                  Icons.location_on,
                  size: 40.0,
                  color: _hasLocation
                      ? AppTheme.primaryOrange
                      : AppTheme.primaryOrange.withOpacity(0.4),
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),

          // ── transparent tap overlay ───────────────────────────────────────
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _openMapPicker,
                splashColor: Colors.black.withOpacity(0.05),
              ),
            ),
          ),

          // ── top-right badge ───────────────────────────────────────────────
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: _openMapPicker,
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.55),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.edit_location_alt,
                        color: Colors.white, size: 13.sp),
                    SizedBox(width: 4.w),
                    AppText.bodySmall(
                      _hasLocation ? 'Change' : 'Pick location',
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabelStrip() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      child: Row(
        children: [
          Icon(
            _hasLocation ? Icons.location_on : Icons.location_on_outlined,
            color: _hasLocation
                ? AppTheme.primaryOrange
                : AppTheme.textSecondary,
            size: 20.sp,
          ),
          SizedBox(width: 8.w),
          Expanded(child: _buildLabelContent()),
          Icon(Icons.chevron_right,
              color: AppTheme.textSecondary, size: 18.sp),
        ],
      ),
    );
  }

  Widget _buildLabelContent() {
    if (_isFetchingLocation) {
      return Row(
        children: [
          SizedBox(
            width: 12.w,
            height: 12.h,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              color: AppTheme.primaryOrange,
            ),
          ),
          SizedBox(width: 8.w),
          AppText.bodySmall(
            'Getting your location…',
            color: AppTheme.textSecondary,
          ),
        ],
      );
    }

    if (_hasLocation && _resolvedLabel == null) {
      return Row(
        children: [
          SizedBox(
            width: 12.w,
            height: 12.h,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              color: AppTheme.primaryOrange,
            ),
          ),
          SizedBox(width: 8.w),
          AppText.bodySmall(
            'Resolving address…',
            color: AppTheme.textSecondary,
          ),
        ],
      );
    }

    return AppText.bodySmall(
      _resolvedLabel ??
          (_hasLocation
              ? '${_selectedLocation!.latitude.toStringAsFixed(5)}, '
                  '${_selectedLocation!.longitude.toStringAsFixed(5)}'
              : widget.hint),
      color: _hasLocation ? AppTheme.textPrimary : AppTheme.textSecondary,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  void dispose() {
    _previewController?.dispose();
    super.dispose();
  }
}