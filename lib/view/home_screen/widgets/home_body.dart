import 'package:booking_table/controller/home/home_controller.dart';
import 'package:booking_table/controller/location/location_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/view/home_screen/widgets/map_home_widget.dart';
import 'package:booking_table/view/home_screen/widgets/restaurants_home_widget.dart';
import 'package:booking_table/view/home_screen/widgets/search_home_widget.dart';
import 'package:booking_table/view/profile_screen/search_location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_session/user_session_controller.dart';

class HomeBody extends StatelessWidget {
  HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<UserSessionController>(
                    builder: (userSessionController) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 5),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                homeController.drawerKey.currentState!
                                    .openDrawer();
                              },
                              child: Stack(
                                children: [
                                  userSessionController.isLogin == false
                                      ? const Icon(
                                          Icons.person,
                                          size: 50,
                                        )
                                      : userSessionController.profilePic != ""
                                          ? CommonSizedBox(
                                              height: 49,
                                              width: 49,
                                              child: ClipOval(
                                                child: Image.network(
                                                  userSessionController
                                                      .profilePic,
                                                  height: 49,
                                                  width: 49,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            )
                                          : const Icon(
                                              Icons.person,
                                              size: 40,
                                            ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Image.asset(drawerImage),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: userSessionController.isLogin == true
                                      ? userSessionController.fullName
                                      : "Guest User",
                                  color: black000000,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: black000000,
                                      size: 14,
                                    ),
                                    CommonSizedBox(
                                      width: 2,
                                    ),
                                    Obx(() {
                                      return SizedBox(
                                        width: Get.width * 0.5,
                                        child: CommonText(
                                          overflow: TextOverflow.clip,
                                          text: LocationController()
                                                      .searchController
                                                      .value
                                                      .text ==
                                                  null
                                              ? LocationController()
                                                  .currentAddress
                                                  .value
                                              : LocationController()
                                                  .searchController
                                                  .value
                                                  .text,
                                          color: black000000,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      );
                                    }),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          LocationController()
                                              .requestPermission()
                                              .then(
                                            (value) {
                                              print("Button");
                                              if (value) {
                                                Get.to(() =>
                                                    const SearchLocation());
                                              }
                                            },
                                          );
                                        },
                                        child: const Icon(
                                            Icons.keyboard_arrow_down)),
                                    // Image.asset(
                                    //   dropDownIconImage,
                                    //   width: 9,
                                    //   height: 12,
                                    // ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  const SearchBoxScreen(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(
                          text:
                              "${homeController.homeRestaurantCount.value.toString()} Restaurants",
                          fontFamily: interFont,
                          fontWeight: FontWeight.w500,
                          color: black000000,
                          fontSize: 16,
                        ),
                        Container(
                          width: 57,
                          height: 29,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: greyF4F4F4),
                          child: Center(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: InkWell(
                                    onTap: () {
                                      homeController.restaurantFilter.value =
                                          true;
                                    },
                                    child: Container(
                                      width: 24,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: homeController
                                                  .restaurantFilter.value
                                              ? black000000
                                              : greyF4F4F4),
                                      child: Center(
                                        child: Image.asset(
                                          menuImage,
                                          width: 14,
                                          height: 14,
                                          color: homeController
                                                  .restaurantFilter.value
                                              ? white
                                              : greyC1C1C1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    homeController.restaurantFilter.value =
                                        false;
                                  },
                                  child: Container(
                                    width: 24,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: homeController
                                                    .restaurantFilter.value ==
                                                false
                                            ? black000000
                                            : greyF4F4F4),
                                    child: Center(
                                      child: Image.asset(locationImage,
                                          width: 14,
                                          height: 14,
                                          color: homeController
                                                      .restaurantFilter.value ==
                                                  false
                                              ? white
                                              : greyC1C1C1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  homeController.restaurantFilter.value
                      ? RestaurantHomeScreen()
                      : const MapHomeScreen(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
