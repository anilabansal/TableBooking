

import 'package:booking_table/controller/home/home_controller.dart';
import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/view/home_screen/widgets/about_tab_widget.dart';
import 'package:booking_table/view/home_screen/widgets/gallery_tab_widget.dart';
import 'package:booking_table/view/home_screen/widgets/menu_tab_widget.dart';
import 'package:booking_table/view/home_screen/widgets/restaurants_details_top_widget.dart';
import 'package:booking_table/view/home_screen/widgets/reviews_tab_widget.dart';
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
      restaurantController.selectedIndex.value = _tabController!.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          primary: false,
          controller: ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          children: [
            const RestaurantDetailTopScreen(),
            Obx(
              () => TabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 4.0,
                  unselectedLabelColor: textGrey868686,
                  indicatorColor: redE2211C,
                  labelColor: black000000,
                  tabs: [
                    Tab(
                      // text: "Menu",
                      child: CommonText(
                        text: "Menu",
                        fontSize: 16,
                        fontWeight:
                            restaurantController.selectedIndex.value == 0
                                ? FontWeight.w500
                                : FontWeight.w400,
                      ),
                    ),
                    Tab(
                      // text: "About",
                      child: CommonText(
                        text: "About",
                        fontSize: 16,
                        fontWeight:
                            restaurantController.selectedIndex.value == 1
                                ? FontWeight.w500
                                : FontWeight.w400,
                      ),
                    ),
                    Tab(
                      // text: "Reviews",
                      child: CommonText(
                        text: "Reviews",
                        fontSize: 16,
                        fontWeight:
                            restaurantController.selectedIndex.value == 2
                                ? FontWeight.w500
                                : FontWeight.w400,
                      ),
                    ),
                    Tab(
                      // text: "Gallery",
                      child: CommonText(
                        text: "Gallery",
                        fontSize: 16,
                        fontWeight:
                            restaurantController.selectedIndex.value == 3
                                ? FontWeight.w500
                                : FontWeight.w400,
                      ),
                    )
                  ]),
            ),
            const SizedBox(height: 30,),
            SizedBox(
               // height: double.maxFinite,
               height: MediaQuery.of(context).size.height-100,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TabBarView(controller: _tabController, children:  [
                  const MenuTab(),
                  const AboutTabScreen(),
                  const ReviewsTabScreen(),
                  GalleryTab()
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
