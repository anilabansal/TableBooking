import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  static final LocationController locationController =
      LocationController._internal();

  factory LocationController() {
    return locationController;
  }

  LocationController._internal();

  var location = Location();
  LocationData? locationData;
  LatLng? searchLocationData;
  void setLatLng(LatLng latLng) {
    searchLocationData = latLng;
    update();
  }
  Future<bool> requestPermission() async {
    final status = await Permission.location.request();
    print('Permission =-===> ${status.isGranted}');
    if (status.isGranted) {
      locationData = await location.getLocation();
      print(
          'location--->Lat-${locationData!.latitude} Long-${locationData!.longitude}');
      return true;
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
      return false;
    } else {
      return false;
    }
  }
}
