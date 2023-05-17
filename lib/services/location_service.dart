import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  static Future<Position> getCurrentLocation() async {
    LocationPermission permission;
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location serviced are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  // static Future<String?> getAddressFromLocation(Position position) async {
  //   Address address = await GeoCode(apiKey: 'AIzaSyAs-dAc76z5FxMDGwTnIXd7aAgBCb6z8SY')
  //       .reverseGeocoding(
  //       latitude: position.latitude, longitude: position.longitude);
  //   if (address.streetAddress == null) {
  //     return null;
  //   }4
  //   return address.streetAddress;
  // }

  static Future<String?> getAddressFromLocation(Position position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    if(placemarks == null  || placemarks.length<1 ){
      return null;
    }
    return '${placemarks.first.name},${placemarks.first.street},${placemarks.first.locality},${placemarks.first.subLocality},${placemarks.first.administrativeArea},${placemarks.first.postalCode},${placemarks.first.country}';
  }
  static Future<String?> getCurrentAddress() async {
    var position = await getCurrentLocation();


    return getAddressFromLocation(position);
  }

  static Future<CameraPosition> getCameraPosition() async{
    var position = await getCurrentLocation();
    final Completer<GoogleMapController> _controller =
    Completer<GoogleMapController>();
    CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 14.4746,
    );
    return _kGooglePlex;
  }
}







