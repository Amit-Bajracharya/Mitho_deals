import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
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
  static const String _styleUrl = 'https://map-init.gallimap.com/styles/light/style.json';
  
  bool _isSearching = false;
  Timer? _debounce;
  LatLng? _initialTarget;

  @override
  void initState() {
    super.initState();
    _initialTarget = widget.initialLocation ?? const LatLng(27.7172, 85.3240); // Default to Kathmandu
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
        _mapController?.animateCamera(
          CameraUpdate.newLatLngZoom(userLocation, 14.0),
        );
      } catch (e) {
        debugPrint("Error getting location: $e");
      }
    }
  }

  Future<Iterable<Map<String, dynamic>>> _getSuggestions(String query) async {
    if (query.isEmpty) return const Iterable<Map<String, dynamic>>.empty();
    
    final completer = Completer<Iterable<Map<String, dynamic>>>();
    
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      try {
        setState(() { _isSearching = true; });
        final url = Uri.parse('https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=5&addressdetails=1');
        final response = await http.get(url, headers: {
          'User-Agent': 'MithoDealsApp/1.0', 
        });

        if (response.statusCode == 200) {
          final data = json.decode(response.body) as List;
          completer.complete(data.cast<Map<String, dynamic>>());
        } else {
          completer.complete(const Iterable<Map<String, dynamic>>.empty());
        }
      } catch (e) {
        debugPrint("Error fetching suggestions: $e");
        completer.complete(const Iterable<Map<String, dynamic>>.empty());
      } finally {
        setState(() { _isSearching = false; });
      }
    });
    
    return completer.future;
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
              target: _initialTarget!,
              zoom: 14.0,
            ),
            styleString: _styleUrl,
            onMapCreated: (controller) => _mapController = controller,
            myLocationEnabled: true,
            myLocationRenderMode: MyLocationRenderMode.normal,
            trackCameraPosition: true,
          ),
          
          // Fixed Center Pin
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0), // Offset so the pin tip points exactly to the center
              child: Icon(
                Icons.location_on,
                size: 40.0,
                color: const Color(0xFFFF6B35),
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
            ),
          ),
          
          // Search Bar with Autocomplete
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Autocomplete<Map<String, dynamic>>(
                optionsBuilder: (TextEditingValue textEditingValue) async {
                  return await _getSuggestions(textEditingValue.text);
                },
                displayStringForOption: (option) => option['display_name'],
                onSelected: (selection) {
                  final lat = double.parse(selection['lat']);
                  final lon = double.parse(selection['lon']);
                  final newLocation = LatLng(lat, lon);
                  
                  _mapController?.animateCamera(
                    CameraUpdate.newLatLngZoom(newLocation, 16.0),
                  );
                },
                fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
                  return TextField(
                    controller: controller,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      hintText: 'Search for an address...',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      suffixIcon: _isSearching
                          ? const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              ),
                            )
                          : const Icon(Icons.search, color: Color(0xFFF97316)),
                    ),
                    onEditingComplete: onEditingComplete,
                  );
                },
                optionsViewBuilder: (context, onSelected, options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 250,
                          maxWidth: MediaQuery.of(context).size.width - 32,
                        ),
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: options.length,
                          separatorBuilder: (context, index) => const Divider(height: 1),
                          itemBuilder: (BuildContext context, int index) {
                            final option = options.elementAt(index);
                            return ListTile(
                              leading: const Icon(Icons.location_on, color: Color(0xFF636E72), size: 20),
                              title: Text(
                                option['display_name'],
                                style: const TextStyle(fontSize: 13, color: Color(0xFF2D3436)),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              onTap: () {
                                onSelected(option);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Confirm Button
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: ElevatedButton(
              onPressed: () {
                if (_mapController != null && _mapController!.cameraPosition != null) {
                  context.pop(_mapController!.cameraPosition!.target);
                } else if (_initialTarget != null) {
                  context.pop(_initialTarget);
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

  @override
  void dispose() {
    _debounce?.cancel();
    _mapController?.dispose();
    super.dispose();
  }
}
