import 'dart:async';
import 'dart:ui' as ui;
import 'package:booking_table/controller/home/home_controller.dart';
import 'package:booking_table/controller/location/location_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapHomeScreen extends StatefulWidget {
  const MapHomeScreen({Key? key}) : super(key: key);
  @override
  State<MapHomeScreen> createState() => _MapHomeScreenState();
}

class _MapHomeScreenState extends State<MapHomeScreen> {
  LocationController locationController = Get.find();
  HomeController homeController = Get.find();
  Set<Marker> _marker = {};
  final List<LatLng> markerLocations = [];
  BitmapDescriptor? markerIcon;
  List<Uint8List> result = [];
  // List<BitmapDescriptor> descriptors = [];

  // Future<bool> customMarkerIcon() async {
  //   for (int i = 0; i < homeController.homeRestaurantList.length; i++)  {
  //    // homeController.mapHomeLoading.value = true;
  //     http.Response response = await http.get(Uri.parse(homeController.homeRestaurantList[i].restaurantPic.toString()));
  //     Uint8List bytes = response.bodyBytes;
  //     ByteData data = ByteData.view(bytes.buffer);
  //     BitmapDescriptor descriptor = BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  //     descriptors.add(descriptor);
  //   }
  //   return true;
  // }


  Future<List<Uint8List>> loadNetworkImages() async {

    for (int i = 0; i < homeController.homeRestaurantList.length; i++) {
      final completed = Completer<ImageInfo>();
      var image = NetworkImage(homeController.homeRestaurantList[i].restaurantPic.toString());
      image.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener(
              (info, _) => completed.complete(info),
        ),
      );
      final imageInfo = await completed.future;
      final byteData =
      await imageInfo.image.toByteData(format: ui.ImageByteFormat.png);
      result.add(byteData!.buffer.asUint8List());
    }
    return result;
  }

  Future<bool> addMarkers() async {
    print("markerIcon");
    homeController.mapHomeLoading.value = true;
    markerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        devicePixelRatio: 4.5,
        size: Size(
          8,
          8,
        ),
      ),
      "assets/images/home/location_marker.png",
    );
    return true;
  }

  restaurantLatLng() {
    for (int i = 0; i < homeController.homeRestaurantList.length; i++) {
      _marker.add(
        Marker(
          markerId: MarkerId(
            homeController.homeRestaurantList[i].restaurantId.toString(),
          ),
          position: LatLng(
            double.parse(homeController.homeRestaurantList[i].latitude!),
            double.parse(homeController.homeRestaurantList[i].longitude!),
          ),
          //icon: BitmapDescriptor.defaultMarker,
        // icon: markerIcon!,
         icon:BitmapDescriptor.fromBytes(result[homeController.homeRestaurantList[i].restaurantPic]),
          infoWindow: InfoWindow(
              title: homeController.homeRestaurantList[i].restaurantName,
              snippet:
                  "${(homeController.homeRestaurantList[i].distance * 0.6214).toString()} miles away"),
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    addMarkers().then(
      (value) {
        if (value) {
          print("marker ---->true");
         homeController.mapHomeLoading.value = false;
          restaurantLatLng();
        }
      },
    );
    // restaurantLatLng();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   width: MediaQuery.of(context).size.width,
    //   height: 628,
    //   child: GoogleMap(
    //     initialCameraPosition: CameraPosition(
    //       target: locationController.latLng.value,
    //       zoom: 12.0,
    //     ),
    //     markers: _marker,
    //   ),
    // );
    return Obx(() {
      return homeController.mapHomeLoading.value
          ? const CircularProgressIndicator(
              color: redE2211C,
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 628,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: locationController.latLng.value,
                  zoom: 12.0,
                ),
                markers: _marker,
              ),
            );
    });
  }
}
