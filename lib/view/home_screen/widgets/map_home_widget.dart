import 'package:booking_table/controller/location/location_controller.dart';
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

  Set<Marker> _marker = {};

  final List<LatLng> markerLocations = [];

  restaurantLatLng() {
    for (int i = 0; i < locationController.homeRestaurantList.length; i++) {
      _marker.add(
        Marker(
            markerId: MarkerId(locationController
                .homeRestaurantList[i].restaurantId
                .toString()),
            position: LatLng(
              double.parse(locationController.homeRestaurantList[i].latitude!),
              double.parse(locationController.homeRestaurantList[i].longitude!),
            ),
            icon: BitmapDescriptor.defaultMarker),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    restaurantLatLng();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 628,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: locationController.latLng.value,
          zoom: 14.4746,
        ),
        //markers: _marker.toSet()
        markers: _marker,
      ),
    );
  }
}
