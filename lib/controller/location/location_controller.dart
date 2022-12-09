import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/network/api_calls.dart';
import '../user_session/user_session_controller.dart';

class LocationController extends GetxController {
  static final LocationController locationController =
      LocationController._internal();

  factory LocationController() {
    return locationController;
  }

  LocationController._internal();

  ApiCalls apiCall = ApiCalls();
  UserSessionController userSession = Get.find();
  final searchController = TextEditingController().obs;

  // var location = Location();
  // LocationData? locationData;
  Position? locationData;
  LatLng? searchLocationData;
  var currentAddress = ''.obs;
  var latLng = const LatLng(0.0, 0.0).obs;
  var isLoading = false.obs;
  var cameraPosition = const CameraPosition(target: LatLng(0.0, 0.0)).obs;

  var searchLatLng = const LatLng(0.0, 0.0).obs;
  var searchPlaceId = ''.obs;

  /// set latLng
  void setLatLng(LatLng latLng) {
    searchLocationData = latLng;
    update();
  }

  // Future<bool> requestPermission() async {
  //   final status = await Permission.location.request();
  //   print('Permission =-===> ${status.isGranted}');
  //   if (status.isGranted) {
  //     locationData = await Location().getLocation();
  //     latLng.value = LatLng(locationData!.latitude!, locationData!.longitude!);
  //     print(
  //         'location--->Lat-${locationData!.latitude} Long-${locationData!.longitude}');
  //     return true;
  //   } else if (status.isPermanentlyDenied) {
  //     openAppSettings();
  //     return false;
  //   } else {
  //     return false;
  //   }
  // }
  /// request permission for current location
  Future<bool> requestPermission() async {
    final status = await Permission.location.request();
    print('Permission =-===> ${status.isGranted}');
    if (status.isGranted) {
      locationData = await Geolocator.getCurrentPosition();
      latLng.value = LatLng(locationData!.latitude, locationData!.longitude);
      print(
          'location--->Lat-${locationData!.latitude} Long-${locationData!.longitude}');
      List<Placemark> placemarks = await placemarkFromCoordinates(
          locationData!.latitude, locationData!.longitude);
      Placemark place = placemarks[0];
      if (GetPlatform.isAndroid) {
        currentAddress.value =
            "${place.name} ${place.locality} ${place.subLocality} ${place.administrativeArea} ";
      } else if (GetPlatform.isIOS) {
        currentAddress.value = place.street!.isNotEmpty
            ? "${place.street} ${place.subAdministrativeArea} ${place.subLocality} ${place.locality}  "
            : "${place.subAdministrativeArea} ${place.subLocality} ${place.locality} ${place.administrativeArea}  ";
      }
      // currentAddress.value =
      // "${place.name} ${place.locality} ${place.subLocality} ${place.administrativeArea} ";

      // userSession.setSearchLocation(currentAddress.value);
      // currentAddress.value =
      // "${place.name},${place.locality},${place.subLocality},${place.administrativeArea}, ${place.country}";
      // searchController.value.text = "${place.name},${place.locality},${place.subLocality},${place.administrativeArea}, ${place.country}";
      //  searchController.value.text = "${place.name} ${place.locality} ${place.subLocality} ${place.administrativeArea} ";
      return true;
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
      return false;
    } else {
      return false;
    }
  }

// Future<bool> searchLocationApi({Map<String, String>? data}) async {
//   final response = await apiCall.callPostApi(
//     data!,
//     zipCode,
//     token: '${userSession.token}'
//   );
//   print(data);
//
//   if (response['response'] == 1) {
//     homeRestaurantList.value = (response['restaurantlist'])
//         ?.map((e) => RestaurantList.fromMap(e as Map<String, dynamic>))
//         .toList();
//     return true;
//   }
//   else{
//     ShowToast.show(
//       msg: response['errorMessage'] ?? 'Please try again!',
//       isError: true,
//     );
//   }
//   return false;
// }

}
