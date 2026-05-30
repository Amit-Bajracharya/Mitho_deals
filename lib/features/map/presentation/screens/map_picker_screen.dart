import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class MapPickerScreen extends StatefulWidget {
  final LatLng? initialLocation;

  const MapPickerScreen({
    super.key,
    this.initialLocation,
  });

  @override
  State<MapPickerScreen> createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  MapLibreMapController? _mapController;
  LatLng? _selectedLocation;
  Symbol? _markerSymbol;
  static const String _styleUrl = 'https://map-init.gallimap.com/styles/light/style.json';

  @override
  void initState() {
    super.initState();
    _selectedLocation = widget.initialLocation ?? const LatLng(27.7172, 85.3240); // Default to Kathmandu
    if (widget.initialLocation == null) {
      _requestPermissionAndGetLocation();
    }
  }

  Future<void> _requestPermissionAndGetLocation() async {
    final status = await Permission.locationWhenInUse.request();
    if (status.isGranted) {
      try {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        final userLocation = LatLng(position.latitude, position.longitude);
        _updateMarker(userLocation);
        _mapController?.animateCamera(
          CameraUpdate.newLatLng(userLocation),
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
        title: const Text('Pick Location'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Stack(
        children: [
          MapLibreMap(
            initialCameraPosition: CameraPosition(
              target: _selectedLocation!,
              zoom: 14.0,
            ),
            styleString: _styleUrl,
            onMapCreated: _onMapCreated,
            onStyleLoadedCallback: _onStyleLoaded,
            myLocationEnabled: true,
            myLocationRenderMode: MyLocationRenderMode.normal,
            onMapClick: (point, coordinates) {
              _updateMarker(coordinates);
            },
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: ElevatedButton(
              onPressed: () {
                if (_selectedLocation != null) {
                  context.pop(_selectedLocation);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF97316),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Confirm Location',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(MapLibreMapController controller) {
    _mapController = controller;
  }

  void _onStyleLoaded() async {
    if (_mapController == null || _selectedLocation == null) return;
    
    _markerSymbol = await _mapController!.addSymbol(
      SymbolOptions(
        geometry: _selectedLocation!,
        iconImage: 'custom-marker', // Assuming this icon is configured in your map style
        iconSize: 0.1,
        iconAnchor: 'bottom',
      ),
    );
  }

  void _updateMarker(LatLng newLocation) async {
    setState(() {
      _selectedLocation = newLocation;
    });

    if (_mapController != null && _markerSymbol != null) {
      await _mapController!.updateSymbol(
        _markerSymbol!,
        SymbolOptions(geometry: newLocation),
      );
    } else if (_mapController != null) {
       _markerSymbol = await _mapController!.addSymbol(
        SymbolOptions(
          geometry: newLocation,
          iconImage: 'custom-marker',
          iconSize: 0.1,
          iconAnchor: 'bottom',
        ),
      );
    }
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}
