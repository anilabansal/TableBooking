// ignore_for_file: must_be_immutable

import 'package:booking_table/view/home_screen/widgets/drawer_home_widget.dart';
import 'package:booking_table/view/home_screen/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: controller.drawerKey,
      drawer: DrawerScreen(),
      body: HomeBody(),
    );
  }
}