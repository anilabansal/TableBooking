import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/view/home_screen/widgets/drawer_home_widget.dart';
import 'package:booking_table/view/home_screen/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        key: homeController.drawerKey,
        drawer: const DrawerScreen(),
        body: HomeBody(homeController: homeController));
  }
}
