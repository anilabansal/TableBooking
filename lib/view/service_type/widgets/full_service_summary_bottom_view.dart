import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/view/service_type/widgets/payment_mode_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../controller/book_a_table/book_a_table_controller.dart';
import '../../../controller/restaurant_details/restaurant_details_controller.dart';
import '../../../utils/common/widgets_methods/common_text_form_field.dart';

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

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          /// special event widget
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

          /// allergies widget
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

          /// ADD A TIP  and payment  method
          Visibility(
            visible: controller.serviceSummary!.serviceType.toString() == '1'
                ? false
                : true,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// add a tip
                  Column(
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
                            0.0,
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
                        visible:
                            controller.addTip.value == 'Custom' ? true : false,
                        child: CommonTextFormField(
                          hintText: 'Enter Amount',
                          fillColor: whiteF5F5F5,
                          filled: true,
                          controller: tipController,
                          keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp('[0-9]'),
                            ),
                          ],
                          onChange: (value){
                            if(tipController.text.trim().isEmpty){
                              controller.tipAmountAddedToAddedInTotalPrice.value = 0.0;
                            }
                            else{
                              controller.tipAmountAddedToAddedInTotalPrice.value =
                                  double.tryParse(tipController.text.trim().toString())!;
                            }


                          },
                        ),
                      ),
                      CommonSizedBox(
                        height: 12,
                      ),
                      Visibility(
                        visible: controller.addTip.value == "10%" ||
                            controller.addTip.value == "15%" ||
                            controller.addTip.value == "20%",
                        child: CommonText(
                          // text:
                          //     "\$${((controller.tipAmount! * (restaurantsController.subTotalPrice! + controller.serviceSummary!.bookingConfirmationAmount)) / 100).toStringAsFixed(2)}",
                          text:
                              "+\$${controller.tipAmountAddedToAddedInTotalPrice!.value.toStringAsFixed(2)}",
                          color: redE2211C,
                          fontSize: 15,
                        ),
                      ),
                      Visibility(
                        // visible: controller.addTip.value == "10%" ||
                        //     controller.addTip.value == "15%" ||
                        //     controller.addTip.value == "20%" ||
                        //     tipController.text.trim().isNotEmpty,
                        visible:controller.addTip.value == ''?false:true ,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CommonText(
                                    text: "Grand Total",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: black0D0000,
                                  ),
                                  const Spacer(),
                                  CommonText(
                                    text:
                                        "\$ ${(restaurantsController.subTotalPrice! + controller.serviceSummary!.bookingConfirmationAmount + controller.tipAmountAddedToAddedInTotalPrice!.value).toStringAsFixed(2)}",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: black0D0000,
                                  ),
                                ],
                              ),
                              CommonText(
                                text: "(Total Amount + Tip)",
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: black0D0000,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),

                  Container(
                    width: Get.width,
                    height: 1,
                    color: whiteE5E5E5,
                  ).paddingOnly(
                    top: 5,
                    bottom: 5,
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  /// Payment Method
                  CommonText(
                    textAlign: TextAlign.left,
                    text: 'Select Payment Mode',
                    // text: 'Payment Mode',
                    color: black000000,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  CommonSizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      selectPaymentContainer(
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
                        'Pay At Restaurant',
                        onTap: () {
                          controller.selectPaymentMode.value =
                              "Pay At Restaurant";
                        },
                        isSelected: controller.selectPaymentMode.value ==
                            "Pay At Restaurant",
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: Get.width,
                    height: 1,
                    color: whiteE5E5E5,
                  ).paddingOnly(
                    top: 5,
                    bottom: 5,
                  ),
                ],
              ),
            ),
          ),

          /// confirm booking button
          PaymentMode(
            customTipController: tipController,
            specialEventController: specialEventController,
            allergiesController: allergiesController,
          ),
        ],
      ),
    );
  }

  /// payment mode container widget
  selectPaymentContainer(iconText, {onTap, isSelected}) {
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
          child: Center(
            child: CommonText(
              text: iconText,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: isSelected ? white : greyA2A2A2,
            ),
          ),
        ),
      ),
    );
  }

  /// add tip container
  addTipContainer(text, isSelected, fontSize, selectedValue, tipAmount,
      {finalAmount}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          //   controller.addTip.value = text;
          controller.addTip.value = selectedValue;
          controller.tipAmount = tipAmount;
          // controller.tipAmountAddedToAddedInTotalPrice = ((controller
          //             .tipAmount! *
          //         (restaurantsController.subTotalPrice! +
          //             controller.serviceSummary!.bookingConfirmationAmount)) /
          //     100);
          // if (selectedValue == "Custom" &&
          //     tipController.text.trim().isNotEmpty) {
          //   controller.tipAmountAddedToAddedInTotalPrice.value =
          //       double.tryParse(tipController.text.toString())!;
          // } else
            if (selectedValue == "None") {
            controller.tipAmountAddedToAddedInTotalPrice.value = 0.00;
          } else if(controller.addTip.value == "10%" ||
                controller.addTip.value == "15%" ||
                controller.addTip.value == "20%") {
            controller.tipAmountAddedToAddedInTotalPrice.value = ((controller
                        .tipAmount! *
                    (restaurantsController.subTotalPrice! +
                        controller.serviceSummary!.bookingConfirmationAmount)) /
                100);
          }

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
