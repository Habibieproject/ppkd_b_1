import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ppkd_b_1/service/geo_service.dart';
import 'package:ppkd_b_1/utils/constant/app_color.dart';

/// Example [Widget] showing the functionalities of the geolocator plugin
class GeoAppScreeen extends StatefulWidget {
  /// Creates a new GeoAppScreeen.
  const GeoAppScreeen({super.key});

  @override
  State<GeoAppScreeen> createState() => _GeoAppScreeenState();
}

class _GeoAppScreeenState extends State<GeoAppScreeen> {
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  bool _isLoading = true;
  String _currentAddress = "Unknown";
  String _currentLatLong = "Unknown";
  double _currentLat = 0;
  double _currentLong = 0;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    _isLoading = true;
    setState(() {});
    try {
      LatLng userLocation = await determineUserLocation();
      await _getAddressFromLatLng(userLocation);
      setState(() {});

      _isLoading = false;
    } catch (e) {
      print("Error fetching location: $e");
    }
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        setState(() {
          _currentAddress =
              "${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}, ${place.postalCode}, ${place.country}, ${place.isoCountryCode}";
          _currentLatLong = "${position.latitude}, ${position.longitude}";
          _currentLat = position.latitude;
          _currentLong = position.longitude;
          print(_currentLatLong);
        });
      }
    } catch (e) {
      print("Error reverse geocoding: $e");
    }
  }

  PopupMenuButton _createActions() {
    return PopupMenuButton(
      elevation: 40,
      onSelected: (value) async {
        switch (value) {
          case 1:
            _openAppSettings();
            break;
          case 2:
            _openLocationSettings();
            break;

          default:
            break;
        }
      },
      itemBuilder:
          (context) => [
            const PopupMenuItem(value: 1, child: Text("Open App Settings")),
            if (Platform.isAndroid || Platform.isWindows)
              const PopupMenuItem(
                value: 2,
                child: Text("Open Location Settings"),
              ),
          ],
    );
  }

  Set<Polyline> polylines = {
    Polyline(
      polylineId: PolylineId('route1'),
      points: [
        LatLng(-6.21088, 106.8129417),
        LatLng(-6.21100, 106.8130000),
        LatLng(-6.21120, 106.8130500),
        LatLng(-6.2087634, 106.845599), // Monas, Jakarta
        LatLng(-6.21462, 106.84513), // Nearby point in Jakarta
        LatLng(-6.21129, 106.85071), // Another nearby point in Jakarta
      ],
      color: Colors.red,
      width: 4,
    ),
  };

  Set<Polygon> polygons = {
    Polygon(
      polygonId: PolygonId('area1'),
      points: [
        LatLng(-6.21088, 106.8129417),
        LatLng(-6.21089, 106.8129517),
        LatLng(-6.21090, 106.8129617),
        LatLng(-6.21091, 106.8129717),
        LatLng(-6.21092, 106.8129817),
      ],
      fillColor: Colors.green.withOpacity(0.3),
      strokeColor: Colors.green,
      strokeWidth: 2,
    ),
  };

  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(height: 10);

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: const Text('Geolocator'),
        actions: <Widget>[_createActions()],
      ),
      body: Card(
        child:
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.secondaryColor,
                        ),
                        height: 300,
                        child: GoogleMap(
                          circles: Set<Circle>.of(<Circle>[
                            Circle(
                              circleId: const CircleId("circle"),
                              center: LatLng(_currentLat, _currentLong),
                              radius: 5,
                              fillColor: AppColor.secondaryColor.withOpacity(
                                0.5,
                              ),
                              strokeWidth: 2,
                              strokeColor: AppColor.secondaryColor,
                            ),
                          ]),
                          polygons: polygons,
                          polylines: polylines,

                          // clusterManagers:
                          //     Set<ClusterManager>.of(<ClusterManager>[
                          //       ClusterManager(
                          //         clusterManagerId: const ClusterManagerId(
                          //           "cluster",
                          //         ),
                          //         onClusterTap: (argument) {
                          //           // Handle cluster tap
                          //         },
                          //       ),
                          //     ]),
                          compassEnabled: true,
                          myLocationEnabled: true,
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(_currentLat, _currentLong),
                            zoom: 14.4746,
                          ),
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                      ),
                      const Text("Current Address"),
                      sizedBox,
                      Text(_currentAddress),
                      sizedBox,
                      const Text("Current LatLong"),
                      sizedBox,
                      Text(_currentLatLong),
                    ],
                  ),
                ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          sizedBox,
          FloatingActionButton(
            onPressed: _fetchLocation,
            child: const Icon(Icons.my_location),
          ),
        ],
      ),
    );
  }

  void _openAppSettings() async {
    final opened = await _geolocatorPlatform.openAppSettings();
    String displayValue;

    if (opened) {
      displayValue = 'Opened Application Settings.';
    } else {
      displayValue = 'Error opening Application Settings.';
    }

    // _updatePositionList(_PositionItemType.log, displayValue);
  }

  void _openLocationSettings() async {
    final opened = await _geolocatorPlatform.openLocationSettings();
    String displayValue;

    if (opened) {
      displayValue = 'Opened Location Settings';
    } else {
      displayValue = 'Error opening Location Settings';
    }

    // _updatePositionList(_PositionItemType.log, displayValue);
  }
}
