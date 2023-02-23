import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/utils/extensions/capitalization_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controller/reservation & rating/reservation_controller.dart';
import '../../../model/reservation/restaurant_booking_list_modal.dart';

class UpComingPreviousRunningReservations extends StatelessWidget {
  final List<Upcominglist>? bookRestaurantList;
  final String? callFrom;

  UpComingPreviousRunningReservations({
    Key? key,
    this.bookRestaurantList,
    this.callFrom,
  }) : super(key: key);

  ReservationController reservationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return bookRestaurantList!.isEmpty
        ? Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(
                text: "No Data Found!!",
                color: redE2211C,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                reservationController.bookRestaurantIsLoading.value = true;
                reservationController.reservationBookingRestaurantsApiCall().then((value) {
                  if (value) {
                    reservationController.bookRestaurantIsLoading.value = false;
                  }
                });
                // reservationController
                //     .reservationBookingRestaurantsApiCall();
              },
              child: Container(
                //color: Colors.white,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: textGrey868686,),
                    color: Colors.transparent),
                padding: const EdgeInsets.all(8),
                child:   CommonText(
                  text: "Try Again",
                  color: redE2211C,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        )
        : RefreshIndicator(
            color: redE2211C,
            onRefresh: () async {
              await reservationController
                  .reservationBookingRestaurantsApiCall();
            },
            child: ListView.builder(
              itemCount: bookRestaurantList!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    callFrom == 'upComing'
                        ? Get.toNamed(
                            '/upcoming-booking',
                            arguments: [
                              {
                                "BookingId":
                                    bookRestaurantList![index].bookingId,
                                "RestaurantId":
                                    bookRestaurantList![index].restaurantId,
                              }
                            ],
                          )
                        : callFrom == 'running'
                            ? Get.toNamed(
                                '/running-booking',
                                arguments: [
                                  {
                                    "BookingId":
                                        bookRestaurantList![index].bookingId,
                                    "RestaurantId":
                                        bookRestaurantList![index].restaurantId
                                  }
                                ],
                              )
                            : Get.toNamed(
                                '/previous-booking',
                                arguments: [
                                  {
                                    "BookingId":
                                        bookRestaurantList![index].bookingId,
                                    "RestaurantId":
                                        bookRestaurantList![index].restaurantId
                                  }
                                ],
                              );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 4),
                            color: Color.fromRGBO(0, 0, 0, 0.06),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: [
                                      Container(
                                        height: 118,
                                        width: 98,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(6),
                                            topRight: Radius.circular(6),
                                          ),
                                          image: bookRestaurantList![index]
                                                      .restaurantPic ==
                                                  null
                                              ? const DecorationImage(
                                                  image: AssetImage(
                                                      bookATableImage),
                                                  fit: BoxFit.cover,
                                                )
                                              : DecorationImage(
                                                  image: NetworkImage(
                                                    bookRestaurantList![index]
                                                        .restaurantPic!,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(6),
                                            bottomRight: Radius.circular(6),
                                          ),
                                        ),
                                        height: 18,
                                        width: 98,
                                        alignment: Alignment.center,
                                        child: CommonText(
                                          text: bookRestaurantList![index]
                                              .serviceType
                                              .toString(),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                        vertical: 15,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          CommonText(
                                            text: bookRestaurantList![index]
                                                        .restaurantName ==
                                                    null
                                                ? ""
                                                : bookRestaurantList![index]
                                                    .restaurantName
                                                    .toString(),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          CommonSizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Icon(Icons.place),
                                              Expanded(
                                                child: CommonText(
                                                  softWrap: true,
                                                  color: textDark3F3E3E,
                                                  text:
                                                      bookRestaurantList![index]
                                                                  .address ==
                                                              null
                                                          ? ""
                                                          : bookRestaurantList![
                                                                  index]
                                                              .address
                                                              .toString(),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: interFont,
                                                ),
                                              ),
                                            ],
                                          ),
                                          CommonSizedBox(
                                            height: 18,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: <Widget>[
                                                  const Icon(
                                                    size: 20,
                                                    Icons.calendar_month,
                                                    color: redE2211C,
                                                  ),
                                                  CommonText(
                                                    text:
                                                        '${(bookRestaurantList![index].bookingDate)!.convertBookingTimeToFormat()}',
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: interFont,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  const Icon(
                                                    Icons.watch_later,
                                                    color: redE2211C,
                                                    size: 20,
                                                  ),
                                                  CommonText(
                                                    text:
                                                        '${DateFormat('h:mm a').format(DateFormat('HH:mm:ss').parse(bookRestaurantList![index].bookingTime.toString()))}',
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: interFont,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: callFrom == 'previous' &&
                                        bookRestaurantList![index]
                                                .isUserSubmitReview ==
                                            false
                                    ? true
                                    : false,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      height: 1,
                                      width: Get.width,
                                      color: whiteE5E5E5,
                                    ),
                                    Center(
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed('/reviews', arguments: [
                                            {
                                              "restaurantName":
                                                  bookRestaurantList![index]
                                                      .restaurantName,
                                              "restaurantPic":
                                                  bookRestaurantList![index]
                                                      .restaurantPic,
                                              "restaurantId":
                                                  bookRestaurantList![index]
                                                      .restaurantId,
                                              "bookingId":
                                                  bookRestaurantList![index]
                                                      .bookingId,
                                              "isUserSubmitReview":
                                                  bookRestaurantList![index]
                                                      .isUserSubmitReview
                                            }
                                          ]);
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 110,
                                          margin: const EdgeInsets.only(
                                            top: 8,
                                          ),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: redE2211C,
                                          ),
                                          child: CommonText(
                                            color: Colors.white,
                                            text: 'Submit Review',
                                            textAlign: TextAlign.center,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
