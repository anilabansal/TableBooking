// ignore_for_file: must_be_immutable

import 'package:booking_table/view/home_screen/widgets/drawer_home_widget.dart';
import 'package:booking_table/view/home_screen/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/home_controller.dart';

class HomeView extends StatelessWidget {
  String latitude = "30.713649330499276";
  String lonngitude = "76.69060936300099";
  HomeView({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: homeController.drawerKey,
      drawer: DrawerScreen(
        controller: homeController,
      ),
      body: HomeBody(homeController: homeController),
    );
  }
}
