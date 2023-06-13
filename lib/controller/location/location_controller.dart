import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../utils/common/common_strings.dart';
import '../../utils/common/widgets_methods/common_button.dart';
import '../../utils/common/widgets_methods/common_sized_box.dart';
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
  //UserSessionController userSession = Get.find();
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
var isSearchMap = false.obs;

  /// set latLng
  void setLatLng(LatLng latLng) {
    searchLocationData = latLng;
    update();
  }

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
        locationData!.latitude,
        locationData!.longitude,
          // 34.114130,-118.462750,
          // 34.11413683567844	,-118.46275616437198
      );
      Placemark place = placemarks[0];
      print(
          'Address ---------> ${placemarks.first.toString()}');
      if (GetPlatform.isAndroid) {
        // currentAddress.value =
        //     "${place.street} ${place.locality}, \n${place.administrativeArea} ${place.postalCode}";
        currentAddress.value = "${place.postalCode}";

      } else if (GetPlatform.isIOS) {
        // currentAddress.value = "${place.street} ${place.locality}, \n${place.administrativeArea} ${place.postalCode}";
        currentAddress.value = "${place.postalCode}";
      }

      return true;
    }
    else if (status.isPermanentlyDenied) {
      Get.defaultDialog(
        barrierDismissible: false,
        title:  "Location",
        titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        content: CommonText(
          text: "Allow Access to Location to Fetch Nearby Restaurants",
          textAlign: TextAlign.center,
          fontSize: 16,
          softWrap: true,
        ),
        radius: 0010,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5.0),
            // padding: const EdgeInsets.all(0),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Expanded(
                //   child:
                SizedBox(
                  width: 80,
                  height: 40,
                  child: CommonButton(
                    bgColor: redE2211C,
                    text: 'Cancel',
                    onTap: () {
                      Get.back();
                    },
                    textColor: Colors.white,
                  ),

                ),
                // ),
                CommonSizedBox(
                  width: 15,
                ),
                // Expanded(
                //   child:
                SizedBox(
                  width: 80,
                  height: 40,
                  child:   CommonButton(
                    bgColor: redE2211C,
                    text:  'Okay',
                    textColor: Colors.white,
                    onTap: ()  {
                      Get.back();
                      openAppSettings();
                    },
                  ),

                ),
                // ),
              ],
            ),
          ),
        ],
      );

      return false;
    }
    else {
      return false;
    }
  }

}
