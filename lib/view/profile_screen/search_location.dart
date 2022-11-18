import 'package:booking_table/controller/location/location_controller.dart';
import 'package:booking_table/view/profile_screen/widgets/search_location_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  LocationController locationController = Get.find();
  LatLng? _latLng;
  GoogleMapController? _controller;

  moveToCurrentLocation(double latitude, double longitude) {
    // locationController.requestPermission().then((value) {
    //   if (value) {
    //     _latLng = LatLng(latitude, longitude);
    //     locationController.setLatLng(_latLng!);
    //     if (_controller != null) {
    //       _controller!.animateCamera(
    //           CameraUpdate.newLatLngZoom(LatLng(latitude, longitude), 10));
    //     }
    //   }
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // moveToCurrentLocation(locationController.locationData!.latitude!,
    //     locationController.locationData!.longitude!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(locationController.locationData!.latitude!,
                    locationController.locationData!.longitude!),
                zoom: 14.0,
              ),
              // onTap: (v) {
              //   isSearch = false;
              // },
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
              mapType: MapType.normal,
              markers: {
                Marker(
                    onTap: () async {
                      print("marker tap");
                    },
                    markerId: const MarkerId('123456789'),
                    position: LatLng(locationController.locationData!.latitude!,
                        locationController.locationData!.longitude!),
                    icon: BitmapDescriptor.defaultMarker),
              },
            ),
            const Positioned(
              left: 20,
              right: 20,
              top: 20,
              child: SearchBox(
                hintText: "Search",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
