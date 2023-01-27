import 'package:booking_table/controller/home/home_controller.dart';
import 'package:booking_table/controller/location/location_controller.dart';
import 'package:booking_table/controller/restaurant_details/restaurant_details_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/no_data_found.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/common/widgets_methods/shimmers/common_shimmer_widget.dart';

class FavouriteBody extends StatefulWidget {
  const FavouriteBody({
    Key? key,
  }) : super(key: key);

  @override
  State<FavouriteBody> createState() => _FavouriteBodyState();
}

class _FavouriteBodyState extends State<FavouriteBody> {
  RestaurantDetailsController restaurantDetails = Get.find();
  HomeController homeController = Get.find();
  LocationController locationController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    loadFavouriteList();
    super.initState();
  }

  loadFavouriteList() {
    homeController.isLoading.value = true;
    homeController.favRestaurantDetailList(
      body: {
        'latitude': locationController.latLng.value.latitude.toString(),
        'longitude': locationController.latLng.value.longitude.toString(),
      },
    ).then(
      (value) {
        homeController.isLoading.value = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return
        // GetBuilder<HomeController>(builder: (controller)
        Obx(() {
      return homeController.isLoading.value == true
          ? const CommonShimmerRestaurantCardWidget()
          // const Center(
          //         child: CircularProgressIndicator(
          //           color: redE2211C,
          //         ),
          //       )
          :
          // controller.favRestaurantList.isNotEmpty
          //   ?
          Padding(
              padding: const EdgeInsets.all(15.0),
              child: homeController.favRestaurantList.isNotEmpty
                  ? ListView.builder(
                      itemCount: homeController.favRestaurantList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          // Button
                          child: InkWell(
                            onTap: () {
                              restaurantDetails.restaurantDetails(body: {
                                "restaurantId": homeController
                                    .favRestaurantList[index].restaurantId
                              }).then(
                                (value) {
                                  // print(
                                  //     "Restaurant Detais Data ====>  ${detailsRestaurantList.value}");
                                  if (value) {
                                    // controller.isLoading.value = false;
                                    Get.toNamed(
                                      '/restaurant-details',
                                      arguments: [
                                        {
                                          "restaurantId": homeController
                                              .favRestaurantList[index]
                                              .restaurantId
                                        },
                                        {"index": index},
                                      ],
                                    );
                                  }
                                },
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.06),
                                      blurRadius: 4.0,
                                      offset: Offset(0.0, 10),
                                    ),
                                  ]),
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 150,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 133,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: homeController
                                                        .favRestaurantList[
                                                            index]
                                                        .restaurantPic ==
                                                    null
                                                ? DecorationImage(
                                                    image: AssetImage(
                                                        restaurantImage),
                                                    fit: BoxFit.cover,
                                                  )
                                                : DecorationImage(
                                                    image: NetworkImage(
                                                      homeController
                                                          .favRestaurantList[
                                                              index]
                                                          .restaurantPic,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 20,
                                          child: InkWell(
                                            onTap: () {
                                              // homeController
                                              //     .updateFavouriteRestaurantLikes(index);
                                              homeController
                                                  .updateRestaurantLikeFav(
                                                index: index,
                                                restaurantId: homeController
                                                    .favRestaurantList[index]
                                                    .restaurantId,
                                              );
                                            },
                                            child: Container(
                                              width: 33,
                                              height: 33,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: greyF2F2F2,
                                              ),
                                              child: Center(
                                                child: homeController
                                                        .favRestaurantList[
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
                                        )
                                      ],
                                    ),
                                  ),
                                  // BODY PART
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        11.0, 5, 11.0, 11.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonText(
                                          text: homeController
                                              .favRestaurantList[index]
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
                                              "${(homeController.favRestaurantList[index].distance)} miles away",
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
                  : const CommonNoDataFound(),
            );
    });
  }
}
