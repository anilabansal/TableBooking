import 'dart:convert';

import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/utils/common/widgets_methods/progress_loader.dart';
import 'package:booking_table/utils/extensions/capitalization_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/book_a_table/book_a_table_controller.dart';
import '../../../controller/payment/credit_card_controller.dart';
import '../../../controller/restaurant_details/restaurant_details_controller.dart';
import '../../../utils/common/toast_message.dart';
import '../../../utils/common/widgets_methods/alert_dialog.dart';
import '../../../utils/common/widgets_methods/common_text_form_field.dart';
import '../../reservation/reservation_view.dart';

class FullSummaryBottomView extends StatelessWidget {
  FullSummaryBottomView({
    Key? key,
  }) : super(key: key);
  BookATableController controller = Get.find();
  CreditCardController creditCardController = Get.put(CreditCardController());
  RestaurantDetailsController restaurantsController = Get.find();
  var tipController = TextEditingController();
  var specialEventController = TextEditingController();
  var allergiesController = TextEditingController();
  dynamic tipAmountToAdded;
  dynamic totalAmountToPay;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  textAlign: TextAlign.left,
                  text: 'Special Event',
                  color: black000000,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                CommonSizedBox(
                  height: 20,
                ),
                CommonTextFormField(
                  fillColor: whiteF5F5F5,
                  filled: true,
                  hintText: 'Anniversary',
                  controller: specialEventController,
                ),
              ],
            ),
          ),
          Container(
            width: Get.width,
            height: 1,
            color: whiteE5E5E5,
          ).paddingOnly(
            top: 5,
            bottom: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  textAlign: TextAlign.left,
                  text: 'Allergies/Special Requests',
                  color: black000000,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                CommonSizedBox(
                  height: 20,
                ),
                CommonTextFormField(
                  fillColor: whiteF5F5F5,
                  filled: true,
                  hintText: 'Type Here...',
                  maxLines: 5,
                  controller: allergiesController,
                  // fontSize: 16,
                ),
              ],
            ),
          ),
          Container(
            width: Get.width,
            height: 1,
            color: whiteE5E5E5,
          ).paddingOnly(
            top: 5,
            bottom: 5,
          ),

          /// ADD A TIP
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  textAlign: TextAlign.left,
                  text: 'Add Tip',
                  color: black000000,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                CommonSizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    addTipContainer(
                      "\$10",
                      // ignore: unrelated_type_equality_checks
                      controller.addTip.value == "\$10",
                      12.0,
                      10.0,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // ignore: unrelated_type_equality_checks
                    addTipContainer(
                      "\$15",
                      controller.addTip.value == "\$15",
                      12.0,
                      15.0,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // ignore: unrelated_type_equality_checks
                    addTipContainer(
                      "\$20",
                      controller.addTip.value == "\$20",
                      12.0,
                      20.0,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // ignore: unrelated_type_equality_checks
                    addTipContainer(
                      "Custom",
                      controller.addTip.value == "Custom",
                      10.0,
                      0,
                      // double.tryParse(tipController.text.toString()),
                      // double.tryParse(tipController.text.toString().trim()),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    addTipContainer(
                      "None",
                      controller.addTip.value == "None",
                      12.0,
                      0.0,
                    ),
                  ],
                ),
                CommonSizedBox(
                  height: 15,
                ),
                Visibility(
                  visible: controller.addTip.value == 'Custom' ? true : false,
                  child: CommonTextFormField(
                    hintText: 'Enter Amount',
                    fillColor: whiteF5F5F5,
                    filled: true,
                    controller: tipController,
                  ),
                ),
                // CommonSizedBox(
                //   height: 41,
                // ),
              ],
            ),
          ),
          Container(
            width: Get.width,
            height: 1,
            color: whiteE5E5E5,
          ).paddingOnly(
            top: 5,
            bottom: 5,
          ),

          /// Payment Method
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  textAlign: TextAlign.left,
                  text: 'Select Payment Mode',
                  color: black000000,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                CommonSizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    selectPaymentContainer(
                      image: Visibility(
                        visible: false,
                        child: Image.asset(
                          venmoLogo,
                          height: 16,
                          width: 16,
                        ),
                      ),
                      'Credit Card',
                      onTap: () {
                        controller.selectPaymentMode.value = "Credit Card";
                      },
                      isSelected:
                          controller.selectPaymentMode.value == "Credit Card",
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    selectPaymentContainer(
                      image: Image.asset(
                        controller.selectPaymentMode.value == "Apple"
                            ? appleIcon
                            : appleBlackLogo,
                        height: 16,
                        width: 16,
                      ),
                      'Apple',
                      onTap: () {
                        controller.selectPaymentMode.value = "Apple";
                      },
                      isSelected: controller.selectPaymentMode.value == "Apple",
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    selectPaymentContainer(
                        image: Image.asset(
                          googleIcon,
                          height: 16,
                          width: 16,
                        ),
                        'Pay', onTap: () {
                      controller.selectPaymentMode.value = "Pay";
                    }, isSelected: controller.selectPaymentMode.value == "Pay"),
                  ],
                ),
                CommonSizedBox(
                  height: 18,
                ),
                // selectPaymentContainer( "Pay At Restaurant")
                InkWell(
                  onTap: () {
                    controller.selectPaymentMode.value = "Pay At Restaurant";
                  },
                  child: Container(
                    height: 32,
                    width: 137,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: controller.selectPaymentMode.value ==
                              "Pay At Restaurant"
                          ? black0D0000
                          : greyF8F8F8,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: CommonText(
                      textAlign: TextAlign.center,
                      text: 'Pay At Restaurant',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: controller.selectPaymentMode.value ==
                              "Pay At Restaurant"
                          ? white
                          : greyA2A2A2,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
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

                /// total tipAmountToAdded
                tipAmountToAdded = controller.addTip.value == 'Custom'
                    ? tipController.text.isEmpty || tipController.text == null
                        ? 0.0
                        : double.tryParse(tipController.text.toString())
                    : controller.tipAmount;

                /// totalAmountToPay
                totalAmountToPay = restaurantsController.subTotalPrice! +
                    controller.serviceSummary!.bookingConfirmationAmount +
                    controller.tipAmount;

                /// if payment mode is pay at restaurant , then directly api call on confirm button else show dialog and then hit api
                if (controller.selectPaymentMode.value == "Pay At Restaurant") {
                  controller.confirmBookIsLoading.value = true;
                  ProgressDialog.showProgressDialog(context);
                  controller.confirmBookingApiCall(body: {
                    "BookingId": 0,
                    "Items": jsonEncode(restaurantsController.cartItemsList),
                    "SpecialEvent": specialEventController.text.trim().isEmpty
                        ? ""
                        : specialEventController.text.trim(),
                    "PaymentTypeId": 4,
                    "Tip": tipAmountToAdded,
                    "RestaurantId": controller.serviceSummary!.restaurantId,
                    "BookingDate": controller.serviceSummary!.bookingDate,
                    "PartySize": controller.serviceSummary!.partySize,
                    "ServiceType": controller.serviceSummary!.serviceType,
                    "BookingTime": controller.serviceSummary!.bookingTime,
                    "SpecialRequest": allergiesController.text.trim().isEmpty
                        ? ""
                        : allergiesController.text.trim(),
                    "SlotId": controller.serviceSummary!.slotId,
                  }).then((value) {
                    controller.confirmBookIsLoading.value = false;
                    Navigator.pop(context);
                    if (value) {
                      // Get.off('/payment-done');
                      //   Get.offNamed('/payment-done');
                      // Get.offAllNamed('/payment-done',);
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
                } else {
                  /// alert dialog
                  commonAlertDialog(
                    context,
                    restaurantsController.subTotalPrice! +
                        controller.serviceSummary!.bookingConfirmationAmount +
                        tipAmountToAdded,
                    () {
                      ///on tap of ok button in alert dialog to make payment
                      if (controller.selectPaymentMode.value == "Credit Card") {
                        Navigator.pop(context);
                        ProgressDialog.showProgressDialog(context);

                        // Navigator.pop(context);
                        // controller.selectPaymentMode.value == "Credit Card"
                        //     ?
                        creditCardController.makePayment(
                          context,
                          amount: '${totalAmountToPay.toInt()}',
                          currency: 'USD',
                          tipAmount: tipAmountToAdded,
                          restaurantId: controller.serviceSummary!.restaurantId,
                          bookingDate: controller.serviceSummary!.bookingDate,
                          partySize: controller.serviceSummary!.partySize,
                          serviceType: controller.serviceSummary!.serviceType,
                          bookingTime: controller.serviceSummary!.bookingTime,
                          specialEvent:
                              specialEventController.text.trim().isEmpty
                                  ? ""
                                  : specialEventController.text.trim(),
                          specialRequest:
                              allergiesController.text.trim().isEmpty
                                  ? ""
                                  : allergiesController.text.trim(),
                          slotId: controller.serviceSummary!.slotId,
                        );
                        // : null;
                      } else {
                        Navigator.pop(context);
                        // return;
                      }
                    },
                  );
                }
              },
              text: 'Confirm Booking',
              textColor: Colors.white,
              bgColor: redE2211C,
            ),
          ),
          // CommonSizedBox(
          //   height: 30,
          // ),
        ],
      ),
    );
  }

  /// payment mode container
  selectPaymentContainer(iconText, {image, onTap, isSelected}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 32,
          width: 82,
          decoration: BoxDecoration(
            color: isSelected ? black0D0000 : greyF8F8F8,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Icon(
                //   Icons.apple,
                //   color: white,
                // ),
                image,
                CommonSizedBox(
                  width: 8,
                ),
                CommonText(
                  text: iconText,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: isSelected ? white : greyA2A2A2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// add tip container
  addTipContainer(text, isSelected, fontSize, tipAmount) {
    return Expanded(
      child: InkWell(
        onTap: () {
          controller.addTip.value = text;
          controller.tipAmount = tipAmount;
          // isSelected = !isSelected;
        },
        child: Container(
          width: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: isSelected ? black0D0000 : greyF8F8F8,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: CommonText(
                text: text,
                fontWeight: FontWeight.w400,
                fontSize: fontSize,
                color: isSelected ? white : greyA2A2A2,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// validation
  confirmBookingValidation() {
    if (controller.serviceSummary!.serviceType.toString() != '1' &&
        restaurantsController.cartItemsList.isEmpty) {
      return 'please place order!'.toTitleCase();
    } else if (controller.addTip.value == '') {
      return 'please select tip to be added'.toTitleCase();
    } else if (controller.addTip.value == "Custom" &&
        tipController.text.trim().isEmpty) {
      return 'please add tip amount'.toTitleCase();
    } else if (controller.selectPaymentMode.value == '') {
      return 'please select payment mode'.toTitleCase();
    }
    return '';
  }
}
