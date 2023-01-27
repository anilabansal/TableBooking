// ignore_for_file: must_be_immutable
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/utils/extensions/capitalization_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controller/book_a_table/book_a_table_controller.dart';
import '../../../controller/restaurant_details/restaurant_details_controller.dart';

class FullSummaryBookingDetailsView extends StatelessWidget {
  // String? callFrom;

  FullSummaryBookingDetailsView({
    // this.callFrom,
    Key? key,
  }) : super(key: key);

  // BookATableController bookATableController = Get.find();
  // RestaurantDetailsController restaurantsController = Get.find();
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        color: whiteF2F2F2,
        child:
            GetBuilder<BookATableController>(builder: (bookATableController) {
          return
            // bookATableController.serviceSummary == null
            //   ? CommonText(
            //       text: "No Data",
            //     )
            //   :
            Column(
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
                                    // text: 'May 24, 2022',
                                    text:
                                        '${(bookATableController.serviceSummary!.bookingDate)!.convertBookingTimeToFormat()}',
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
                                    text:
                                        '${DateFormat('h:mm a').format(DateFormat('HH:mm:ss').parse(bookATableController.serviceSummary!.bookingTime.toString()))}',
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
                            text:
                                '${bookATableController.serviceSummary!.partySize} Members',
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
                            text: bookATableController
                                        .serviceSummary!.serviceType
                                        .toString() ==
                                    "1"
                                ? 'Full Service'
                                : bookATableController
                                            .serviceSummary!.serviceType
                                            .toString() ==
                                        "2"
                                    ? 'Mid Service'
                                    : bookATableController
                                                .serviceSummary!.serviceType
                                                .toString() ==
                                            "3"
                                        ? 'No Service'
                                        : bookATableController
                                                    .serviceSummary!.serviceType
                                                    .toString() ==
                                                "4"
                                            ? 'To Go'
                                            : '',
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
                                  softWrap: true,
                                  text: bookATableController
                                              .serviceSummary!.serviceType
                                              .toString() ==
                                          "1"
                                      ? "Order with server in restaurant"
                                      : bookATableController
                                                  .serviceSummary!.serviceType
                                                  .toString() ==
                                              "3"
                                          ? "Pre order food and drink on the app as well as in restaurant. No server."
                                          : bookATableController.serviceSummary!
                                                      .serviceType
                                                      .toString() ==
                                                  "4"
                                              ? "Order food/drink to go"
                                              : "Pre-order food/drink via the app and have a server in restaurant",
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
                          Visibility(
                            visible: bookATableController
                                        .serviceSummary!.serviceType
                                        .toString() ==
                                    "1"
                                ? false
                                : true,
                            child: Row(
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
                                      Get.toNamed(
                                        'pre-order',
                                        arguments: [
                                          {
                                            "restaurantId": data[0]
                                                ['restaurantId'],
                                            "restaurantName": data[0]
                                                ["restaurantName"],
                                            "restaurantPic": data[0]
                                                ["restaurantPic"],
                                            "restaurantDistance": data[0]
                                                ["restaurantDistance"]
                                          },
                                        ],
                                      );
                                    },
                                    text: bookATableController
                                                .serviceSummary!.isOrderAdded ==
                                            true
                                        ? 'Edit'
                                        : 'Place Order',
                                    bgColor: redF2E6E6,
                                    fontSize: 14,
                                    textColor: redE2211C,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Visibility(
                            // visible:
                            //     bookATableController.serviceSummary!.isOrderAdded ==
                            //             true
                            //         ? true
                            //         : false,
                            child: GetBuilder<RestaurantDetailsController>(
                                builder: (restaurantsController) {
                              return Container(
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
                                      Visibility(
                                        visible: bookATableController
                                                    .serviceSummary!
                                                    .isOrderAdded ==
                                                true
                                            ? true
                                            : false,
                                        child: ListView.builder(
                                            itemCount: restaurantsController
                                                .cartItemsList.length,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              CommonText(
                                                                text: restaurantsController
                                                                    .cartItemsList[
                                                                        index]
                                                                    .itemName,
                                                                color:
                                                                    black0D0000,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
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
                                                                child:
                                                                    Container(
                                                                  // width: 80,
                                                                  // height: 50,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color:
                                                                        red0FE2211C,
                                                                  ),
                                                                  child: Center(
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          CommonText(
                                                                        text: restaurantsController
                                                                            .cartItemsList[index]
                                                                            .offerTitle
                                                                            .toString(),
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        color:
                                                                            black0D0000,
                                                                        fontSize:
                                                                            8,
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
                                                                text:
                                                                    "Quantity:",
                                                                color:
                                                                    textGrey868686,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                              CommonText(
                                                                text:
                                                                    " ${restaurantsController.cartItemsList[index].ItemQuantity}",
                                                                color:
                                                                    black0D0000,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                              const SizedBox(
                                                                width: 16,
                                                              ),
                                                              CommonText(
                                                                text: "Price:",
                                                                color:
                                                                    textGrey868686,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                              restaurantsController
                                                                          .cartItemsList[
                                                                              index]
                                                                          .isOfferItem ==
                                                                      false
                                                                  ? CommonText(
                                                                      text:
                                                                          " ${restaurantsController.cartItemsList[index].ItemTotalPrice}",
                                                                      color:
                                                                          black0D0000,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    )
                                                                  : Row(
                                                                      children: [
                                                                        CommonText(
                                                                          text:
                                                                              "\$ ${restaurantsController.cartItemsList[index].offerPrice.toString()}",
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color:
                                                                              redE2211C,
                                                                        ),
                                                                        const SizedBox(
                                                                          width:
                                                                              5,
                                                                        ),
                                                                        CommonText(
                                                                          text:
                                                                              "\$ ${restaurantsController.cartItemsList[index].ItemTotalPrice.toString()}",
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color:
                                                                              grey868686,
                                                                          decoration:
                                                                              TextDecoration.lineThrough,
                                                                        ),
                                                                      ],
                                                                    ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      InkWell(
                                                        onTap: () {
                                                          restaurantsController
                                                              .removeItemAtIndex(
                                                                  restaurantsController
                                                                      .cartItemsList[
                                                                          index]
                                                                      .ItemId,
                                                                  index);
                                                          // restaurantsController.subTotalPrice=restaurantsController
                                                          //     .cartItemsList[index].ItemTotalPrice;
                                                          // if(restaurantsController
                                                          //     .cartItemsList.isEmpty){
                                                          //   restaurantsController.subTotalPrice =  0.0;
                                                          // }else{
                                                          //   restaurantsController.subTotalPrice=restaurantsController
                                                          //       .cartItemsList[index].ItemTotalPrice;
                                                          // }
                                                        },
                                                        child: Container(
                                                          width: 27,
                                                          height: 27,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
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
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Visibility(
                                        visible: bookATableController
                                                    .serviceSummary!
                                                    .isOrderAdded ==
                                                true
                                            ? true
                                            : false,
                                        child: Column(
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
                                                      "\$ ${restaurantsController.subTotalPrice}",
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: black0D0000,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          CommonText(
                                            text: "Table Booking Amount",
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: black0D0000,
                                          ),
                                          const Spacer(),
                                          CommonText(
                                            text:
                                                "+\$ ${bookATableController.serviceSummary!.bookingConfirmationAmount}",
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: redE2211C,
                                          ),
                                        ],
                                      ),
                                      CommonText(
                                        softWrap: true,
                                        text:
                                            "This amount will be charge at booking confirmation and will be deduct on your total bill amount",
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: grey868686,
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
                                            text: "Grand Total",
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: black0D0000,
                                          ),
                                          const Spacer(),
                                          CommonText(
                                            text:
                                                "\$ ${restaurantsController.subTotalPrice! + bookATableController.serviceSummary!.bookingConfirmationAmount}",
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: black0D0000,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width: Get.width,
                                        height: 1,
                                        color: whiteE5E5E5,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
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
                                      Get.back();
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
                          ).paddingOnly(
                            bottom: 17,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
