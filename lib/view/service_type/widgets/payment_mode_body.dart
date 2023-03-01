import 'dart:convert';
import 'package:booking_table/utils/extensions/capitalization_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/book_a_table/book_a_table_controller.dart';
import '../../../controller/payment/credit_card_controller.dart';
import '../../../controller/restaurant_details/restaurant_details_controller.dart';
import '../../../utils/common/common_strings.dart';
import '../../../utils/common/toast_message.dart';
import '../../../utils/common/widgets_methods/alert_dialog.dart';
import '../../../utils/common/widgets_methods/common_button.dart';
import '../../../utils/common/widgets_methods/progress_loader.dart';
import '../../reservation/reservation_view.dart';

class PaymentMode extends StatelessWidget {
  final TextEditingController? customTipController;
  final TextEditingController? specialEventController;
  final TextEditingController? allergiesController;
  PaymentMode({Key? key,this.customTipController,this.specialEventController,this.allergiesController}) : super(key: key);
  BookATableController controller = Get.find();
  //CreditCardController creditCardController = Get.put(CreditCardController());
  RestaurantDetailsController restaurantsController = Get.find();
  dynamic tipAmountToAdded;
  dynamic totalAmountToPay;
  dynamic grandTotal;
  dynamic tipPercentageCalculatedToAdded;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 30, 15, 15),
      child: CommonButton(
        onTap: () {
          if (confirmBookingValidation() != '') {
            ShowToast.show(
              msg: confirmBookingValidation(),
              isError: true,
            );
            return false;
          }
           ///grandTotal (items added total Amount ) Amount
          grandTotal = restaurantsController.subTotalPrice!;
          /// total tipAmountToAdded

          tipAmountToAdded = controller.addTip.value == 'Custom'
              ? customTipController!.text.isEmpty || customTipController!.text == null
              ? 0.0
              : customTipController!.text.toString():controller.addTip.value == 'None'||controller.serviceSummary!.serviceType.toString() == '1' ?0.0
              : controller.addTip.value.toString();


          /// total amount after percentage calculation of tip
          tipPercentageCalculatedToAdded = controller.addTip.value == 'Custom'
              ? customTipController!.text.isEmpty || customTipController!.text == null
              ? 0.0
              : double.tryParse(customTipController!.text.toString()):controller.serviceSummary!.serviceType.toString() == '1' ?0.0: ((controller.tipAmount*grandTotal)/100);

          /// totalAmountToPay
          totalAmountToPay = restaurantsController.subTotalPrice! +
              // controller.serviceSummary!.bookingConfirmationAmount +
              tipPercentageCalculatedToAdded;

          /// payment mode is only credit card
          /// in case if service type is full straight confirm booking api will be hit
          if(controller.serviceSummary!.serviceType.toString() =='1'){
            controller.confirmBookIsLoading.value = true;
            ProgressDialog.showProgressDialog(context);
            controller.confirmBookingApiCall(body:
            {
              "BookingId": 0,
              "Items":jsonDecode(jsonEncode(restaurantsController.cartItemsList)),
              "SpecialEvent": specialEventController!.text.trim().isEmpty
                  ? ""
                  : specialEventController!.text.trim(),
              "PaymentTypeId": "4",
              "Tip": tipAmountToAdded,
              "RestaurantId": controller.serviceSummary!.restaurantId,
              "BookingDate": controller.serviceSummary!.bookingDate.toString(),
              "PartySize": controller.serviceSummary!.partySize,
              "ServiceType": controller.serviceSummary!.serviceType,
              "BookingTime": controller.serviceSummary!.bookingTime.toString(),
              "SpecialRequest": allergiesController!.text.trim().isEmpty
                  ? ""
                  : allergiesController!.text.trim(),
              "SlotId": controller.serviceSummary!.slotId,
              "StatusId":controller.serviceSummary!.statusId,
              "CardId":0,
            }
            ).then((value) {
              controller.confirmBookIsLoading.value = false;
              Navigator.pop(context);
              if (value) {
                ShowToast.show(
                  msg: 'Table Book Successfully!',
                );
                // Get.offNamed('/reservation');
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                      const ReservationView(),
                    ),
                        (Route<dynamic> route) => route.isFirst);
              }
            });
          }
          else{
            /// alert dialog
            commonAlertDialog(
              context,
              totalAmountToPay,
                  () {
                ///on tap of ok button in alert dialog to make payment

                Navigator.pop(context);
                Get.toNamed('/booking-payment-method',
                  arguments: [
                    {
                      "specialEventController": specialEventController!.text.trim().isEmpty? "" : specialEventController!.text.trim(),
                      "allergiesController":allergiesController!.text.trim().isEmpty?"":allergiesController!.text.trim(),
                      "customTipController":customTipController,
                      "tipAmount":tipAmountToAdded,
                      "restaurantId": controller.serviceSummary!.restaurantId,
                      "bookingDate": controller.serviceSummary!.bookingDate,
                      "partySize": controller.serviceSummary!.partySize,
                      "bookingTime": controller.serviceSummary!.bookingTime,
                      "slotId": controller.serviceSummary!.slotId,
                      "totalAmount":totalAmountToPay,
                      "serviceType": controller.serviceSummary!.serviceType,
                      "StatusId":controller.serviceSummary!.statusId,
                    }
                  ],
                );

              },
            );
          }

        },
        text: 'Confirm Booking',
        textColor: Colors.white,
        bgColor: redE2211C,
      ),
    );
  }
  /// validation
  confirmBookingValidation() {
    if (controller.serviceSummary!.serviceType.toString() != '1' &&
        restaurantsController.cartItemsList.isEmpty) {
      return 'please place order!'.toTitleCase();
    }
    else if (specialEventController!.text.isNotEmpty && specialEventController!.text.trim().isEmpty) {
      return 'please enter valid special event!'.toTitleCase();
    }
    else if (allergiesController!.text.isNotEmpty && allergiesController!.text.trim().isEmpty) {
      return 'please enter valid special request!'.toTitleCase();
    }
    else if (controller.serviceSummary!.serviceType.toString() != '1' && controller.addTip.value == '') {
      return 'please select tip to be added'.toTitleCase();
    } else if (controller.addTip.value == "Custom" &&
        customTipController!.text.trim().isEmpty) {
      return 'please add tip amount'.toTitleCase();
    }
    // else if (controller.selectPaymentMode.value == '') {
    //   return 'please select payment mode'.toTitleCase();
    // }
    return '';
  }
}
