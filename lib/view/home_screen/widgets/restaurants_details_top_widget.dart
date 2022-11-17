import 'package:booking_table/controller/restaurant_details/restaurant_details_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class RestaurantDetailTopScreen extends StatelessWidget {
  const RestaurantDetailTopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantDetailsController>(builder: (controller) {
      return Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 266,
                        child: Image.asset(
                          restaurantImage,

                          // homeController
                          //     .homeRestaurantList[controller.index.value]
                          //     .restaurantPic
                          //     .toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 25, 0, 0),
                          child: SizedBox(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.arrow_back,
                                  color: white,
                                  size: 20,
                                ),
                                CommonText(
                                  text: "Back",
                                  fontSize: 18,
                                  color: white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 230,
                color: white,
              )
            ],
          ),
          Positioned(
            top: 219,
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height: 300,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                  color: white),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: controller
                              .detailsRestaurantList.value.restaurantName
                              .toString(),
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: black000000,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CommonText(
                          text:
                              "${controller.detailsRestaurantList.value.distance.toString()} miles away",
                          color: textGrey868686,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 3.0),
                              child: Icon(
                                Icons.location_on,
                                size: 15,
                                color: black000000,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 55,
                              child: CommonText(
                                text: controller
                                    .detailsRestaurantList.value.address
                                    .toString(),
                                fontFamily: interFont,
                                fontWeight: FontWeight.w400,
                                color: textDark3F3E3E,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    RatingBarIndicator(
                                      itemSize: 20,
                                      rating: controller.detailsRestaurantList
                                                  .value.rating ==
                                              null
                                          ? 0
                                          : controller.detailsRestaurantList
                                              .value.rating!,
                                      // minRating: 1,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      //itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CommonText(
                                      text: controller.detailsRestaurantList
                                                  .value.rating ==
                                              null
                                          ? "0"
                                          : controller.detailsRestaurantList
                                              .value.rating!
                                              .toString(),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: black0D0000,
                                    ),
                                    CommonText(
                                      text: " of 5",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: textGrey868686,
                                    ),
                                  ],
                                ),
                                CommonText(
                                  /// Currently Null Please Uncomment if not  Null
                                  text:
                                      "${controller.detailsRestaurantList.value.ratingCount == null ? 0 : controller.detailsRestaurantList.value.ratingCount.toString()} Ratings",
                                  // text:
                                  //      homeController.homeRestaurantList[controller.index.value].rating.toString(),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: textDark3F3E3E,
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: red0FE2211C),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.call_rounded,
                                    color: redE2211C,
                                    size: 15,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  CommonText(
                                    text: "Call",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: redE2211C,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CommonButton(
                          onTap: () {
                            Get.toNamed('/add-card-details');
                          },
                          text: "Book Now",
                          bgColor: redE2211C,
                          textColor: white,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(lineImage),
                ],
              ),
            ),
          ),
          Positioned(
            top: 207,
            right: 30,
            child: Container(
              width: 33,
              height: 33,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: greyF2F2F2),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: IconButton(
                    onPressed: () {
                      controller.updateRestaurantLike();
                    },
                    icon: controller.detailsRestaurantList.value.isFavourite!
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
          ),
        ],
      );
    });
  }
}
