import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  final myTabs = [
    Tab(
      // child: Container(
      //   height: 56,
      //   width: 156,
      //   color: Colors.black,
      // ),
      text: 'Upcoming',
    ),
    Tab(text: 'Previous'),
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }
}
