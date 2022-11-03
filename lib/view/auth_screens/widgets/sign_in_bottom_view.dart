// ignore_for_file: must_be_immutable

import 'package:booking_table/controller/authentication/authentication.dart';
import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/images_string.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/view/auth_screens/otp_screen.dart';
import 'package:country_phone_code_picker/country_phone_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class SignInScreenBottomView extends StatelessWidget {
  final AuthenticationController controller;

  String? callFrom;
  SignInScreenBottomView({
    required this.controller,
    required this.callFrom,
    Key? key,
  }) : super(key: key);

  // AuthViewController controller = Get.put(AuthViewController());
  // Country? selectedCountry;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // HEADER
        CommonText(
          text: callFrom == 'Login'
              ? 'Enter Mobile Number'
              : 'Create Your Free Account',
          fontSize: 24,
          color: black040404,
          fontWeight: FontWeight.w700,
        ),
        CommonSizedBox(height: 15),
        _textFieldRow(),
        CommonSizedBox(height: 15),
        CommonText(
          text: 'A 4 digit code will be sent to this number.',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: textLight868686,
        ),

        callFrom == 'Login'
            ? CommonSizedBox(height: 40)
            : _privacyPolicyNTerms(),
        // Button
        // LOGIN/REGISTER BUTTON

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CommonButton(
            onTap: () {
              if (validateFields() != '') {
                ShowToast.show(msg: validateFields());
                return;
              }
              controller.loginUser(data: {
                "MobileNumber": controller.mobileNumber.text.trim(),
                "Email": "",
                "AuthenticationId": "",
                "AuthenticationType": "",
                "DeviceToken": "sdgsgsgsg",
                "DeviceType": GetPlatform.isAndroid ? "Android" : "iOS",
              }).then((value) {
                Get.back();
                if (value) {
                  Get.off(
                    () => OtpScreenView(
                      callFrom: callFrom,
                    ),
                  );
                }
              });
            },
            text: callFrom == 'Login' ? 'Sign In' : 'Sign Up',
            bgColor: redE2211C,
            textColor: Colors.white,
          ),
        ),
        CommonSizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              dividerImage,
              width: 91,
            ),
            const SizedBox(
              width: 10,
            ),
            CommonText(text: 'OR', color: textLight868686, fontSize: 14),
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              dividerImage,
              width: 91,
            ),
          ],
        ),
        CommonSizedBox(height: 20),
        // GUEST BUTTON
        InkWell(
          onTap: () {
            Get.toNamed('/home');
          },
          child: CommonText(
            text: 'Continue as Guest',
            color: redE2211C,
            fontSize: 16,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  // MOBILE NUMBER ENTER ROW
  Container _textFieldRow() {
    return Container(
      decoration: BoxDecoration(
          color: otpFieldFDF4F3, borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.only(
        left: 27,
        right: 13,
      ),
      child: Row(
        children: <Widget>[
          //Code Picker
          _codePicker(),
          // Divider
          Container(
            margin: const EdgeInsets.only(
              right: 15,
            ),
            width: 1,
            color: textLight868686,
            height: 34,
          ),
          // TextField
          Expanded(
              child: TextFormField(
            controller: controller.mobileNumber,
            autovalidateMode: AutovalidateMode.always,
            keyboardType: TextInputType.number,
            cursorWidth: 0,
            style: const TextStyle(fontSize: 20, color: black000000),
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          )),
        ],
      ),
    );
  }

  // COUNTRY CODE PICKER
  CommonSizedBox _codePicker() {
    return CommonSizedBox(
        width: 79,
        child: CountryPhoneCodePicker.withDefaultSelectedCountry(
          defaultCountryCode:
              Country(name: 'USA', countryCode: 'USA', phoneCode: '+1'),
          borderRadius: 50,
          borderWidth: 0,
          flagBorderRadius: 100,
          flagHeight: 30,
          flagWidth: 30,
          borderColor: Colors.transparent,
          style: const TextStyle(fontSize: 16),
          searchBarHintText: 'Search by name',
        ));
  }

  // PRIVACY POLICY & TERMS N CONDITIONS
  Column _privacyPolicyNTerms() {
    return Column(
      children: <Widget>[
        CommonSizedBox(height: 58),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: true,
              onChanged: null,
              fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.red;
                }
                return Colors.white;
              }),
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                        text: 'I agree with all ',
                        style: TextStyle(color: textDark3F3E3E, fontSize: 14)),
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
        ).paddingSymmetric(horizontal: 20),
        CommonSizedBox(height: 15),
      ],
    );
  }

  // validateFields() {
  validateFields() {
    if (!GetUtils.isPhoneNumber(controller.mobileNumber.value.text.trim())) {
      return 'Please enter valid Phone Number!';
    } else if (controller.mobileNumber.value.text.trim().isEmpty) {
      return 'Field cannot be empty!';
    }
    return '';
  }
}
