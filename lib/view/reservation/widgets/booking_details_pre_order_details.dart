import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/reservation & rating/reservation_controller.dart';

class BookingDetailsPreOrderDetails extends StatelessWidget {
  final String? callFrom;
  BookingDetailsPreOrderDetails({
    Key? key,this.callFrom
  }) : super(key: key);
  ReservationController reservationController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: reservationController.bookRestaurantDetails!
          .bookinglistresponse.serviceType
          .toString() ==
          "Full Service" ||
          reservationController.bookRestaurantDetails!
              .bookinglistresponse.orderlistdetail!.isEmpty
          ? false
          : true,
      child: Container(
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
                    .bookinglistresponse.orderlistdetail!.length,
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
                              .orderlistdetail![index]
                              .itemName,
                          color: black0D0000,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        CommonText(
                          text:
                              'X${reservationController.bookRestaurantDetails!.bookinglistresponse.orderlistdetail![index].itemQuantity.toString()}',
                          color: grey868686,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        CommonText(
                          text:
                              '\$${reservationController.bookRestaurantDetails!.bookinglistresponse.orderlistdetail![index].itemTotalPrice!.toStringAsFixed(2)}',
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
                              .orderlistdetail![index]
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
                                      .orderlistdetail![index]
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
                                              " ${reservationController.bookRestaurantDetails!.bookinglistresponse.orderlistdetail![index].addOns![i].addOnName}",
                                          color: black0D0000,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        Visibility(
                                          visible: i !=
                                                  (reservationController
                                                          .bookRestaurantDetails!
                                                          .bookinglistresponse
                                                          .orderlistdetail![
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
                  text:'${reservationController.bookRestaurantDetails!.bookinglistresponse.tax!.toString()}%',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ],
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
                  text:
                      '\$${reservationController.bookRestaurantDetails!.bookinglistresponse.totalAmount!.toStringAsFixed(2)}',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CommonText(
                  text: 'Tip',
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
                CommonText(
                  text: reservationController
                      .bookRestaurantDetails!.bookinglistresponse.tip!
                      .endsWith('%')
                      ? '${reservationController.bookRestaurantDetails!.bookinglistresponse.tip}'
                      : '\$${reservationController.bookRestaurantDetails!.bookinglistresponse.tip}',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            // Visibility(
            //  visible:reservationController.bookRestaurantDetails!.bookinglistresponse.toGoTotalAmount==0.0?false:true ,
            //   child: Padding(
            //     padding: const EdgeInsets.only(top:8.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: <Widget>[
            //         CommonText(
            //           text: 'To Go TotalAmount',
            //           fontSize: 13,
            //           fontWeight: FontWeight.w400,
            //         ),
            //         CommonText(
            //           text:
            //           '\$${reservationController.bookRestaurantDetails!.bookinglistresponse.toGoTotalAmount!.toStringAsFixed(2)}',
            //           fontSize: 12,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
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
                Column(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      softWrap: true,
                      text: 'Grand Total ',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    // CommonText(
                    //   softWrap: true,
                    //   text:callFrom == "Running"? '(To Go TotalAmount + TotalAmount) ':'' ,
                    //   fontSize: 13,
                    //   fontWeight: FontWeight.w400,
                    // ),
                  ],
                ),
                CommonText(
                  // text:
                  //     '\$${(reservationController.bookRestaurantDetails!.bookinglistresponse.toGoTotalAmount!+reservationController.bookRestaurantDetails!.bookinglistresponse.totalAmount!).toStringAsFixed(2)}',
                  text: "\$${reservationController.bookRestaurantDetails!.bookinglistresponse.grandTotal!.toStringAsFixed(2)}",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            // CommonSizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
    );
  }
}
