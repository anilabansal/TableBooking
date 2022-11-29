import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../utils/common/common_strings.dart';
import '../../utils/common/toast_message.dart';
import '../../utils/network/api_calls.dart';
import '../home/modals/restaurant_list_modal.dart';
import '../user_session/user_session_controller.dart';

class LocationController extends GetxController {
  static final LocationController locationController = LocationController._internal();
  factory LocationController() {
    return locationController;
  }
  LocationController._internal();
  ApiCalls apiCall = ApiCalls();
  UserSessionController userSession = Get.find();
  final searchController = TextEditingController().obs;
  var location = Location();
  LocationData? locationData;
  LatLng? searchLocationData;
  // var  isSearch = false.obs;
  var currentAddress = ''.obs;
  var latLng  = const LatLng(0.0, 0.0).obs;
  var isLoading = false.obs;
  var mapHomeLoading = true.obs;
  var cameraPosition = const CameraPosition(target:LatLng(0.0, 0.0)).obs;
  var homeRestaurantList = [].obs;
  void setLatLng(LatLng latLng) {
    searchLocationData = latLng;
    update();
  }
  Future<bool> requestPermission() async {
    final status = await Permission.location.request();
    print('Permission =-===> ${status.isGranted}');
    if (status.isGranted) {
      locationData = await location.getLocation();
      latLng.value = LatLng(locationData!.latitude!, locationData!.longitude!);
      print(
          'location--->Lat-${locationData!.latitude} Long-${locationData!.longitude}');
      return true;
    }
    else if (status.isPermanentlyDenied) {
      openAppSettings();
      return false;
    }
    else {
      return false;
    }
  }

  Future<bool> searchLocationApi({Map<String, String>? data}) async {
    final response = await apiCall.callPostApi(
      data!,
      zipCode,
      token: '${userSession.token}'
    );
    print(data);

    if (response['response'] == 1) {
      homeRestaurantList.value = (response['restaurantlist'])
          ?.map((e) => RestaurantList.fromMap(e as Map<String, dynamic>))
          .toList();
      return true;
    }
    else{
      ShowToast.show(
        msg: response['errorMessage'] ?? 'Please try again!',
        isError: true,
      );
    }
    return false;
  }

}
