import 'package:booking_table/controller/restaurant_details/restaurant_details_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/no_data_found.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/common/widgets_methods/shimmers/grid_shimmer_widget.dart';

class AboutTabScreen extends StatefulWidget {
  final int? restaurantId;

  const AboutTabScreen({Key? key, this.restaurantId}) : super(key: key);

  @override
  State<AboutTabScreen> createState() => _AboutTabScreenState();
}

class _AboutTabScreenState extends State<AboutTabScreen> {
  RestaurantDetailsController restaurantsController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    loadAllAboutUs();
    super.initState();
  }

  loadAllAboutUs() {
    restaurantsController.isLoading.value = true;
    restaurantsController.restaurantDetailsAboutUs(
        body: {"RestaurantId": widget.restaurantId}).then(
      (value) {
        if (value) {
          restaurantsController.isLoading.value = false;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantDetailsController>(
      builder: (controller) {
        return
            // controller.aboutUsRestaurantList.value.isNotEmpty
            //   ?
            controller.isLoading.value
                ?
                // const Center(
                //         child: CircularProgressIndicator(
                //           color: redE2211C,
                //         ),
                //       )
                const AboutShimmer()
                : controller.aboutUsRestaurantList.isNotEmpty
                    ? ListView(
                        primary: false,
                        controller: ScrollController(keepScrollOffset: false),
                        shrinkWrap: true,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                text: "Description",
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: black000000,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CommonText(
                                softWrap: true,
                                text: controller
                                    .aboutUsRestaurantList[0].aboutUs
                                    .toString(),
                                // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nisl odio, feugiat quis odio ut, molestie varius dui. Curabitur laoreet dignissim purus, eu fermentum nunc laoreet et. Fusce efficitur ipsum augue, dapibus exposure Podio exposure quits. Ut effendi ipsum in metes aliquot vehicular.",
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: textDark3F3E3E,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              CommonText(
                                text: "Schedule",
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: black000000,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 3,
                                ),
                                shrinkWrap: true,
                                itemCount: controller
                                    .aboutUsRestaurantList[0].schedule.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      CommonText(
                                        text:
                                            "${controller.aboutUsRestaurantList[0].schedule[index].openingDay.toString()}",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        color: textDark3F3E3E,
                                      ),
                                      CommonText(
                                        text: controller
                                                    .aboutUsRestaurantList[0]
                                                    .schedule[index]
                                                    .openingHour
                                                    .toString() !=
                                                "null"
                                            ? "${DateFormat('h:mm a').format(DateFormat('H:mm:ss').parse(controller.aboutUsRestaurantList[0].schedule[index].openingHour.toString()))}- ${DateFormat('h:mm a').format(DateFormat('H:mm:ss').parse(controller.aboutUsRestaurantList[0].schedule[index].closingHour.toString()))}"
                                            : "---",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: black0D0000,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CommonText(
                                text: "Contact",
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: black000000,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  CommonText(
                                    text: "Email:",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: textGrey868686,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: CommonText(
                                      softWrap: true,
                                      text: controller
                                          .aboutUsRestaurantList[0].email
                                          .toString(),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: redE2211C,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: "Phone Number:",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: textGrey868686,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: CommonText(
                                      text: controller.aboutUsRestaurantList[0]
                                          .contactNumber
                                          .toString(),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: black0D0000,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  CommonText(
                                    text: "Website:",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: textGrey868686,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  CommonText(
                                    text: controller.aboutUsRestaurantList[0]
                                        .officialWebsite
                                        .toString(),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: redE2211C,
                                    decoration: TextDecoration.underline,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    : const CommonNoDataFound();
        // : const CommonNoDataFound();
      },
    );
  }
}
