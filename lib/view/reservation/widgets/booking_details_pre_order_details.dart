import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/reservation & rating/reservation_controller.dart';


class BookingDetailsPreOrderDetails extends StatelessWidget {
  BookingDetailsPreOrderDetails({
    Key? key,
  }) : super(key: key);
  ReservationController reservationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: whiteF8F8F8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Visibility(
            visible: reservationController.bookRestaurantDetails!
                            .bookinglistresponse.serviceType
                            .toString() ==
                        "Full Service" ||
                    reservationController.bookRestaurantDetails!
                        .bookinglistresponse.orderlistdetail!.isEmpty
                ? false
                : true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
            itemCount:reservationController.bookRestaurantDetails!
                .bookinglistresponse.orderlistdetail!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                  return Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(
                           text:reservationController.bookRestaurantDetails!
                               .bookinglistresponse.orderlistdetail![index].itemName ,
                            color:
                            black0D0000,
                            fontSize: 13,
                            fontWeight:
                            FontWeight
                                .w400,
                          ),

                          CommonText(
                            text:'X${reservationController.bookRestaurantDetails!
                                .bookinglistresponse.orderlistdetail![index].itemQuantity.toString()}' ,
                            color:
                            grey868686,
                            fontSize: 12,
                            fontWeight:
                            FontWeight
                                .w400,
                          ),
                          CommonText(
                            text:reservationController.bookRestaurantDetails!
                                .bookinglistresponse.orderlistdetail![index].itemTotalPrice.toString() ,
                            color:
                            black0D0000,
                            fontSize: 12,
                            fontWeight:
                            FontWeight
                                .w400,
                          ),

                        ],
                      ),

                          ]);

                } ),

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
                      text: 'Total Amount',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    CommonText(
                      text: '\$${reservationController.bookRestaurantDetails!
                          .bookinglistresponse.totalAmount}',
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

          /// TotalBookingAmount , tip if paid ,and grandTotal to be visible for all service type
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CommonText(
                    text: 'Total Booking Amount',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  CommonText(
                    text: '+\$100.00',
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
                height: 5,
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
                    text: '\$${reservationController.bookRestaurantDetails!.bookinglistresponse.tip}',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ],
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
                    text: '\$${reservationController.bookRestaurantDetails!.bookinglistresponse.grandTotal}',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
