// ignore_for_file: must_be_immutable

import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullSummaryBookingDetailsView extends StatelessWidget {
  String? callFrom;
  FullSummaryBookingDetailsView({
    this.callFrom,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child:
      // ExpansionTile(
      //     backgroundColor: whiteF2F2F2,
      //     trailing: const Icon(
      //       Icons.arrow_drop_down_outlined,
      //       color: black000000,
      //     ),
      //     collapsedBackgroundColor: whiteF2F2F2,
      //     title:
      Container(
        color: whiteF2F2F2,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 18, left: 16),
              alignment: Alignment.centerLeft,
              child: CommonText(
                textAlign: TextAlign.left,
                color: black000000,
                text: 'Booking Details',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 20.0,
                top: 20.0,
              ),
              height: 1,
              width: Get.width * 0.9,
              color: redE2211C,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                            text: 'May 24, 2022',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: 'Time',
                            color: textLight868686,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonSizedBox(
                            height: 5,
                          ),
                          CommonText(
                            color: black000000,
                            text: '09:00 PM',
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
                    text: '5 Members',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  CommonSizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 20.0,
              ),
              height: 1,
              width: Get.width * 0.9,
              color: redE2211C,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
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
                    text: 'Mid Service',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: redE2211C,
                  ),
                  CommonSizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          'Pre-Order your food and drink and still have a server in restaurant.',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: textLight868686,
                        ),
                      ),
                    ],
                  ),
                  CommonSizedBox(
                    height: 24,
                  ),
                  callFrom == 'Pre Order'
                      ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(
                            text: 'Pre-Order',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: black000000,
                          ),
                          SizedBox(
                            height: 40,
                            width: 100,
                            child: CommonButton(
                              onTap: () {
                                Get.toNamed('pre-order');
                              },
                              text: 'Add More',
                              bgColor: redF2E6E6,
                              fontSize: 14,
                              textColor: redE2211C,
                            ),
                          ),
                        ],
                      ),
                      CommonSizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 13,
                          bottom: 30,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      fontWeight: FontWeight.w500,
                                      text: 'Spicy Crunchy Chicken',
                                      fontSize: 15,
                                    ),
                                    Row(
                                      children: [
                                        CommonText(
                                          fontWeight: FontWeight.w500,
                                          text: 'Quantity: ',
                                          fontSize: 12,
                                          color: textLight868686,
                                        ),
                                        CommonText(
                                          fontWeight: FontWeight.w500,
                                          text: '2',
                                          fontSize: 12,
                                          // color: textLight868686,
                                        ),
                                        CommonSizedBox(
                                          width: 16,
                                        ),
                                        CommonText(
                                          fontWeight: FontWeight.w500,
                                          text: 'Price: ',
                                          fontSize: 12,
                                          color: textLight868686,
                                        ),
                                        CommonText(
                                          fontWeight: FontWeight.w500,
                                          text: '\$ 152.00',
                                          fontSize: 12,
                                          // color: textLight868686,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.close,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 15, bottom: 15),
                              width: Get.width,
                              height: 1,
                              color: whiteE5E5E5,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      fontWeight: FontWeight.w500,
                                      text: 'Spicy Crunchy Chicken',
                                      fontSize: 15,
                                    ),
                                    Row(
                                      children: [
                                        CommonText(
                                          fontWeight: FontWeight.w500,
                                          text: 'Quantity: ',
                                          fontSize: 12,
                                          color: textLight868686,
                                        ),
                                        CommonText(
                                          fontWeight: FontWeight.w500,
                                          text: '2',
                                          fontSize: 12,
                                          // color: textLight868686,
                                        ),
                                        CommonSizedBox(
                                          width: 16,
                                        ),
                                        CommonText(
                                          fontWeight: FontWeight.w500,
                                          text: 'Price: ',
                                          fontSize: 12,
                                          color: textLight868686,
                                        ),
                                        CommonText(
                                          fontWeight: FontWeight.w500,
                                          text: '\$ 152.00',
                                          fontSize: 12,
                                          // color: textLight868686,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.close,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 15, bottom: 15),
                              width: Get.width,
                              height: 1,
                              color: whiteE5E5E5,
                            ),

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
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
                            Container(
                              alignment: Alignment.centerLeft,
                              child: CommonText(
                                textAlign: TextAlign.left,
                                text:
                                'This amount will be charge at booking confirmation\nand will be deduct on your total bill amount',
                                fontSize: 10,
                                color: textLight868686,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            CommonSizedBox(
                              height: 5,
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
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
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

                            // Row(
                            //   mainAxisAlignment:
                            //       MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Column(
                            //       crossAxisAlignment:
                            //           CrossAxisAlignment.start,
                            //       children: [
                            //         CommonText(
                            //           fontWeight: FontWeight.w500,
                            //           text: 'Spicy Crunchy Chicken',
                            //           fontSize: 15,
                            //         ),
                            //         CommonText(
                            //           fontWeight: FontWeight.w500,
                            //           text: 'Quantity: 2',
                            //           fontSize: 12,
                            //           color: textLight868686,
                            //         ),
                            //       ],
                            //     ),
                            //     const Icon(
                            //       Icons.close,
                            //       color: Colors.black,
                            //       size: 18,
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ],
                  )
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: 'Pre-Order',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: black000000,
                      ),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: CommonButton(
                          onTap: () {
                            Get.toNamed('pre-order');
                          },
                          text: 'Place Order',
                          bgColor: redF2E6E6,
                          fontSize: 14,
                          textColor: redE2211C,
                        ),
                      ),
                    ],
                  ),
                  // CommonSizedBox(
                  //   height: 20,
                  // ),
                  CommonSizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 33,
                      width: 181,
                      decoration: BoxDecoration(
                        color: black000000,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 16,
                          ),
                          CommonSizedBox(
                            width: 9,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed('/edit-a-table');
                            },
                            child: CommonText(
                              text: 'Edit Your Booking',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).paddingOnly(bottom: 17),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
