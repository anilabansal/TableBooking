import 'package:booking_table/controller/home/home_controller.dart';
import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/view/home_screen/widgets/filter_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/common/widgets_methods/common_app_bar.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());
  final dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: appBarCommon(text: "Filter"),
      body: FilterScreenBody(),
    );
  }
}
