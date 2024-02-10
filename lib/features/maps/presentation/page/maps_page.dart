import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  late GoogleMapController? mapController;

  final LatLng _center = const LatLng(19.302857, -99.1886819);

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center, // San Francisco coordinates
          zoom: 12,
        ),
        markers: {
          const Marker(
            markerId: MarkerId('México'),
            position: LatLng(19.302857, -99.1886819)
          )
        },
    );
  }
}