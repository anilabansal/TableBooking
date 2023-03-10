import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/reservation & rating/reservation_controller.dart';
import '../../../controller/reservation & rating/to_go_reservation_controller.dart';
import '../../../utils/common/common_strings.dart';
import '../../../utils/common/widgets_methods/alert_dialog.dart';
import '../../../utils/common/widgets_methods/common_button.dart';
import '../../../utils/common/widgets_methods/progress_loader.dart';
import '../reservation_view.dart';

class OrderMorePaymentMode extends StatelessWidget {
  final int? bookingId;

  OrderMorePaymentMode({Key? key, this.bookingId}) : super(key: key);
  ReservationController reservationController = Get.find();
  ToGoReservationController toGoReservationController = Get.find();

  // CreditCardController creditCardController = Get.put(CreditCardController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonButton(
          onTap: () {
            if (reservationController
                    .bookRestaurantDetails!.bookinglistresponse.paymentType ==
                'Pay at Restaurant') {
              reservationController.orderMoreConfirmationIsLoading.value = true;
              ProgressDialog.showProgressDialog(context);
              reservationController.orderMoreConfirmationApiCall(body: {
                "BookingId": bookingId,
                "Items": jsonDecode(
                    jsonEncode(reservationController.cartNewItemsList)),
                "ToGoItems":
                    jsonDecode(jsonEncode(toGoReservationController.toGoCart)),
                "PaymentTypeId": 4,
                "TipAmount": reservationController
                        .bookRestaurantDetails!.bookinglistresponse.tip!
                        .endsWith('%')
                    ? reservationController.tipAddedOrderMore
                    : 0.0,
                "Amount": reservationController.subTotalPrice +
                    reservationController.tipAddedOrderMore +
                    toGoReservationController.toGoSubTotalPrice,
                "CardId": 0,
              }).then((value) {
                reservationController.orderMoreConfirmationIsLoading.value =
                    false;
                Navigator.pop(context);
                if (value) {
                  Navigator.pop(context);
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (BuildContext context) =>
                  //       const ReservationView(),
                  //     ),
                  //         (Route<dynamic> route) => route.isFirst);

                }
              });
            } else {
              /// alert dialog
              commonAlertDialog(
                context,
                // restaurantsController.subTotalPrice! +
                //     controller.serviceSummary!.bookingConfirmationAmount +
                //     double.parse(tipPercentageCalculatedToAdded),
                reservationController.subTotalPrice +
                    reservationController.tipAddedOrderMore +
                    toGoReservationController.toGoSubTotalPrice!,
                () {
                  ///on tap of ok button in alert dialog to make payment
                  Navigator.pop(context);
                  Get.toNamed(
                    '/confirm-booking-payment-method',
                    arguments: [
                      {
                        "bookingId": bookingId,
                        // "totalAmount":reservationController.subTotalPrice+reservationController.tipAddedOrderMore + toGoReservationController.toGoSubTotalPrice,
                      }
                    ],
                  );
                },
              );
            }
          },
          textColor: Colors.white,
          bgColor: redE2211C,
          text: reservationController
                      .bookRestaurantDetails!.bookinglistresponse.paymentType ==
                  'Pay at Restaurant'
              ? 'Complete Order'
              : 'Complete & Pay',
        ),
      ],
    );
  }
}
