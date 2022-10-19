import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/utils/common/widgets_methods/restaurant_name_distance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingBookingDetailsView extends StatelessWidget {
  const UpcomingBookingDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommon(
        text: 'Booking Details',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CommonRestaurantNameDistance(),
            CommonSizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: 'Booking Details',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          CommonSizedBox(
                            height: 20,
                          ),
                          CommonText(
                            text: 'Date',
                            color: textLight868686,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonSizedBox(
                            height: 5,
                          ),
                          CommonText(
                            color: black000000,
                            text: '24 may, 2022',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonSizedBox(
                            height: 25,
                          ),
                          CommonText(
                            text: 'Party Size',
                            color: textLight868686,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonSizedBox(
                            height: 5,
                          ),
                          CommonText(
                            color: black000000,
                            text: '2 Members',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonSizedBox(
                            height: 25,
                          ),
                          CommonText(
                            text: 'Type of Food',
                            color: textLight868686,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonSizedBox(
                            height: 5,
                          ),
                          CommonText(
                            color: black000000,
                            text: 'Continental',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 25,
                            width: 72,
                            alignment: Alignment.center,
                            child: CommonText(
                              text: 'Upcoming',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.center,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19),
                              color: Colors.black,
                            ),
                          ),
                          CommonSizedBox(
                            height: 15,
                          ),
                          CommonText(
                            text: 'Date',
                            color: textLight868686,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonSizedBox(
                            height: 5,
                          ),
                          CommonText(
                            color: black000000,
                            text: '24 may, 2022',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonSizedBox(
                            height: 25,
                          ),
                          CommonText(
                            text: 'Special Occasion',
                            color: textLight868686,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonSizedBox(
                            height: 5,
                          ),
                          CommonText(
                            color: black000000,
                            text: 'Anniversary',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonSizedBox(
                            height: 25,
                          ),
                          CommonText(
                            text: 'Tip',
                            color: textLight868686,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonSizedBox(
                            height: 5,
                          ),
                          CommonText(
                            color: black000000,
                            text: 'None',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 13),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: whiteE5E5E5,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      text: 'Spicy Crunchy Chicken',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CommonSizedBox(
                                      height: 5,
                                    ),
                                    CommonText(
                                      text: 'Spicy Crunchy Chicken',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CommonSizedBox(
                                      height: 5,
                                    ),
                                    CommonText(
                                      text: 'Finnish Salmon & Dill Pie',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CommonSizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    CommonText(
                                      text: 'X1',
                                      fontSize: 12,
                                      color: textLight868686,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CommonSizedBox(
                                      height: 5,
                                    ),
                                    CommonText(
                                      text: 'X2',
                                      color: textLight868686,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CommonSizedBox(
                                      height: 5,
                                    ),
                                    CommonText(
                                      text: 'X3',
                                      fontSize: 12,
                                      color: textLight868686,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CommonSizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    CommonText(
                                      text: '\$ 42.90',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CommonSizedBox(
                                      height: 5,
                                    ),
                                    CommonText(
                                      text: '\$ 42.90',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CommonSizedBox(
                                      height: 5,
                                    ),
                                    CommonText(
                                      text: '\$ 42.90',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    CommonSizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            CommonSizedBox(
                              height: 13,
                            ),
                            Container(
                              height: 1,
                              width: Get.width,
                              color: whiteE5E5E5,
                            ),
                            CommonSizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CommonText(
                                  text: 'Total Amount',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                                CommonText(
                                  text: '\$42.05',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            CommonSizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CommonText(
                                  text: 'Total Booking Amount',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                                CommonText(
                                  text: '-\$100.00',
                                  fontSize: 12,
                                  color: redE2211C,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            CommonText(
                              textAlign: TextAlign.left,
                              text:
                                  'This amount will be charge at booking confirmation\nand will be deduct on your total bill amount',
                              fontSize: 10,
                              color: textLight868686,
                              fontWeight: FontWeight.w400,
                            ),
                            CommonSizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 1,
                              width: Get.width,
                              color: whiteE5E5E5,
                            ),
                            CommonSizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CommonText(
                                  text: 'Grand Total',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                                CommonText(
                                  text: '\$115.05',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ],
                        ),
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
                      CommonText(
                        text: 'Payment',
                        color: black000000,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
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
