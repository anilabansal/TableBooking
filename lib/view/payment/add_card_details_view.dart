import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/utils/extensions/capitalization_strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controller/card_details/add_card_details_controller.dart';
import '../../controller/user_session/user_session_controller.dart';
import '../../utils/common/common_strings.dart';
import '../../utils/common/toast_message.dart';
import '../../utils/common/widgets_methods/common_button.dart';
import '../../utils/common/widgets_methods/common_sized_box.dart';
import '../../utils/common/widgets_methods/common_text.dart';
import '../../utils/common/widgets_methods/common_text_form_field.dart';
import '../../utils/common/widgets_methods/date_format_widget.dart';
import '../../utils/common/widgets_methods/progress_loader.dart';

class AddCreditCardDetailsView extends StatelessWidget {
  String? callFrom;
  AddCreditCardDetailsView({this.callFrom, Key? key}) : super(key: key);
  var cardExpiryDate = TextEditingController();
  var bankName = TextEditingController();
  var cardHolderName = TextEditingController();
  var cardNumber = TextEditingController();
  var cardCVV = TextEditingController();
  // var data = Get.arguments;
  AddCardDetailsController controller = Get.find();
  UserSessionController userSessionController = Get.find();
  AddCardDetailsController addCardDetailsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommon(
        text: 'Credit Card',
      ),
      // body: AddCardDetailsBody(
      //   callFrom: callFrom ?? "",
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 53),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CommonText(
                text: 'Bank Name',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              CommonSizedBox(
                height: 6,
              ),
              CommonTextFormField(
                controller: bankName,
                hintText: 'Enter Bank Name',
                filled: true,
                fillColor: whiteF4F4F4,
                keyboardType: TextInputType.text,
              ),
              CommonSizedBox(
                height: 20,
              ),
              CommonText(
                text: 'Card Holder Name',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              CommonSizedBox(
                height: 6,
              ),
              CommonTextFormField(
                controller: cardHolderName,
                hintText: 'Enter Card Holder Name',
                filled: true,
                fillColor: whiteF4F4F4,
                keyboardType: TextInputType.text,
              ),
              CommonSizedBox(
                height: 20,
              ),

              CommonText(
                text: 'Credit Card Number',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              CommonSizedBox(
                height: 6,
              ),
              CommonTextFormField(
                controller: cardNumber,
                hintText: 'Enter Card Number',
                // validator: (value) {
                //   return value!.length < 17 ? 'Invalid Card Number' : null;
                // },
                maxLength: 16,
                filled: true,
                fillColor: whiteF4F4F4,
                keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
              ),
              CommonSizedBox(
                height: 20,
              ),
              //   ROW THREE
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CommonText(
                          text: 'Exp. Date',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        CommonSizedBox(
                          height: 6,
                        ),
                        CommonTextFormField(
                          // enable: false,
                          hintText: 'MM/YY',
                          keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                          inputFormatters: [CardExpirationFormatter()],
                          controller: cardExpiryDate,
                          // suffixIcon: const Icon(Icons.arrow_drop_down),
                          filled: true,
                          maxLength: 5,

                          fillColor: whiteF4F4F4,
                        ),
                        CommonSizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  CommonSizedBox(
                    width: 32,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CommonText(
                          text: 'Cvv',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        CommonSizedBox(
                          height: 6,
                        ),
                        CommonTextFormField(
                          controller: cardCVV,
                          maxLength: 3,
                          hintText: '***',
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          maxLines: 1,
                          filled: true,
                          fillColor: whiteF4F4F4,
                        ),
                        CommonSizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //  PRIVACY POLICY TERMS N CONDITIONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    return Checkbox(
                      value: controller.isChecked.value,
                      onChanged: (value) {
                        controller.updateCheckbox();
                      },
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.white;
                            }
                            return Colors.red;
                          }),
                    );
                  }),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                              text: 'I agree with all ',
                              style:
                              TextStyle(color: textDark3F3E3E, fontSize: 14)),
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: const TextStyle(
                              color: black040404,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // TODO : TERMS & CONDITIONS
                                Get.toNamed('/terms-and-conditions');
                              },
                          ),
                          const TextSpan(
                              text: ' and ',
                              style: TextStyle(
                                color: textDark3F3E3E,
                                fontSize: 14,
                              )),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: const TextStyle(
                              color: black040404,
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // TODO : PRIVACY POLICY
                                Get.toNamed('/privacy-policy');
                              },
                          ),
                          const TextSpan(
                            text: '.',
                            style: TextStyle(
                              color: textDark3F3E3E,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CommonSizedBox(height: 35),
              //   Button
              InkWell(
                onTap: () async {
                  var controllerDateParse = DateFormat('MM/yy')
                      .parse(cardExpiryDate.text.trim());
                  var finalControllerDateParse =
                      DateFormat('MM/yyyy').format(controllerDateParse);
                  if (validateFields() != '') {
                    ShowToast.show(
                      msg: validateFields(),
                      isError: true,
                    );
                    return;
                  }
                  ProgressDialog.showProgressDialog(context);
                  controller.isLoading.value = true;
                  await controller.savedCardData(

                    body: {
                      "userId": userSessionController.userId,
                      "CardHolderName": cardHolderName.text.trim(),
                      "CardNumber": cardNumber.text.trim(),
                      "CVVNumber": cardCVV.text.trim(),
                      "ExpiryDate":finalControllerDateParse,
                      "BankName": bankName.text.trim(),
                    },
                  ).then(
                        (value) {
                      Navigator.pop(context);
                      controller.isLoading.value = false;
                      if (value) {
                        Navigator.pop(context);
                        addCardDetailsController
                            .isUserCardListIsLoading
                            .value = true;
                        addCardDetailsController
                            .savedCardListDataApi()
                            .then((value) {
                          if (value) {
                            addCardDetailsController
                                .isUserCardListIsLoading
                                .value = false;
                          }
                        });
                      }

                      //   return false;
                      // Get.toNamed('/book-a-table');
                    },
                  );

                },
                child: CommonButton(
                  text: 'Save Card',
                  bgColor: redE2211C,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  validateFields() {
    if (bankName.text.trim().isEmpty) {
      return 'Please enter a valid bank name!'.toTitleCase();
    } else if (cardHolderName.text.trim().isEmpty) {
      return 'Please enter a valid name!'.toTitleCase();
    } else if (cardNumber.text.trim().length < 16) {
      return 'Please enter a valid card number!'.toTitleCase();
    } else if (cardExpiryDate.text.trim().isEmpty) {
      return 'Please enter a valid card expiry date!'.toTitleCase();
    } else if (cardCVV.text.trim().isEmpty) {
      return 'please enter a valid CVV!'.toTitleCase();
    } else if (controller.isChecked == false) {
      return 'Please Accept The Terms & Conditions'.toTitleCase();
    }
    return '';
  }
}