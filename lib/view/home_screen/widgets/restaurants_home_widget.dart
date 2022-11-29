import 'package:booking_table/controller/restaurant_details/restaurant_details_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/no_data_found.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';

class RestaurantHomeScreen extends StatelessWidget {
  RestaurantHomeScreen({
    Key? key,
  }) : super(key: key);

  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantDetailsController>(
        builder: (restaurantDetails) {
      return homeController.homeRestaurantCount.value != null &&
              homeController.homeRestaurantCount.value != 0
          ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeController.homeRestaurantList.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: InkWell(
                          onTap: () {
                            restaurantDetails.index.value = homeController
                                .homeRestaurantList.value[index].restaurantId;
                            print('Button clicked');

                            restaurantDetails.restaurantDetails(body: {
                              "restaurantId": homeController
                                  .homeRestaurantList.value[index].restaurantId
                            }).then((value) {
                              // print(
                              //     "Restaurant Detais Data ====>  ${detailsRestaurantList.value}");
                              if (value) {
                                // controller.isLoading.value = false;
                                Get.toNamed('/restaurant-details', arguments: [
                                  {
                                    "restaurantId": homeController
                                        .homeRestaurantList
                                        .value[index]
                                        .restaurantId
                                  },
                                  {"index": index},
                                ]);
                              }
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Color.fromRGBO(0, 0, 0, 0.06),
                              //     blurRadius: 4.0,
                              //     offset: Offset(0.0, 10),
                              //   ),
                              // ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 11.0, right: 11.0, top: 11.0),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        width: Get.width,
                                        height: 150,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 133,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    // restaurantImage,
                                                    // ),
                                                    homeController
                                                        .homeRestaurantList[
                                                            index]
                                                        .restaurantPic),
                                                fit: BoxFit.cover)),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 20,
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 33,
                                          height: 33,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: greyF2F2F2),
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: IconButton(
                                                onPressed: () async {
                                                  print(
                                                      'Favorite Button Clicked');
                                                  homeController
                                                      .updateRestaurantLikeHome(
                                                          index: index,
                                                          restaurantId:
                                                              homeController
                                                                  .homeRestaurantList[
                                                                      index]
                                                                  .restaurantId);
                                                },
                                                icon: homeController
                                                        .homeRestaurantList[
                                                            index]
                                                        .isFavourite
                                                    ? const Icon(
                                                        Icons.favorite,
                                                        color: redE2211C,
                                                        size: 18,
                                                      )
                                                    : const Icon(
                                                        Icons.favorite,
                                                        color: greyCACACA,
                                                        size: 18,
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      11.0, 5, 11.0, 11.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonText(
                                        text: homeController
                                            .homeRestaurantList[index]
                                            .restaurantName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: black000000,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CommonText(
                                        text:
                                            "${homeController.homeRestaurantList[index].distance.toString()} miles away",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 15,
                                        color: grey868686,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })
              ]))
          : const CommonNoDataFound();
    });
  }
}
