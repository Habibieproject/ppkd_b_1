 Future<void> _fetchLocation() async {
    try {
      LatLng userLocation = await determineUserLocation();
      await _getAddressFromLatLng(userLocation);
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
              "${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
          _currentLatLong = "${position.latitude}, ${position.longitude}";
        });
      }
    } catch (e) {
      print("Error reverse geocoding: $e");
    }
  }

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<LatLng> determineUserLocation() async {
  try {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Location services are disabled.';
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw 'Location permissions are denied.';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw 'Location permissions are permanently denied.';
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return LatLng(position.latitude, position.longitude);
  } catch (e) {
    print('Error determining user location: $e');
    return const LatLng(-6.1753924, 106.8271528); // Default ke Jakarta
  }
}
