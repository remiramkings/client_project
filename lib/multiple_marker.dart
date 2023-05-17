import 'package:client_project/services/marker_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'models/marker_data.dart';

class MultipleMarker extends StatefulWidget {
  @override
  State<MultipleMarker> createState() {
    return MultipleMarkerState();
  }
}

class MultipleMarkerState extends State<MultipleMarker> {

  final Map<String, Marker> _markers = {};
  late double currentLat;
  late double currentLng;

  loadMultipleMarkers(){
    List<MarkerData> markerDatas = MarkerService.getAllMarkers();
    setState(() {
      for(int i = 0; i< markerDatas.length; i++){
        final marker = Marker(markerId: MarkerId(
            markerDatas[i].name
        ),
        position: LatLng(markerDatas[i].lat, markerDatas[i].long),
          infoWindow: InfoWindow(
              title: markerDatas[i].name,
          ));
        _markers[markerDatas[i].name] = marker;
      }
      if(markerDatas.length>1){
        currentLat = markerDatas.first.lat;
        currentLng = markerDatas.first.long;
      }

    });
  }

  @override
  void initState() {
    loadMultipleMarkers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(currentLat, currentLng), zoom: 8),
        markers: _markers.values.toSet(),
      ),
    );
  }
}
