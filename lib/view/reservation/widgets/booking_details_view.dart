import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/common/common_strings.dart';
import '../../../utils/common/widgets_methods/common_button.dart';
import '../../../utils/common/widgets_methods/common_sized_box.dart';
import '../../../utils/common/widgets_methods/common_text.dart';
import '../../../utils/common/widgets_methods/restaurant_name_distance.dart';
import '../../book_a_table/widget/booking_table_payment_details.dart';
import 'booking_details_pre_order_details.dart';
import 'booking_details_tab.dart';

class BookingDetailsView extends StatelessWidget {
  String callFrom;
  BookingDetailsView({Key? key, required this.callFrom}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommon(
        text: 'Booking Details',
      ),
      // body: BookingDetailsBody(
      //   callFrom: callFrom,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // HEADER
            const CommonRestaurantNameDistance(
              restaurantName: 'Venisa’s Kitchen',
              restaurantDistance: 5,
            ),
            CommonSizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // BOOKING DETAILS
                  BookingDetailsTab(callFrom: callFrom),
                  CommonSizedBox(
                    height: 25,
                  ),
                  CommonText(
                    color: textLight868686,
                    text: 'Allergies or Special Requests',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  CommonSizedBox(
                    height: 5,
                  ),
                  CommonText(
                    softWrap: true,
                    text:
                    'Do not spice up the food as we are also having children.',
                    color: black000000,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  CommonSizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1,
                    width: Get.width,
                    color: whiteE5E5E5,
                  ),
                  CommonSizedBox(
                    height: 20,
                  ),
                  // TYPES OF SERVICES
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CommonText(
                            text: 'Service Type',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          const Spacer(),
                          CommonSizedBox(
                            // height: 50,
                            child: callFrom == "Running"
                                ? CommonButton(
                              height: 25,
                              width: 80,
                              fontSize: 12,
                              onTap: () {
                                // Get.toNamed('/pre-order');
                              },
                              textColor: Colors.white,
                              bgColor: redE2211C,
                              text: 'Edit',
                            )
                                : null,
                          ),
                        ],
                      ),
                      CommonSizedBox(
                        height: 20,
                      ),
                      CommonText(
                        text: 'Full Service',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: redE2211C,
                      ),
                      CommonSizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.info,
                            color: Colors.red,
                          ),
                          CommonSizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CommonText(
                              text: 'Order from server in restaurant.',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: textLight868686,
                            ),
                          ),
                        ],
                      ),
                      CommonSizedBox(
                        height: 15,
                      ),
                      CommonText(
                        text: 'Pre-Order',
                        color: black000000,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      CommonSizedBox(
                        height: 15,
                      ),
                      // Pre Order Details
                      const BookingDetailsPreOrderDetails(),
                      CommonSizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 1,
                        width: Get.width,
                        color: whiteE5E5E5,
                      ),
                      CommonSizedBox(
                        height: 20,
                      ),
                      CommonText(
                        text: 'Payment',
                        color: black000000,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      CommonSizedBox(
                        height: 20,
                      ),
                      const UpcomingReservationsPaymentDetails(),
                      CommonSizedBox(
                        height: 30,
                      ),

                      callFrom == 'Upcoming'
                          ? CommonSizedBox(
                        height: 50,
                        child: CommonButton(
                          onTap: () {
                            Get.toNamed('/reviews');
                          },
                          textColor: Colors.white,
                          bgColor: redE2211C,
                          text: 'Submit Review',
                        ),
                      )
                          : callFrom == 'Running'
                          ? CommonButton(
                        onTap: () {},
                        textColor: Colors.white,
                        bgColor: redE2211C,
                        text: 'Complete & Pay',
                      )
                          : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 1,
                            width: Get.width,
                            color: whiteE5E5E5,
                          ),
                          CommonSizedBox(
                            height: 20,
                          ),
                          CommonText(
                            text: 'Reviews',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          CommonSizedBox(
                            height: 20,
                          ),
                          CommonText(
                            softWrap: true,
                            text:
                            'It’s a great experience. The ambiance is very welcoming and charming. Amazing wines, food and service. Staff are extremely knowledgeable and make great recommendations.',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonSizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                yellowStar,
                                height: 12,
                                width: 12,
                              ),
                              CommonSizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                yellowStar,
                                height: 12,
                                width: 12,
                              ),
                              CommonSizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                yellowStar,
                                height: 12,
                                width: 12,
                              ),
                              CommonSizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                yellowStar,
                                height: 12,
                                width: 12,
                              ),
                              CommonSizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                greyStar,
                                height: 12,
                                width: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                      CommonSizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
