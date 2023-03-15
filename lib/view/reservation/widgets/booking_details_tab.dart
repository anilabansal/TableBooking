import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/utils/extensions/capitalization_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/reservation & rating/reservation_controller.dart';

class BookingDetailsTab extends StatelessWidget {
  final String callFrom;

  BookingDetailsTab({
    required this.callFrom,
    Key? key,
  }) : super(key: key);
  ReservationController reservationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CommonText(
              text: 'Booking Details',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(),
            callFrom == 'Upcoming'
                ? Container(
                    height: 25,
                    width: 72,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: Colors.black,
                    ),
                    child: CommonText(
                      text: 'Upcoming',
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                  )
                : callFrom == 'Running'
                    ? Container(
                        height: 25,
                        width: 72,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          color: red26E2211C,
                        ),
                        child: CommonText(
                          text: 'In-Process',
                          color: redE2211C,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Container(
                        height: 25,
                        width: 72,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          color: Colors.green,
                        ),
                        child: CommonText(
                          text: 'Completed',
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        ),
                      ),
          ],
        ),
        CommonSizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // BOOKING DETAILS TOP VIEW
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // CommonText(
                //   text: 'Booking Details',
                //   fontSize: 18,
                //   fontWeight: FontWeight.w600,
                // ),
                // CommonSizedBox(
                //   height: 20,
                // ),
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
                  text:
                      '${(reservationController.bookRestaurantDetails!.bookinglistresponse.bookingDate)!.convertBookingTimeToFormat()}',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                CommonSizedBox(
                  height: 25,
                ),
                reservationController.bookRestaurantDetails!.bookinglistresponse
                            .serviceType
                            .toString() ==
                        "To Go"
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                            text: reservationController.bookRestaurantDetails!
                                        .bookinglistresponse.specialOccasion !=
                                    ""
                                ? reservationController.bookRestaurantDetails!
                                    .bookinglistresponse.specialOccasion
                                    .toString()
                                : "None",
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      )
                    : Column(
                        children: [
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
                                '${reservationController.bookRestaurantDetails!.bookinglistresponse.partySize} Members',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
              ],
            ),
            // BOOKING DEATIS BOTTOM VIEW

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
                      '${DateFormat('h:mm a').format(DateFormat('HH:mm:ss').parse(reservationController.bookRestaurantDetails!.bookinglistresponse.bookingTime.toString()))}',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                CommonSizedBox(
                  height: 25,
                ),
                Visibility(
                  visible: reservationController.bookRestaurantDetails!
                              .bookinglistresponse.serviceType
                              .toString() ==
                          "To Go"
                      ? false
                      : true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                        text: reservationController.bookRestaurantDetails!
                                    .bookinglistresponse.specialOccasion !=
                                ""
                            ? reservationController.bookRestaurantDetails!
                                .bookinglistresponse.specialOccasion
                                .toString()
                            : "None",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                )

                // CommonSizedBox(
                //   height: 25,
                // ),
                // CommonText(
                //   text: 'Tip',
                //   color: textLight868686,
                //   fontSize: 13,
                //   fontWeight: FontWeight.w400,
                // ),
                // CommonSizedBox(
                //   height: 5,
                // ),
                // CommonText(
                //   color: black000000,
                //   text: 'None',
                //   fontSize: 15,
                //   fontWeight: FontWeight.w400,
                // ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
