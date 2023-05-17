import 'package:client_project/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapContent extends StatefulWidget {
  @override
  State<MapContent> createState() => MapContentState();
}

class MapContentState extends State<MapContent> {
  CameraPosition? currentCameraPosition;
  Marker? currentLocationMarker;

  loadCurrentPosition() async {
    var cPosition = await LocationService.getCameraPosition();
    setState(() {
      currentCameraPosition = cPosition;
    });
    await loadMarker();
  }

  loadMarker() async {
    Position position = await LocationService.getCurrentLocation();
    setState(() {
      currentLocationMarker = Marker(
          markerId: const MarkerId('currentLocation'),
          position: LatLng(position.latitude, position.longitude),

      );
    });
  }

  @override
  void initState() {
    loadCurrentPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        child:
            (currentCameraPosition != null) && (currentLocationMarker != null)
                ? GoogleMap(
                    initialCameraPosition: currentCameraPosition!,
                    markers: <Marker>{currentLocationMarker!},
                  )
                : const Text('Loading...'));
  }
}
