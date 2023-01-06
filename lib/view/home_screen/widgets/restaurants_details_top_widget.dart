import 'package:booking_table/controller/restaurant_details/restaurant_details_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controller/home/home_controller.dart';

class RestaurantDetailTopScreen extends StatelessWidget {
  RestaurantDetailTopScreen({Key? key}) : super(key: key);

  //var data = Get.arguments;

  HomeController homeController = Get.find();

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
                        child: controller.detailsRestaurantList.value
                                    .restaurantPic ==
                                null
                            ? Image.asset(
                                restaurantImage,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                // restaurantImage,
                                controller
                                    .detailsRestaurantList.value.restaurantPic
                                    .toString(),
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
                            Expanded(
                              child: CommonText(
                                softWrap: true,
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
                                              .value.rating!
                                              .toDouble(),
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
                                      "Based on ${controller.detailsRestaurantList.value.ratingCount} reviews ",
                                  // text:
                                  //      homeController.homeRestaurantList[controller.index.value].rating.toString(),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: textDark3F3E3E,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    // await FlutterPhoneDirectCaller.callNumber(controller.detailsRestaurantList.value.contactNumber)
                                    controller.detailsRestaurantList.value
                                                .officialWebsite !=
                                            null
                                        ? await launchUrl(
                                            Uri(
                                              scheme: 'https',
                                              host: controller
                                                  .detailsRestaurantList
                                                  .value
                                                  .officialWebsite,
                                            ),
                                            mode:
                                                LaunchMode.externalApplication,
                                          )
                                        : ShowToast.show(
                                            isError: true,
                                            msg: "No Website Found",
                                          );
                                  },
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      // color: Colors.black,
                                      color: black0F0D0000,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        "assets/images/home/web.svg",
                                      ),
                                    ),
                                  ),
                                ),
                                CommonSizedBox(width: 5),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: red0FE2211C),
                                  child: InkWell(
                                    onTap: () async {
                                      // await FlutterPhoneDirectCaller.callNumber(controller.detailsRestaurantList.value.contactNumber)
                                      controller.detailsRestaurantList.value
                                                  .contactNumber !=
                                              null
                                          ? await launchUrl(
                                              Uri(
                                                  scheme: "tel",
                                                  // path: controller
                                                  //     .aboutUsRestaurantList[0]
                                                  //     .contactNumber,
                                                  path: controller
                                                      .detailsRestaurantList
                                                      .value
                                                      .contactNumber),
                                            )
                                          : ShowToast.show(
                                              isError: true,
                                              msg: "No Number Found",
                                            );
                                    },
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
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CommonButton(
                          onTap: () {
                            Get.toNamed(
                              '/add-card-details',
                              arguments: [
                                {
                                  "restaurantId": controller
                                      .detailsRestaurantList.value.restaurantId,
                                  "restaurantName": controller
                                      .detailsRestaurantList
                                      .value
                                      .restaurantName,
                                  "restaurantPic": controller
                                      .detailsRestaurantList
                                      .value
                                      .restaurantPic,
                                  "restaurantDistance": controller
                                      .detailsRestaurantList.value.distance,
                                },
                              ],
                            );
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
                      controller.updateRestaurantLikes();
                      homeController.favRestaurantUpdate(body: {
                        "restaurantId":
                            controller.detailsRestaurantList.value.restaurantId
                      });
                      // controller.updateRestaurantLikeRestaurantDetails(
                      //   // restaurantId: data[0]['restaurantId'],
                      //   restaurantId:
                      //       controller.detailsRestaurantList.value.restaurantId,
                      // );
                      // print("detail----${data[0]['restaurantId']}");
                    },
                    icon: controller.detailsRestaurantList.value.isFavourite ==
                            true
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
