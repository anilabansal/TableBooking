import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/payment/credit_card_controller.dart';
import '../../../controller/reservation & rating/reservation_controller.dart';
import '../../../controller/reservation & rating/to_go_reservation_controller.dart';
import '../../../utils/common/common_strings.dart';
import '../../../utils/common/widgets_methods/alert_dialog.dart';
import '../../../utils/common/widgets_methods/common_button.dart';
import '../../../utils/common/widgets_methods/progress_loader.dart';

class OrderMorePaymentMode extends StatelessWidget {
  final int? bookingId;
   OrderMorePaymentMode({Key? key,this.bookingId}) : super(key: key);
   ReservationController reservationController = Get.find();
  ToGoReservationController toGoReservationController = Get.find();
  CreditCardController creditCardController = Get.put(CreditCardController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonButton(
          onTap: () {
            // if(validation()!=''){
            //   ShowToast.show(
            //     msg: validation(),
            //     isError: true,
            //   );
            //   return false;
            // }
            // else{


                /// alert dialog
                commonAlertDialog(
                  context,
                  // restaurantsController.subTotalPrice! +
                  //     controller.serviceSummary!.bookingConfirmationAmount +
                  //     double.parse(tipPercentageCalculatedToAdded),
                             reservationController.subTotalPrice +reservationController.tipAddedOrderMore + toGoReservationController.toGoSubTotalPrice! ,
                      () {
                    ///on tap of ok button in alert dialog to make payment
                       Navigator.pop(context);
                       Get.toNamed('/confirm-booking-payment-method',
                         arguments: [
                           {
                            "bookingId":bookingId,
                            // "totalAmount":reservationController.subTotalPrice+reservationController.tipAddedOrderMore + toGoReservationController.toGoSubTotalPrice,

                           }
                         ], );
                    // if (reservationController.bookRestaurantDetails!.bookinglistresponse.paymentType == "Credit Card") {
                    //   Navigator.pop(context);
                    //   ProgressDialog.showProgressDialog(context);
                    //
                    //   // Navigator.pop(context);
                    //   // controller.selectPaymentMode.value == "Credit Card"
                    //   //     ?
                    //   creditCardController.makePayment(
                    //     context,
                    //     amount: '${(reservationController.subTotalPrice! + toGoReservationController.toGoSubTotalPrice).toInt() }',
                    //     currency: 'USD',
                    //     callFrom: 'order More',
                    //     bookingId: bookingId
                    //   );
                    //   // : null;
                    // } else {
                    //   Navigator.pop(context);
                    //   // return;
                    // }
                  },
                );

            // }
          },
          textColor: Colors.white,
          bgColor: redE2211C,
          text: reservationController.bookRestaurantDetails!.bookinglistresponse.paymentType == 'Pay at Restaurant'?'Complete Order':'Complete & Pay',
        ),
      ],
    );
  }

  // validation(){
  //   if(reservationController.selectPaymentMode.value==''){
  //     return 'please select payment mode'.toTitleCase();
  //   }
  //   else{
  //     return '';
  //   }
  // }
}
