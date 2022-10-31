import 'package:booking_table/controller/home/home_controller.dart';
import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/view/home_screen/widgets/restaurant_details_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantDetailScreen extends StatefulWidget {
  const RestaurantDetailScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  HomeController restaurantController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      restaurantController.selectedIndex.value = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: RetaurantDetailsBody(
          tabController: _tabController,
          restaurantController: restaurantController),
    );
  }
}
