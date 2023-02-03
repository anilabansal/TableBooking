import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/view/reservation/widgets/resevation_reviews_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/reservation & rating/reservation_controller.dart';
import '../../../utils/common/common_strings.dart';
import '../../../utils/common/widgets_methods/common_button.dart';
import '../../../utils/common/widgets_methods/common_sized_box.dart';
import '../../../utils/common/widgets_methods/common_text.dart';
import '../../../utils/common/widgets_methods/restaurant_name_distance.dart';
import 'booking_details_pre_order_details.dart';
import 'booking_details_tab.dart';

class BookingDetailsView extends StatefulWidget {
  final String callFrom;
  const BookingDetailsView({Key? key, required this.callFrom})
      : super(key: key);
  @override
  State<BookingDetailsView> createState() => _BookingDetailsViewState();
}
class _BookingDetailsViewState extends State<BookingDetailsView> {
  ReservationController reservationController = Get.find();
  var data = Get.arguments;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uploadAllBookingDetails();
    loadPreOrderDetails();
  }

  uploadAllBookingDetails() {
    reservationController.bookedRestaurantDetailsLoading.value = true;
    reservationController.bookRestaurantDetailsApiCall(
        body: {"BookingId": data[0]["BookingId"]}).then((value) {
      if (value) {
        reservationController.bookedRestaurantDetailsLoading.value = false;
      }
    });
  }
  loadPreOrderDetails() {
    reservationController.orderMoreItemIsLoading.value = true;
    reservationController.orderMoreApiCall(body: {
      "BookingId": data[0]["BookingId"],
      "RestaurantId": data[0]["RestaurantId"]
    }).then((value) {
      if (value) {
        reservationController.orderMoreItemIsLoading.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommon(
        text: 'Booking Details',
      ),
      // body: BookingDetailsBody(
      //   callFrom: callFrom,
      // ),
      body: Obx(() {
        return reservationController.bookedRestaurantDetailsLoading.value && reservationController.orderMoreItemIsLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: redE2211C,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    // HEADER
                    CommonRestaurantNameDistance(
                      restaurantName: reservationController
                          .bookRestaurantDetails!
                          .bookinglistresponse
                          .restaurantName,
                      restaurantDistance: reservationController
                          .bookRestaurantDetails!.bookinglistresponse.distance,
                      restaurantPic: reservationController
                          .bookRestaurantDetails!
                          .bookinglistresponse
                          .restaurantPic,
                    ),
                    CommonSizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // BOOKING DETAILS
                          BookingDetailsTab(callFrom: widget.callFrom),
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
                            softWrap: true,
                            text: reservationController.bookRestaurantDetails!
                                        .bookinglistresponse.specialRequest !=
                                    ""
                                ? reservationController.bookRestaurantDetails!
                                    .bookinglistresponse.specialRequest
                                    .toString()
                                : "None",
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
                          CommonSizedBox(
                            height: 20,
                          ),
                          // TYPES OF SERVICES
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CommonText(
                                    text: 'Service Type',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const Spacer(),
                                  CommonSizedBox(
                                    // height: 50,
                                    child: widget.callFrom == "Running"
                                        ? Visibility(
                                      visible:reservationController
                                          .bookRestaurantDetails!
                                          .bookinglistresponse
                                          .serviceType
                                          .toString() ==
                                          "Full Service"?false:true ,
                                          child: CommonButton(
                                              height: 25,
                                              width: 80,
                                              fontSize: 12,
                                              onTap: () {
                                                // Get.toNamed('/pre-order');
                                                Get.toNamed(
                                                    '/order-more-reservations',
                                                    arguments: [
                                                      {
                                                        "BookingId":
                                                            reservationController
                                                                .bookRestaurantDetails!
                                                                .bookinglistresponse
                                                                .bookingId,
                                                        "RestaurantId":
                                                            reservationController
                                                                .bookRestaurantDetails!
                                                                .bookinglistresponse
                                                                .restaurantId,
                                                        "restaurantName": reservationController.bookRestaurantDetails!.bookinglistresponse.restaurantName,
                                                        "restaurantPic":reservationController.bookRestaurantDetails!.bookinglistresponse.restaurantPic,
                                                        "restaurantDistance":reservationController.bookRestaurantDetails!.bookinglistresponse.distance
                                                      }
                                                    ]);
                                              },
                                              textColor: Colors.white,
                                              bgColor: redE2211C,
                                              text: 'Order More',
                                            ),
                                        )
                                        : null,
                                  ),
                                ],
                              ),
                              CommonSizedBox(
                                height: 20,
                              ),
                              CommonText(
                                text: reservationController
                                    .bookRestaurantDetails!
                                    .bookinglistresponse
                                    .serviceType
                                    .toString(),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: redE2211C,
                              ),
                              CommonSizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(
                                    Icons.info,
                                    color: Colors.red,
                                  ),
                                  CommonSizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: CommonText(
                                      softWrap: true,
                                      text: reservationController
                                                  .bookRestaurantDetails!
                                                  .bookinglistresponse
                                                  .serviceType
                                                  .toString() ==
                                              "Full Service"
                                          ? "Order with server in restaurant"
                                          : reservationController
                                                      .bookRestaurantDetails!
                                                      .bookinglistresponse
                                                      .serviceType
                                                      .toString() ==
                                                  "No Service"
                                              ? "Pre order food and drink on the app as well as in restaurant. No server."
                                              : reservationController
                                                          .bookRestaurantDetails!
                                                          .bookinglistresponse
                                                          .serviceType
                                                          .toString() ==
                                                      "To Go"
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
                                height: 15,
                              ),
                              Visibility(
                                visible: reservationController
                                                .bookRestaurantDetails!
                                                .bookinglistresponse
                                                .serviceType
                                                .toString() ==
                                            "Full Service" ||
                                        reservationController
                                            .bookRestaurantDetails!
                                            .bookinglistresponse
                                            .orderlistdetail!
                                            .isEmpty
                                    ? false
                                    : true,
                                child: CommonText(
                                  text: 'Pre-Order',
                                  color: black000000,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              CommonSizedBox(
                                height: 15,
                              ),
                              // Pre Order Details
                              BookingDetailsPreOrderDetails(),
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
                              Row(
                                children: [
                                  CommonText(
                                    text: 'Payment Mode',
                                    color: black000000,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  // CommonSizedBox(
                                  //   height: 20,
                                  // ),
                                  const Spacer(),
                                  CommonText(
                                    text: reservationController
                                        .bookRestaurantDetails!
                                        .bookinglistresponse
                                        .paymentType,
                                    color: textGrey868686,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),

                              // const UpcomingReservationsPaymentDetails(),
                              CommonSizedBox(
                                height: 20,
                              ),

                              widget.callFrom == 'Upcoming'
                                  ?
                              Column(
                                children: [
                                  // Column(
                                  //   children: [
                                  //     Container(
                                  //       height: 1,
                                  //       width: Get.width,
                                  //       color: whiteE5E5E5,
                                  //     ),
                                  //     CommonSizedBox(
                                  //       height: 20,
                                  //     ),
                                  //     AddMoreScreen(),
                                  //     CommonSizedBox(
                                  //       height: 20,
                                  //     ),
                                  //   ],
                                  // ),
                                  // Visibility(
                                  //   visible: reservationController
                                  //       .bookRestaurantDetails!
                                  //       .bookinglistresponse
                                  //       .serviceType
                                  //       .toString() ==
                                  //       "Full Service"?false:true,
                                  //   child: CommonButton(
                                  //     onTap: () {},
                                  //     textColor: Colors.white,
                                  //     bgColor: redE2211C,
                                  //     text: 'Complete & Pay',
                                  //   ),
                                  // ),
                                ],
                              )
                                  : widget.callFrom == 'Running'
                                      ? Column(
                                        children: [
                                       // Column(
                                       //   children: [
                                       //     Container(
                                       //       height: 1,
                                       //       width: Get.width,
                                       //       color: whiteE5E5E5,
                                       //     ),
                                       //     CommonSizedBox(
                                       //       height: 20,
                                       //     ),
                                       //     AddMoreScreen(),
                                       //     CommonSizedBox(
                                       //       height: 20,
                                       //     ),
                                       //   ],
                                       // ),
                                       //    Visibility(
                                       //      visible: reservationController
                                       //          .bookRestaurantDetails!
                                       //          .bookinglistresponse
                                       //          .serviceType
                                       //          .toString() ==
                                       //          "Full Service"?false:true,
                                       //      child: CommonButton(
                                       //          onTap: () {},
                                       //          textColor: Colors.white,
                                       //          bgColor: redE2211C,
                                       //          text: 'Complete & Pay',
                                       //        ),
                                       //    ),
                                        ],
                                      )
                                      : ReservationReviewList(),

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
      }),
    );
  }
}
