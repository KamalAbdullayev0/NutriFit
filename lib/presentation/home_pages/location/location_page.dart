import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:nutri_fit/common/widgets/root_appbar/root_appbar.dart';
import 'package:nutri_fit/core/configs/assets/app_images.dart';

class LocationPageWidget extends StatefulWidget {
  const LocationPageWidget({super.key});

  @override
  State<LocationPageWidget> createState() => _LocationPageWidgetState();
}

class _LocationPageWidgetState extends State<LocationPageWidget> {
  final Location _location = Location();
  var _currentLocation = LatLng(40.3920, 49.8390); // Координаты Баку

  // Статические координаты тренажёрных залов
  final List<Map<String, dynamic>> _gyms = [
    {"name": "Fit Club", "location": LatLng(40.3910, 49.8420)},
    {"name": "ProGym", "location": LatLng(40.3875, 49.8450)},
    {"name": "Iron Paradise", "location": LatLng(40.3860, 49.8390)},
    {"name": "Pulse Fitness", "location": LatLng(40.3840, 49.8410)},
    {"name": "Prime Gym", "location": LatLng(40.3920, 49.8375)},
    {"name": "Max Fit", "location": LatLng(40.3880, 49.8460)},
    {"name": "Active Life", "location": LatLng(40.3850, 49.8440)},
    {"name": "Health Hub", "location": LatLng(40.3895, 49.8400)},
    {"name": "Body Sculpt", "location": LatLng(40.3870, 49.8380)},
    {"name": "Zen Fitness", "location": LatLng(40.3865, 49.8430)},
  ];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RootAppBar(imagePath: AppImages.ozun),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _currentLocation,
          zoom: 14,
        ),
        myLocationEnabled: true,
        markers: _buildMarkers(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () => _getCurrentLocation(),
        child: const Icon(Icons.my_location),
      ),
    );
  }

  // Получение текущего местоположения
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) return;
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    final currentLocation = await _location.getLocation();
    if (currentLocation.latitude != null && currentLocation.longitude != null) {
      setState(() {
        _currentLocation =
            LatLng(currentLocation.latitude!, currentLocation.longitude!);
      });
    }
  }

  // Построение маркеров для карты
  Set<Marker> _buildMarkers() {
    final Set<Marker> markers = {};

    // Маркер текущего местоположения
    if (_currentLocation != null) {
      markers.add(
        Marker(
          markerId: const MarkerId("current_location"),
          position: _currentLocation!,
          infoWindow: const InfoWindow(title: "Вы здесь"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
    }

    // Маркеры для тренажёрных залов
    for (var gym in _gyms) {
      markers.add(
        Marker(
          markerId: MarkerId(gym["name"]),
          position: gym["location"],
          infoWindow: InfoWindow(title: gym["name"]),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    }

    return markers;
  }
}
