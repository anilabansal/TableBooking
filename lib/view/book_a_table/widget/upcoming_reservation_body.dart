import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/utils/common/widgets_methods/restaurant_name_distance.dart';
import 'package:booking_table/view/book_a_table/widget/upcoming_reservation_booking_details.dart';
import 'package:booking_table/view/book_a_table/widget/upcoming_reservation_payment_details.dart';
import 'package:booking_table/view/book_a_table/widget/upcoming_reservation_pre_order_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingReservationBody extends StatelessWidget {
  const UpcomingReservationBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // HEADER
          const CommonRestaurantNameDistance(),
          CommonSizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // BOOKING DETAILS
                const UpcomingReservationBookingDetails(),
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
                // SERVICE TYPES
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: 'Service Type',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
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
                          Icons.error,
                          color: Colors.red,
                        ),
                        CommonSizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CommonText(
                            text:
                                'Traditional order when seated with a server.',
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
                    const UpcomingReservationPreOrderDetails(),
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
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
