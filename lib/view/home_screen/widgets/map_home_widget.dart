import 'package:booking_table/controller/home/home_controller.dart';
import 'package:booking_table/controller/location/location_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
          icon: markerIcon!,
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
                  zoom: 14.4746,
                ),
                markers: _marker,
              ),
            );
    });
  }
}
