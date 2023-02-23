import 'dart:convert';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/utils/common/widgets_methods/progress_loader.dart';
import 'package:booking_table/utils/extensions/capitalization_strings.dart';
import 'package:booking_table/view/service_type/widgets/payment_mode_body.dart';
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
  // CreditCardController creditCardController = Get.put(CreditCardController());
  RestaurantDetailsController restaurantsController = Get.find();
  var tipController = TextEditingController();
  var specialEventController = TextEditingController();
  var allergiesController = TextEditingController();

  // dynamic tipAmountToAdded;
  // dynamic totalAmountToPay;
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
                  hintText: 'Type Here...',
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
          Visibility(
            visible:controller.serviceSummary!.serviceType.toString() == '1'?false:true ,
            child: Column(
              children: [
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
                            "10%",
                            // ignore: unrelated_type_equality_checks
                            controller.addTip.value == "10%",
                            12.0,

                              "10%",
                             10.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // ignore: unrelated_type_equality_checks
                          addTipContainer(
                            "15%",
                            controller.addTip.value == "15%",
                            12.0,

                              "15%",
                            15.0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // ignore: unrelated_type_equality_checks
                          addTipContainer(
                            "20%",
                            controller.addTip.value == "20%",
                            12.0,

                              "20%",
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

                              "Custom",
                            0,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          addTipContainer(
                            "None",
                            controller.addTip.value == "None",
                            12.0,
                              "None",
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
                      CommonSizedBox(
                        height: 15,
                      ),
                      Visibility(
                        visible:controller.addTip.value == "10%"||controller.addTip.value == "15%"||controller.addTip.value == "20%" ,
                        child: CommonText(
                          text: "+\$${((controller.tipAmount*restaurantsController.subTotalPrice!)/100)}",
                          color: redE2211C,
                          fontSize: 15,

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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        textAlign: TextAlign.left,
                        // text: 'Select Payment Mode',
                        text: 'Payment Mode',
                        color: black000000,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      const Spacer(),
                      CommonText(
                        textAlign: TextAlign.left,
                        text: 'Credit Card',
                        color: greyA2A2A2,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),

                      // CommonSizedBox(
                      //   height: 20,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     selectPaymentContainer(
                      //       image: Visibility(
                      //         visible: false,
                      //         child: Image.asset(
                      //           venmoLogo,
                      //           height: 16,
                      //           width: 16,
                      //         ),
                      //       ),
                      //       'Credit Card',
                      //       onTap: () {
                      //         controller.selectPaymentMode.value = "Credit Card";
                      //       },
                      //       isSelected:
                      //           controller.selectPaymentMode.value == "Credit Card",
                      //     ),
                      //     const SizedBox(
                      //       width: 12,
                      //     ),
                      //     selectPaymentContainer(
                      //       image: Image.asset(
                      //         controller.selectPaymentMode.value == "Apple"
                      //             ? appleIcon
                      //             : appleBlackLogo,
                      //         height: 16,
                      //         width: 16,
                      //       ),
                      //       'Apple',
                      //       onTap: () {
                      //         controller.selectPaymentMode.value = "Apple";
                      //       },
                      //       isSelected: controller.selectPaymentMode.value == "Apple",
                      //     ),
                      //     const SizedBox(
                      //       width: 12,
                      //     ),
                      //     selectPaymentContainer(
                      //       image: Image.asset(
                      //         googleIcon,
                      //         height: 16,
                      //         width: 16,
                      //       ),
                      //       'Pay',
                      //       onTap: () {
                      //         controller.selectPaymentMode.value = "Pay";
                      //       },
                      //       isSelected: controller.selectPaymentMode.value == "Pay",
                      //     ),
                      //   ],
                      // ),
                      // CommonSizedBox(
                      //   height: 18,
                      // ),
                      // // selectPaymentContainer( "Pay At Restaurant")
                      // InkWell(
                      //   onTap: () {
                      //     controller.selectPaymentMode.value = "Pay At Restaurant";
                      //   },
                      //   child: Container(
                      //     height: 32,
                      //     width: 137,
                      //     alignment: Alignment.center,
                      //     decoration: BoxDecoration(
                      //       color: controller.selectPaymentMode.value ==
                      //               "Pay At Restaurant"
                      //           ? black0D0000
                      //           : greyF8F8F8,
                      //       borderRadius: BorderRadius.circular(4),
                      //     ),
                      //     child: CommonText(
                      //       textAlign: TextAlign.center,
                      //       text: 'Pay At Restaurant',
                      //       fontSize: 15,
                      //       fontWeight: FontWeight.w400,
                      //       color: controller.selectPaymentMode.value ==
                      //               "Pay At Restaurant"
                      //           ? white
                      //           : greyA2A2A2,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),



          PaymentMode(
            customTipController: tipController,
            specialEventController: specialEventController,
            allergiesController: allergiesController,
          )
        ],
      ),
    );
  }

  // /// payment mode container
  // selectPaymentContainer(iconText, {image, onTap, isSelected}) {
  //   return Expanded(
  //     child: InkWell(
  //       onTap: onTap,
  //       child: Container(
  //         height: 32,
  //         width: 82,
  //         decoration: BoxDecoration(
  //           color: isSelected ? black0D0000 : greyF8F8F8,
  //           borderRadius: BorderRadius.circular(4),
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.only(right: 0.0),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               // const Icon(
  //               //   Icons.apple,
  //               //   color: white,
  //               // ),
  //               image,
  //               CommonSizedBox(
  //                 width: 8,
  //               ),
  //               CommonText(
  //                 text: iconText,
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.w400,
  //                 color: isSelected ? white : greyA2A2A2,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  /// add tip container
  addTipContainer(text, isSelected, fontSize, selectedValue,tipAmount) {
    return Expanded(
      child: InkWell(
        onTap: () {
       //   controller.addTip.value = text;
      controller.addTip.value = selectedValue;
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


}
