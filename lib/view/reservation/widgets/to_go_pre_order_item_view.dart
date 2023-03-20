import 'package:booking_table/controller/reservation%20&%20rating/reservation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/common/common_strings.dart';
import '../../../utils/common/widgets_methods/common_sized_box.dart';
import '../../../utils/common/widgets_methods/common_text.dart';

class ToGoBookedItemsView extends StatelessWidget {
  ToGoBookedItemsView({Key? key}) : super(key: key);
  ReservationController reservationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: reservationController.bookRestaurantDetails!.bookinglistresponse
              .gotoorderlistdetail!.isEmpty
          ? Container()
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: whiteF8F8F8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                      itemCount: reservationController.bookRestaurantDetails!
                          .bookinglistresponse.gotoorderlistdetail!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(
                                text: reservationController
                                    .bookRestaurantDetails!
                                    .bookinglistresponse
                                    .gotoorderlistdetail![index]
                                    .itemName,
                                color: black0D0000,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                              CommonText(
                                text:
                                    'X${reservationController.bookRestaurantDetails!.bookinglistresponse.gotoorderlistdetail![index].itemQuantity.toString()}',
                                color: grey868686,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              CommonText(
                                text:
                                    '\$${reservationController.bookRestaurantDetails!.bookinglistresponse.gotoorderlistdetail![index].itemTotalPrice!.toStringAsFixed(2)}',
                                color: black0D0000,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          CommonSizedBox(
                            height: 5,
                          ),
                          Visibility(
                            visible: reservationController
                                    .bookRestaurantDetails!
                                    .bookinglistresponse
                                    .gotoorderlistdetail![index]
                                    .addOns!
                                    .isNotEmpty
                                ? true
                                : false,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: "Ingredients:",
                                  color: textGrey868686,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                Wrap(children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 20,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: reservationController
                                            .bookRestaurantDetails!
                                            .bookinglistresponse
                                            .gotoorderlistdetail![index]
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
                                                CrossAxisAlignment.start,
                                            children: [
                                              CommonText(
                                                softWrap: true,
                                                text:
                                                    " ${reservationController.bookRestaurantDetails!.bookinglistresponse.gotoorderlistdetail![index].addOns![i].addOnName}",
                                                color: black0D0000,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              Visibility(
                                                visible: i !=
                                                        (reservationController
                                                                .bookRestaurantDetails!
                                                                .bookinglistresponse
                                                                .gotoorderlistdetail![
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
                                                  fontWeight: FontWeight.w500,
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
                        ]);
                      }),

                  CommonSizedBox(
                    height: 13,
                  ),
                  Container(
                    height: 1,
                    width: Get.width,
                    color: whiteE5E5E5,
                  ),
                  CommonSizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CommonText(
                        text: 'Tax',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      CommonText(
                        text: '${reservationController.bookRestaurantDetails!.bookinglistresponse.tax!.toString()}%',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  CommonSizedBox(
                    height: 13,
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
                        text: '\$${reservationController.bookRestaurantDetails!
                            .bookinglistresponse.toGoTotalAmount!.toStringAsFixed(2)}',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  CommonSizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
