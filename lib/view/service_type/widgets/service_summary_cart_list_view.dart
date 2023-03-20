import 'package:booking_table/controller/restaurant_details/restaurant_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/book_a_table/book_a_table_controller.dart';
import '../../../utils/common/common_strings.dart';
import '../../../utils/common/widgets_methods/common_sized_box.dart';
import '../../../utils/common/widgets_methods/common_text.dart';

class ServiceSummaryCartView extends StatelessWidget {
  ServiceSummaryCartView({Key? key}) : super(key: key);
  BookATableController bookATableController = Get.find();
  RestaurantDetailsController restaurantsController = Get.find();

  @override
  Widget build(BuildContext context) {
    restaurantsController.grandTotal = ((restaurantsController.subTotalPrice! * bookATableController.serviceSummary!.bookingConfirmationAmount!.toDouble())/100 )+ restaurantsController.subTotalPrice!;
    return Visibility(
      visible: restaurantsController.cartItemsList.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: greyF8F8F8,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15,
              top: 10,
            ),
            child: Column(
              children: [
                ListView.builder(
                    itemCount: restaurantsController.cartItemsList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonText(
                                          text: restaurantsController
                                              .cartItemsList[index].itemName,
                                          color: black0D0000,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Visibility(
                                          visible: restaurantsController
                                                      .cartItemsList[index]
                                                      .isOfferItem ==
                                                  true
                                              ? true
                                              : false,
                                          child: Container(
                                            // width: 80,
                                            // height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                              color: red0FE2211C,
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: CommonText(
                                                  text: restaurantsController
                                                      .cartItemsList[index]
                                                      .offerTitle
                                                      .toString(),
                                                  fontWeight: FontWeight.w500,
                                                  color: black0D0000,
                                                  fontSize: 8,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
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
                                              " ${restaurantsController.cartItemsList[index].ItemQuantity}",
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
                                        restaurantsController
                                                    .cartItemsList[index]
                                                    .isOfferItem ==
                                                false
                                            ? CommonText(
                                                text:
                                                    " ${restaurantsController.cartItemsList[index].addOnPriceQuantity!.toStringAsFixed(2)}",
                                                color: black0D0000,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              )
                                            : Row(
                                                children: [
                                                  CommonText(
                                                    text:
                                                        "\$ ${restaurantsController.cartItemsList[index].addOnOfferQuantity!.toStringAsFixed(2)}",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: redE2211C,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  CommonText(
                                                    text:
                                                        "\$ ${restaurantsController.cartItemsList[index].addOnPriceQuantity!.toStringAsFixed(2)}",
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
                                      visible: restaurantsController
                                              .cartItemsList[index]
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
                                                  itemCount:
                                                      restaurantsController
                                                          .cartItemsList[index]
                                                          .addOns!
                                                          .length,
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemBuilder: (context, i) {
                                                    return Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CommonText(
                                                          softWrap: true,
                                                          text:
                                                              " ${restaurantsController.cartItemsList[index].addOns![i].ingredientName!}",
                                                          color: black0D0000,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                        CommonText(
                                                          text: i ==
                                                                  (restaurantsController
                                                                          .cartItemsList[
                                                                              index]
                                                                          .addOns!
                                                                          .length -
                                                                      1)
                                                              ? ""
                                                              : ",",
                                                          color: black0D0000,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                    restaurantsController.removeItemAtIndex(
                                        restaurantsController
                                            .cartItemsList[index].ItemId,
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
                        ),
                      );
                    }),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
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
                              "\$${(restaurantsController.subTotalPrice!).toStringAsFixed(2)}",
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: black0D0000,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: Get.width,
                      height: 1,
                      color: whiteE5E5E5,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        CommonText(
                          text: "Tax",
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: black0D0000,
                        ),
                        const Spacer(),
                        CommonText(
                          text:
                              "${bookATableController.serviceSummary!.bookingConfirmationAmount.toString()}%",
                          // text: totalPrice.toString(),
                          // text: ,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: black0D0000,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              // text:
                              // "\$ ${(restaurantsController.subTotalPrice! * bookATableController.serviceSummary!.bookingConfirmationAmount!.toDouble())/100}",
                            text: "\$${(restaurantsController.grandTotal! ).toStringAsFixed(2)}",
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: black0D0000,
                            ),
                          ],
                        ),
                        CommonText(
                          text: "(Total Amount + Tax)",
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: black0D0000,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     CommonText(
                //       text: "Table Booking Amount",
                //       fontSize: 13,
                //       fontWeight: FontWeight.w600,
                //       color: black0D0000,
                //     ),
                //     const Spacer(),
                //     CommonText(
                //       text:
                //       "+\$ ${bookATableController.serviceSummary!.bookingConfirmationAmount.toStringAsFixed(2)}",
                //       fontSize: 13,
                //       fontWeight: FontWeight.w600,
                //       color: redE2211C,
                //     ),
                //   ],
                // ),
                // CommonText(
                //   softWrap: true,
                //   text:
                //   "This amount will be charge at booking confirmation and will be deduct on your total bill amount",
                //   fontSize: 10,
                //   fontWeight: FontWeight.w400,
                //   color: grey868686,
                // ),

                // Container(
                //   width: Get.width,
                //   height: 1,
                //   color: whiteE5E5E5,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
