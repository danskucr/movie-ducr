import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  GoogleMapController? mapController;
  Location location = Location(); // Create a Location instance
  Set<Marker> markers = {};

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    await _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    final userLocation = await location.getLocation();
    setState(() {
      markers.add(Marker(
        markerId: MarkerId('userLocation'),
        position: LatLng(userLocation.latitude!, userLocation.longitude!),
        infoWindow: InfoWindow(title: 'Your Location'),
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // San Francisco coordinates
          zoom: 12,
        ),
      );
  }
}