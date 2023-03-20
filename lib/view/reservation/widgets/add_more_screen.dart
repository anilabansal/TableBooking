import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/reservation & rating/reservation_controller.dart';
import '../../../utils/common/common_strings.dart';
import '../../../utils/common/widgets_methods/common_sized_box.dart';
import '../../../utils/common/widgets_methods/common_text.dart';
import 'order_more_payment.dart';

class AddMoreScreen extends StatelessWidget {
  final int? bookingId;

  AddMoreScreen({
    Key? key,
    this.bookingId,
  }) : super(key: key);
  ReservationController reservationController = Get.find();

  @override
  Widget build(BuildContext context) {
    reservationController.taxAddedOrderMore =
        ((reservationController.subTotalPrice!.toDouble() *
                reservationController
                    .bookRestaurantDetails!.bookinglistresponse.tax!
                    .toDouble()) /
            100);
    reservationController.totalAmountOrderMore =
        reservationController.subTotalPrice +
            reservationController.taxAddedOrderMore;
    reservationController.tipAddedOrderMore = reservationController
            .bookRestaurantDetails!.bookinglistresponse.tip!
            .endsWith('%')
        ? ((reservationController.totalAmountOrderMore! *
                double.parse(reservationController
                    .bookRestaurantDetails!.bookinglistresponse.tip!
                    .replaceAll('%', ''))) /
            100)
        : 0.0;
    return Column(
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
          text: "New Order",
          color: black0D0000,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        CommonSizedBox(
          height: 12,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9), color: greyF8F8F8),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                ListView.builder(
                    itemCount: reservationController.cartNewItemsList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CommonText(
                                        text: reservationController
                                            .cartNewItemsList[index].itemName,
                                        color: black0D0000,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CommonText(
                                        text: "Quantity:",
                                        color: textGrey868686,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      CommonText(
                                        text:
                                            " ${reservationController.cartNewItemsList[index].ItemQuantity}",
                                        color: black0D0000,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      CommonText(
                                        text: "Price:",
                                        color: textGrey868686,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      reservationController
                                                  .cartNewItemsList[index]
                                                  .isOfferItem ==
                                              false
                                          ? CommonText(
                                              text:
                                                  " ${reservationController.cartNewItemsList[index].addOnPriceQuantity!.toStringAsFixed(2)}",
                                              color: black0D0000,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            )
                                          : Row(
                                              children: [
                                                CommonText(
                                                  text:
                                                      "\$ ${reservationController.cartNewItemsList[index].addOnOfferQuantity!.toStringAsFixed(2)}",
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: redE2211C,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                CommonText(
                                                  text:
                                                      "\$ ${reservationController.cartNewItemsList[index].addOnPriceQuantity.toString()}",
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: grey868686,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              ],
                                            ),
                                    ],
                                  ),
                                  CommonSizedBox(
                                    height: 5,
                                  ),
                                  Visibility(
                                    visible: reservationController
                                            .cartNewItemsList[index]
                                            .addOns!
                                            .isNotEmpty
                                        ? true
                                        : false,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonText(
                                          text: "Ingredients:",
                                          color: textGrey868686,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        Wrap(children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            height: 20,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: reservationController
                                                    .cartNewItemsList[index]
                                                    .addOns!
                                                    .length,
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, i) {
                                                  return Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      CommonText(
                                                        softWrap: true,
                                                        text:
                                                            " ${reservationController.cartNewItemsList[index].addOns![i].ingredientName}",
                                                        color: black0D0000,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      Visibility(
                                                        visible: i !=
                                                                (reservationController
                                                                        .cartNewItemsList[
                                                                            index]
                                                                        .addOns!
                                                                        .length -
                                                                    1)
                                                            ? true
                                                            : false,
                                                        child: CommonText(
                                                          text: ",",
                                                          color: black0D0000,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }),
                                          ),
                                        ])
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  reservationController.removeItemAtIndex(
                                      reservationController
                                          .cartNewItemsList[index].ItemId,
                                      index);
                                },
                                child: Container(
                                  width: 27,
                                  height: 27,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: white,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: Get.width,
                            height: 1,
                            color: whiteE5E5E5,
                          ),
                        ],
                      );
                    }),

                ///ToDo: to add tax percentage
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CommonText(
                          text:
                              "Tax (${reservationController.bookRestaurantDetails!.bookinglistresponse.tax}%)",
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: black0D0000,
                        ),
                        const Spacer(),
                        CommonText(
                          text:
                              "\$${reservationController.taxAddedOrderMore!.toStringAsFixed(2)}",
                          // text: totalPrice.toString(),
                          // text: ,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: black0D0000,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CommonText(
                          text: "Total Amount",
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: black0D0000,
                        ),
                        const Spacer(),
                        CommonText(
                          text:
                              "\$${reservationController.totalAmountOrderMore!.toStringAsFixed(2)}",
                          // text: totalPrice.toString(),
                          // text: ,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: black0D0000,
                        ),
                      ],
                    ),
                    // Container(
                    //   width: Get.width,
                    //   height: 1,
                    //   color: whiteE5E5E5,
                    // ),
                  ],
                ),
                Visibility(
                  visible: reservationController
                      .bookRestaurantDetails!.bookinglistresponse.tip!
                      .endsWith('%'),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CommonText(
                            text:
                                "Tip (${reservationController.bookRestaurantDetails!.bookinglistresponse.tip})",
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: black0D0000,
                          ),
                          const Spacer(),
                          CommonText(
                            text:
                                "\$${reservationController.tipAddedOrderMore!.toStringAsFixed(2)}",
                            // text: totalPrice.toString(),
                            // text: ,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: black0D0000,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: Get.width,
                        height: 1,
                        color: whiteE5E5E5,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    CommonText(
                      text: "Grand Total",
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: black0D0000,
                    ),
                    const Spacer(),
                    CommonText(
                      text:
                          "\$${(reservationController.totalAmountOrderMore! + reservationController.tipAddedOrderMore!).toStringAsFixed(2)}",
                      // text: totalPrice.toString(),
                      // text: ,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: black0D0000,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        CommonSizedBox(
          height: 20,
        ),
        Container(
          width: Get.width,
          height: 1,
          color: whiteE5E5E5,
        ).paddingOnly(
          top: 5,
          bottom: 5,
        ),
        CommonSizedBox(
          height: 12,
        ),

        /// Payment Method
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     CommonText(
        //       textAlign: TextAlign.left,
        //       text: 'Select Payment Mode',
        //       color: black000000,
        //       fontSize: 18,
        //       fontWeight: FontWeight.w600,
        //     ),
        //     CommonSizedBox(
        //       height: 20,
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         selectPaymentContainer(
        //           image: Visibility(
        //             visible: false,
        //             child: Image.asset(
        //               venmoLogo,
        //               height: 16,
        //               width: 16,
        //             ),
        //           ),
        //           'Credit Card',
        //           onTap: () {
        //             reservationController.selectPaymentMode.value = "Credit Card";
        //           },
        //           isSelected:
        //           reservationController.selectPaymentMode.value == "Credit Card",
        //         ),
        //         const SizedBox(
        //           width: 12,
        //         ),
        //         selectPaymentContainer(
        //           image: Image.asset(
        //             reservationController.selectPaymentMode.value == "Apple"
        //                 ? appleIcon
        //                 : appleBlackLogo,
        //             height: 16,
        //             width: 16,
        //           ),
        //           'Apple',
        //           onTap: () {
        //             reservationController.selectPaymentMode.value = "Apple";
        //           },
        //           isSelected: reservationController.selectPaymentMode.value == "Apple",
        //         ),
        //         const SizedBox(
        //           width: 12,
        //         ),
        //         selectPaymentContainer(
        //             image: Image.asset(
        //               googleIcon,
        //               height: 16,
        //               width: 16,
        //             ),
        //             'Pay', onTap: () {
        //           reservationController.selectPaymentMode.value = "Pay";
        //         }, isSelected: reservationController.selectPaymentMode.value == "Pay"),
        //       ],
        //     ),
        //     CommonSizedBox(
        //       height: 18,
        //     ),
        //     // selectPaymentContainer( "Pay At Restaurant")
        //     InkWell(
        //       onTap: () {
        //         reservationController.selectPaymentMode.value = "Pay At Restaurant";
        //       },
        //       child: Container(
        //         height: 32,
        //         width: 137,
        //         alignment: Alignment.center,
        //         decoration: BoxDecoration(
        //           color: reservationController.selectPaymentMode.value ==
        //               "Pay At Restaurant"
        //               ? black0D0000
        //               : greyF8F8F8,
        //           borderRadius: BorderRadius.circular(4),
        //         ),
        //         child: CommonText(
        //           textAlign: TextAlign.center,
        //           text: 'Pay At Restaurant',
        //           fontSize: 15,
        //           fontWeight: FontWeight.w400,
        //           color: reservationController.selectPaymentMode.value ==
        //               "Pay At Restaurant"
        //               ? white
        //               : greyA2A2A2,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        CommonSizedBox(
          height: 20,
        ),
        // OrderMorePaymentMode(
        //   bookingId: bookingId,
        // )
        // CommonButton(
        //   onTap: () {},
        //   textColor: Colors.white,
        //   bgColor: redE2211C,
        //   text: 'Complete & Pay',
        // ),
      ],
    );
  }
// /// payment mode container
// selectPaymentContainer(iconText, {image, onTap, isSelected}) {
//   return Expanded(
//     child: InkWell(
//       onTap: onTap,
//       child: Container(
//         height: 32,
//         width: 82,
//         decoration: BoxDecoration(
//           color: isSelected ? black0D0000 : greyF8F8F8,
//           borderRadius: BorderRadius.circular(4),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(right: 0.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // const Icon(
//               //   Icons.apple,
//               //   color: white,
//               // ),
//               image,
//               CommonSizedBox(
//                 width: 8,
//               ),
//               CommonText(
//                 text: iconText,
//                 fontSize: 15,
//                 fontWeight: FontWeight.w400,
//                 color: isSelected ? white : greyA2A2A2,
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
}
