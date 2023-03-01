import 'dart:convert';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/view/payment/payment_done_view.dart';
import 'package:booking_table/view/payment/widgets/card_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/book_a_table/book_a_table_controller.dart';
import '../../controller/card_details/add_card_details_controller.dart';
import '../../controller/reservation & rating/reservation_controller.dart';
import '../../controller/reservation & rating/to_go_reservation_controller.dart';
import '../../controller/restaurant_details/restaurant_details_controller.dart';
import '../../utils/common/toast_message.dart';
import '../../utils/common/widgets_methods/common_app_bar.dart';
import '../../utils/common/widgets_methods/common_text.dart';
import '../../utils/common/widgets_methods/progress_loader.dart';

class PaymentMethodView extends StatefulWidget {
  final String? callFrom;

  const PaymentMethodView({Key? key, this.callFrom}) : super(key: key);

  @override
  State<PaymentMethodView> createState() => _PaymentMethodViewState();
}

class _PaymentMethodViewState extends State<PaymentMethodView> {
  AddCardDetailsController addCardDetailsController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAllCards();
  }

  loadAllCards() {
    addCardDetailsController.isUserCardListIsLoading.value = true;
    addCardDetailsController.savedCardListDataApi().then((value) {
      if (value) {
        addCardDetailsController.isUserCardListIsLoading.value = false;
      }
    });
  }

  BookATableController bookATableController = Get.find();
  RestaurantDetailsController restaurantDetailsController = Get.find();
  ToGoReservationController toGoReservationController = Get.find();
  ReservationController reservationController = Get.find();
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: appBarCommon(text: "Payment Method"),
      // body: const PaymentMethodBody(),
      body: Obx(() {
        return addCardDetailsController.isUserCardListIsLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: redE2211C,
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CommonText(
                        text: "Add More",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: black000000,
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const InfoIcon(),
                          const Icon(
                            Icons.info,
                            size: 16,
                            color: redE2211C,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Expanded(
                            // width: MediaQuery.of(context).size.width - 60,
                            child: CommonText(
                              softWrap: true,
                              text:
                                  "You can add another credit card by simply scanning your card.",
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: textGrey868686,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(() => CardScanPopUpView());
                          Get.toNamed('/add-card-details');
                        },
                        child: Center(
                          child: Container(
                            width: 188,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: black0D0000),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.add,
                                    color: white,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  CommonText(
                                    text: "Add Card",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset(lineImage),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: "Saved Cards",
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: black0D0000,
                          ),
                          const Spacer(),
                          widget.callFrom == 'Drawer' ||
                                  addCardDetailsController.userAllCardList.value
                                      .userCardlist!.isEmpty
                              ? Container()
                              : InkWell(
                                  onTap: () {
                                    if (addCardDetailsController.cardSelected ==
                                        null) {
                                      ShowToast.show(
                                          msg: 'Please Select Card!!',
                                          isError: true
                                          // msg: response['errorMessage'],
                                          );
                                    } else if (widget.callFrom ==
                                        'ConfirmBooking') {
                                      confirmBookingApiCall(context);
                                    } else if (widget.callFrom == 'OrderMore') {
                                      orderMoreBookingApiCall(context);
                                    }
                                  },
                                  child: Container(
                                      // width: 80,
                                      // height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: red4DE2211C),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 10),
                                        child: CommonText(
                                          text: "Continue",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: redE2211C,
                                        ),
                                      )),
                                )
                        ],
                      ),
                      // const SizedBox(
                      //   height: 12,
                      // ),
                      CardListView()
                    ],
                  ),
                ),
              );
      }),
    );
  }

  confirmBookingApiCall(context) {
    bookATableController.confirmBookIsLoading.value = true;
    ProgressConfirmDialog.showProgressDialog(context);
    bookATableController.confirmBookingApiCall(body: {
      "BookingId": 0,
      "Items":
          jsonDecode(jsonEncode(restaurantDetailsController.cartItemsList)),
      "SpecialEvent": data[0]["specialEventController"],
      "PaymentTypeId": 1,
      "Tip": data[0]["tipAmount"],
      "RestaurantId": data[0]["restaurantId"],
      "BookingDate": data[0]["bookingDate"],
      "PartySize": data[0]["partySize"],
      "ServiceType": data[0]["serviceType"],
      "BookingTime": data[0]["bookingTime"],
      "SpecialRequest": data[0]["allergiesController"],
      "SlotId": data[0]["slotId"],
      "CardId": addCardDetailsController.cardSelected!.cardId,
      "StatusId": data[0]["StatusId"],
    }).then((value) {
      bookATableController.confirmBookIsLoading.value = false;
      Navigator.pop(context);
      if (value) {
        addCardDetailsController.cardSelected = null;
        // Get.off('/payment-done');
        //   Get.offNamed('/payment-done');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => PaymentDoneView(
                paymentMode: "Credit Card",
                amountPayed: data[0]["totalAmount"],
              ),
            ),
            (Route<dynamic> route) => route.isFirst);
      }
    });
  }

  orderMoreBookingApiCall(context) {
    reservationController.orderMoreConfirmationIsLoading.value = true;
    ProgressDialog.showProgressDialog(context);
    reservationController.orderMoreConfirmationApiCall(body: {
      "BookingId": data[0]["bookingId"],
      "Items": jsonDecode(jsonEncode(reservationController.cartNewItemsList)),
      "ToGoItems": jsonDecode(jsonEncode(toGoReservationController.toGoCart)),
      "PaymentTypeId": 1,
      "TipAmount": reservationController
              .bookRestaurantDetails!.bookinglistresponse.tip!
              .endsWith('%')
          ? reservationController.tipAddedOrderMore
          : 0.0,
      "Amount": reservationController.subTotalPrice +
          reservationController.tipAddedOrderMore +
          toGoReservationController.toGoSubTotalPrice,
      "CardId": addCardDetailsController.cardSelected!.cardId,
    }).then((value) {
      reservationController.orderMoreConfirmationIsLoading.value = false;
      Navigator.pop(context);
      if (value) {
        reservationController.cartNewItemsList.clear();
        addCardDetailsController.cardSelected = null;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => PaymentDoneView(
                paymentMode: "Credit Card",
                amountPayed: reservationController.subTotalPrice +
                    reservationController.tipAddedOrderMore +
                    toGoReservationController.toGoSubTotalPrice,
              ),
            ),
            (Route<dynamic> route) => route.isFirst);
      }
    });
  }
}
