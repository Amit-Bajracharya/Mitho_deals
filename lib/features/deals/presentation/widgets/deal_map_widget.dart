import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:mitho_deals/core/constants/route_constants.dart';

class DealMapWidget extends StatefulWidget {
  final List<DealEntity> deals;

  const DealMapWidget({
    super.key,
    required this.deals,
  });

  @override
  State<DealMapWidget> createState() => _DealMapWidgetState();
}

class _DealMapWidgetState extends State<DealMapWidget> {
  MapLibreMapController? _mapController;
  static const String _styleUrl = 'https://map-init.gallimap.com/styles/light/style.json';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        height: 190.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.grey[200],
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            context.push(RouteConstants.fullScreenDealMap, extra: widget.deals);
          },
          child: AbsorbPointer(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Stack(
                children: [
                  MapLibreMap(
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(27.7172, 85.3240), // Kathmandu center
                      zoom: 12.0,
                    ),
                    styleString: _styleUrl,
                    onMapCreated: _onMapCreated,
                   onStyleLoadedCallback: _onStyleLoaded,
                   myLocationEnabled: true,
                   myLocationRenderMode: MyLocationRenderMode.normal,
                  ),

                  // Bottom Left Pill
                  Positioned(
                    bottom: 12.h,
                    left: 12.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.navigation,
                            size: 14.sp,
                            color: const Color(0xFFF97316),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            '${widget.deals.length} Deals Near You',
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1F2937),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onMapCreated(MapLibreMapController controller) {
    _mapController = controller;
  }

  void _onStyleLoaded() async {
    if (_mapController == null) return;

    // Add markers for each deal
    for (final deal in widget.deals) {
      await _addMarker(deal);
    }

    // Fit camera to show all markers
    if (widget.deals.isNotEmpty) {
      await _fitCameraToDeals();
    }
  }

  Future<void> _addMarker(DealEntity deal) async {
    if (_mapController == null) return;

    // Create a symbol for the marker
    await _mapController!.addSymbol(
      SymbolOptions(
        geometry: LatLng(deal.latitude, deal.longitude),
        iconImage: 'custom-marker',
        iconSize: 0.1,
        iconAnchor: 'bottom',
      ),
    );
  }

  Future<void> _fitCameraToDeals() async {
    if (_mapController == null || widget.deals.isEmpty) return;

    final latitudes = widget.deals.map((d) => d.latitude).toList();
    final longitudes = widget.deals.map((d) => d.longitude).toList();

    final minLat = latitudes.reduce((a, b) => a < b ? a : b);
    final maxLat = latitudes.reduce((a, b) => a > b ? a : b);
    final minLng = longitudes.reduce((a, b) => a < b ? a : b);
    final maxLng = longitudes.reduce((a, b) => a > b ? a : b);

    final southWest = LatLng(minLat, minLng);
    final northEast = LatLng(maxLat, maxLng);

    await _mapController!.animateCamera(
      CameraUpdate.newLatLngBounds(
       LatLngBounds(southwest: southWest, northeast: northEast),
        left: 50,
        right: 50,
        top: 50,
        bottom: 50,
      ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}
