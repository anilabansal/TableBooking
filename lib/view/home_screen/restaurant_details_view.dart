import 'package:booking_table/controller/restaurant_details/restaurant_details_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/view/home_screen/widgets/restaurant_details_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantDetailView extends StatefulWidget {
  // final int? restaurantId;
  const RestaurantDetailView({Key? key,}) : super(key: key);

  @override
  State<RestaurantDetailView> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  RestaurantDetailsController controller = Get.find();
  var data = Get.arguments;
  @override
  void initState() {
    super.initState();
    loadAllRestaurantDetails();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      controller.selectedIndex.value = _tabController.index;
    });
  }

  loadAllRestaurantDetails() {
   controller.isLoading.value = true;
    controller.restaurantDetails(
      body: {
        "RestaurantId": data[0]['restaurantId'],
      },
    ).then((value) {
      print("succesfullcone!");
     controller.isLoading.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      RetaurantDetailsBody(
        restaurantId: data[0]['restaurantId'],
              tabController: _tabController,
            ),
    );
  }
}
