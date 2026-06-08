import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';


class FullScreenDealMapScreen extends StatefulWidget {
  final List<DealEntity> deals;

  const FullScreenDealMapScreen({
    super.key,
    required this.deals,
  });

  @override
  State<FullScreenDealMapScreen> createState() => _FullScreenDealMapScreenState();
}

class _FullScreenDealMapScreenState extends State<FullScreenDealMapScreen> {
  MapLibreMapController? _mapController;
  static const String _styleUrl = 'https://map-init.gallimap.com/styles/light/style.json';

  @override
  void initState() {
    super.initState();
    _requestPermissionAndTrack();
  }

  Future<void> _requestPermissionAndTrack() async {
    final status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      // Geolocator tracking can be added if custom behavior is needed, 
      // but maplibre's myLocationTrackingMode also handles camera tracking.
      try {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        _mapController?.animateCamera(
          CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
        );
      } catch (e) {
        debugPrint("Error getting location: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deals Map'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: MapLibreMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(27.7172, 85.3240), 
          zoom: 12.0,
        ),
        styleString: _styleUrl,
        onMapCreated: _onMapCreated,
        onStyleLoadedCallback: _onStyleLoaded,
        myLocationEnabled: true,
        myLocationRenderMode: MyLocationRenderMode.normal,
        myLocationTrackingMode: MyLocationTrackingMode.tracking,
      ),
    );
  }

  void _onMapCreated(MapLibreMapController controller) {
    _mapController = controller;
  }

  void _onStyleLoaded() async {
    if (_mapController == null) return;

    for (final deal in widget.deals) {
      await _addMarker(deal);
    }

    if (widget.deals.isNotEmpty) {
      await _fitCameraToDeals();
    }
  }

  Future<void> _addMarker(DealEntity deal) async {
    if (_mapController == null) return;

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
