import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class MapPickerScreen extends StatefulWidget {
  final LatLng? initialLocation;

  const MapPickerScreen({super.key, this.initialLocation});

  @override
  State<MapPickerScreen> createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  MapLibreMapController? _mapController;
  static const String _styleUrl =
      'https://map-init.gallimap.com/styles/light/style.json';

  bool _isSearching = false;
  Timer? _debounce;

  // This is the camera's initial target — set from extra or GPS
  LatLng? _initialTarget;
  bool _isLoadingLocation = true;

  @override
  void initState() {
    super.initState();
    if (widget.initialLocation != null) {
      // Came from field that already has a location — open centred there
      _initialTarget = widget.initialLocation;
      _isLoadingLocation = false;
    } else {
      _resolveInitialLocation();
    }
  }

  Future<void> _resolveInitialLocation() async {
    final status = await Permission.locationWhenInUse.request();
    if (!mounted) return;

    if (status.isGranted) {
      try {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        if (!mounted) return;
        setState(() {
          _initialTarget = LatLng(position.latitude, position.longitude);
          _isLoadingLocation = false;
        });
        _mapController?.animateCamera(
          CameraUpdate.newLatLngZoom(_initialTarget!, 14.0),
        );
        return;
      } catch (e) {
        debugPrint('Error getting location: $e');
      }
    }

    // Fallback — permission denied or error
    if (mounted) {
      setState(() {
        _initialTarget = const LatLng(27.7172, 85.3240);
        _isLoadingLocation = false;
      });
    }
  }

  Future<Iterable<Map<String, dynamic>>> _getSuggestions(String query) async {
    if (query.isEmpty) return const Iterable<Map<String, dynamic>>.empty();

    final completer = Completer<Iterable<Map<String, dynamic>>>();

    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      try {
        if (mounted) setState(() => _isSearching = true);
        final url = Uri.parse(
          'https://nominatim.openstreetmap.org/search'
          '?q=$query&format=json&limit=5&addressdetails=1',
        );
        final response =
            await http.get(url, headers: {'User-Agent': 'MithoDealsApp/1.0'});

        if (response.statusCode == 200) {
          final data = json.decode(response.body) as List;
          completer.complete(data.cast<Map<String, dynamic>>());
        } else {
          completer.complete(const Iterable<Map<String, dynamic>>.empty());
        }
      } catch (e) {
        debugPrint('Error fetching suggestions: $e');
        completer.complete(const Iterable<Map<String, dynamic>>.empty());
      } finally {
        if (mounted) setState(() => _isSearching = false);
      }
    });

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText.title('Pick Location', fontSize: 18),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: _isLoadingLocation
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(color: AppTheme.primaryOrange),
                  SizedBox(height: 12.h),
                  AppText.bodySmall('Getting your location…',
                      color: AppTheme.textSecondary),
                ],
              ),
            )
          : Stack(
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

                // crosshair pin
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Icon(
                      Icons.location_on,
                      size: 40.0,
                      color: AppTheme.primaryOrange,
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

                // search bar
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
                      optionsBuilder: (textEditingValue) async {
                        return _getSuggestions(textEditingValue.text);
                      },
                      displayStringForOption: (option) =>
                          option['display_name'],
                      onSelected: (selection) {
                        final lat = double.parse(selection['lat']);
                        final lon = double.parse(selection['lon']);
                        _mapController?.animateCamera(
                          CameraUpdate.newLatLngZoom(LatLng(lat, lon), 16.0),
                        );
                      },
                      fieldViewBuilder:
                          (context, controller, focusNode, onEditingComplete) {
                        return AppTextField(
                          controller: controller,
                          focusNode: focusNode,
                          onEditingComplete: onEditingComplete,
                          hint: 'Search for an address...',
                          variant: AppTextFieldVariant.plain,
                          suffixIcon: _isSearching
                              ? const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2),
                                  ),
                                )
                              : Icon(Icons.search,
                                  color: AppTheme.primaryOrange),
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
                                maxWidth:
                                    MediaQuery.of(context).size.width - 32,
                              ),
                              child: ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: options.length,
                                separatorBuilder: (_, __) =>
                                    const Divider(height: 1),
                                itemBuilder: (context, index) {
                                  final option = options.elementAt(index);
                                  return ListTile(
                                    leading: Icon(Icons.location_on,
                                        color: AppTheme.textSecondary,
                                        size: 20),
                                    title: AppText.bodySmall(
                                      option['display_name'],
                                      color: AppTheme.textPrimary,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    onTap: () => onSelected(option),
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

                // confirm button
                Positioned(
                  bottom: 24,
                  left: 24,
                  right: 24,
                  child: AppButton(
                    label: 'Confirm Location',
                    onPressed: () {
                      final target =
                          _mapController?.cameraPosition?.target ??
                              _initialTarget;
                      if (target != null) context.pop(target);
                    },
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