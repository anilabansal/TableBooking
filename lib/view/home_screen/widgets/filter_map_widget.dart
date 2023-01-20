import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../controller/filter/filter_screen_controller.dart';
import '../../../controller/location/location_controller.dart';
import '../../../utils/common/common_strings.dart';

class FilterMapScreen extends StatefulWidget {
  const FilterMapScreen({Key? key}) : super(key: key);

  @override
  State<FilterMapScreen> createState() => _FilterMapScreenState();
}

class _FilterMapScreenState extends State<FilterMapScreen> {
  FilterViewController filterViewController = Get.find();
  LocationController locationController = Get.find();
  Set<Marker> _marker = {};
  final List<LatLng> markerLocations = [];
  BitmapDescriptor? markerIcon;

  Future<bool> addMarkers() async {
    filterViewController.filterMapIsLoading.value = true;
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

  filterRestaurantLatLng() {
    for (int i = 0; i < filterViewController.filterRestaurantList.length; i++) {
      _marker.add(
        Marker(
          markerId: MarkerId(
            filterViewController.filterRestaurantList[i].restaurantId
                .toString(),
          ),
          position: LatLng(
            double.parse(
              filterViewController.filterRestaurantList[i].latitude!,
            ),
            double.parse(
              filterViewController.filterRestaurantList[i].longitude!,
            ),
          ),
          //icon: BitmapDescriptor.defaultMarker,
          icon: markerIcon!,
          infoWindow: InfoWindow(
            title: filterViewController.filterRestaurantList[i].restaurantName,
            snippet:
                "${filterViewController.filterRestaurantList[i].distance.toString()} miles away",
          ),
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
          print("filterMarker ---->true");
          filterViewController.filterMapIsLoading.value = false;
          filterRestaurantLatLng();
        }
      },
    );
    // restaurantLatLng();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return filterViewController.filterMapIsLoading.value
            ? const CircularProgressIndicator(
                color: redE2211C,
              )
            : SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 800,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: locationController.latLng.value,
                    //target: LatLng(18.841400,72.852200),
                    zoom: 10,
                  ),
                  markers: _marker,
                ),
              );
      },
    );
  }
}
