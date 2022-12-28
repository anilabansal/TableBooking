import 'package:booking_table/controller/restaurant_details/restaurant_details_controller.dart';
import 'package:booking_table/view/home_screen/widgets/restaurant_details_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/location/location_controller.dart';
import '../../controller/user_session/user_session_controller.dart';

class RestaurantDetailView extends StatefulWidget {
  // final int? restaurantId;
  const RestaurantDetailView({
    Key? key,
  }) : super(key: key);

  @override
  State<RestaurantDetailView> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  RestaurantDetailsController controller = Get.find();
  UserSessionController userController = Get.find();
  LocationController locationController = Get.find();
  //ProfileController profileController = Get.put(ProfileController());
  // _getAddressFromLatLng() async {
  //   locationController.isLoading.value = true;
  //   await locationController.requestPermission().then(
  //     (value) async {
  //       try {
  //         locationController.isLoading.value = false;
  //         print(
  //             'LOCATION ========> ${locationController.locationData!.latitude}/${locationController.locationData!.longitude}');
  //         List<Placemark> placemarks = await placemarkFromCoordinates(
  //             locationController.locationData!.latitude!,
  //             locationController.locationData!.longitude!);
  //         Placemark place = placemarks[0];
  //         locationController.currentAddress.value =
  //             "${place.name},${place.locality},${place.subLocality},${place.administrativeArea}, ${place.country}";
  //       } catch (e) {
  //         print(e);
  //       }
  //     },
  //   );
  // }
  var data = Get.arguments;

  @override
  void initState() {
    super.initState();
    loadAllRestaurantDetails();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(
      () {
        controller.selectedIndex.value = _tabController.index;
      },
    );
  }

  loadAllRestaurantDetails() {
    controller.isLoading.value = true;
    userController.isLogin == true
        ? controller.restaurantDetails(
            body: {
              "RestaurantId": data[0]['restaurantId'],
            },
          ).then(
            (value) {
              print("succesfullcone!");
              controller.isLoading.value = false;
            },
          )
        : controller.restaurantDetails(
            body: {
              "RestaurantId": data[0]['restaurantId'],
              "Latitude": locationController.latLng.value.latitude.toString(),
              "Longitude": locationController.latLng.value.longitude.toString(),
            },
          ).then(
            (value) {
              print("succesfullcone!");
              controller.isLoading.value = false;
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RestaurantDetailsBody(
        restaurantId: data[0]['restaurantId'],
        tabController: _tabController,
      ),
    );
  }
}
