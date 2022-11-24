import 'package:booking_table/controller/restaurant_details/restaurant_details_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/no_data_found.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutTabScreen extends StatelessWidget {
  const AboutTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantDetailsController>(
      builder: (controller) {
        return controller.aboutUsRestaurantList.value.isNotEmpty
            ? SingleChildScrollView(
                child: Column(
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 30,
                      child: CommonText(
                        text: controller.aboutUsRestaurantList[0].aboutUs
                            .toString(),
                        // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nisl odio, feugiat quis odio ut, molestie varius dui. Curabitur laoreet dignissim purus, eu fermentum nunc laoreet et. Fusce efficitur ipsum augue, dapibus exposure Podio exposure quits. Ut effendi ipsum in metes aliquot vehicular.",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: textDark3F3E3E,
                      ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: "Monday",
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: textDark3F3E3E,
                            ),
                            CommonText(
                              text: "09:00 AM - 10:00 PM",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: black0D0000,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CommonText(
                              text: "Wednesday",
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: textDark3F3E3E,
                            ),
                            CommonText(
                              text: "09:00 AM - 10:00 PM",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: black0D0000,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CommonText(
                              text: "Friday",
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: textDark3F3E3E,
                            ),
                            CommonText(
                              text: "09:00 AM - 10:00 PM",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: black0D0000,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CommonText(
                              text: "Sunday",
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: textDark3F3E3E,
                            ),
                            CommonText(
                              text: "Closed",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: redE2211C,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: "Tuesday",
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: textDark3F3E3E,
                            ),
                            CommonText(
                              text: "09:00 AM - 10:00 PM",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: black0D0000,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CommonText(
                              text: "Thursday",
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: textDark3F3E3E,
                            ),
                            CommonText(
                              text: "09:00 AM - 10:00 PM",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: black0D0000,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CommonText(
                              text: "Saturday",
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: textDark3F3E3E,
                            ),
                            CommonText(
                              text: "09:00 AM - 10:00 PM",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: black0D0000,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
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
                        CommonText(
                          text: controller.aboutUsRestaurantList[0].email
                              .toString(),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: redE2211C,
                          decoration: TextDecoration.underline,
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
                            text: controller.aboutUsRestaurantList[0].aboutUs
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
                          text: controller
                              .aboutUsRestaurantList[0].officialWebsite
                              .toString(),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: redE2211C,
                          decoration: TextDecoration.underline,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : const CommonNoDataFound();
      },
    );
  }
}
