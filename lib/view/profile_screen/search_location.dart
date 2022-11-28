import 'package:booking_table/controller/location/location_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/view/profile_screen/widgets/search_location_box.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../utils/common/widgets_methods/common_text.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  // final searchController = TextEditingController();
  LocationController locationController = Get.find();
  GoogleMapController? _controller;

  // bool isSearch = false;

  moveToCurrentLocation(double latitude, double longitude) {
    locationController.requestPermission().then((value) {
      if (value) {
        locationController.latLng.value = LatLng(latitude, longitude);
        print("newlatlng --->${locationController.latLng.value}");
        locationController.setLatLng(locationController.latLng.value);
        if (_controller != null) {
          _controller!.animateCamera(
              CameraUpdate.newLatLngZoom(LatLng(latitude, longitude), 10));
        }
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveToCurrentLocation(locationController.locationData!.latitude!,
        locationController.locationData!.longitude!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SafeArea(
          child: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: locationController.latLng.value,
                  zoom: 14.0,
                ),
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
                    position: locationController.latLng.value,
                    icon: BitmapDescriptor.defaultMarker,
                  ),
                },
                // onTap: (v) {
                //   locationController.isSearch.value = false;
                // },
                buildingsEnabled: false,
                compassEnabled: false,
                zoomControlsEnabled: false,
                onCameraMove: (CameraPosition cameraPosition) {
                  locationController.cameraPosition.value = cameraPosition;
                  locationController.latLng.value = LatLng(
                      locationController.cameraPosition.value.target.latitude,
                      locationController.cameraPosition.value.target.longitude);
                  locationController.setLatLng(locationController.latLng.value);
                },
                onCameraIdle: () async {
                  ///Get the location here
                  if (locationController.cameraPosition.value != null) {
                    locationController.setLatLng(LatLng(
                        locationController.cameraPosition.value.target.latitude,
                        locationController
                            .cameraPosition.value.target.longitude));
                    List<Placemark> placeMarks = await placemarkFromCoordinates(
                        locationController.cameraPosition.value.target.latitude,
                        locationController
                            .cameraPosition.value.target.longitude);
                    print('Address ---------> ${placeMarks.first.toString()}');

                    // if (!locationController.isSearch.value) {
                    locationController.searchController.value.text =
                        'name${placeMarks.first.name},locality${placeMarks.first.locality},sublocality${placeMarks.first.subLocality},administrativeArea${placeMarks.first.administrativeArea}';


                    print(
                        'Camera Position ---------> ${locationController.cameraPosition.value.target.latitude}');
                    print(
                        'Camera Position ---------> ${locationController.cameraPosition.value.target.longitude}');
                  }
                },

              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: white),
                          child: const Icon(
                            size: 25,
                            Icons.arrow_back,
                            color: black000000,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SearchBox(
                        hintText: "Search",
                        destinationController:
                            locationController.searchController.value,
                        callBack: () async {
                          //locationController.isSearch.value = true;
                          List<Location> locations = await locationFromAddress(
                              locationController.searchController.value.text);
                          locationController.latLng.value = LatLng(
                              locations.last.latitude,
                              locations.last.longitude);
                          moveToCurrentLocation(locations.last.latitude,
                              locations.last.longitude);
                          print(
                              'Search Lat Long ---------> Latitude - ${locations.first.latitude}, Longitude - ${locations.first.longitude}');
                        },
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            print(
                                'Final location ---------> Address - ${locationController.searchController.value.text} \n LatLong ------> ${locationController.latLng.value.latitude}, ${locationController.latLng.value.longitude}');
                            // widget.callBack!(searchController.text,
                            //     LocationProvider().searchlocationData.latitude, LocationProvider().searchlocationData.longitude);

                            // widget.callBack!(searchController.text,
                            //     _latLng!.latitude, _latLng!.longitude);

                           Navigator.pop(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: redE2211C,
                            ),
                            child: Center(
                              child: CommonText(
                                text: "Use This location",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
