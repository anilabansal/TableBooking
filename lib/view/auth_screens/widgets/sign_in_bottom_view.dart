// ignore_for_file: must_be_immutable

import 'package:booking_table/controller/authentication/login_controller.dart';
import 'package:booking_table/controller/authentication/register_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/utils/extensions/capitalization_strings.dart';
import 'package:booking_table/view/auth_screens/widgets/privacy_policy.dart';
import 'package:country_phone_code_picker/country_phone_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreenBottomView extends StatelessWidget {
  LoginController loginController = Get.find();
  CountryController countryController = Get.find();
  RegisterController registerController = Get.find();

  String? callFrom;
  SignInScreenBottomView({
    required this.loginController,
    required this.registerController,
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
            : privacyPolicyNTerms(),
        // Button
        // LOGIN/REGISTER BUTTON

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CommonButton(
            onTap: () async {
              if (validateFields() != '') {
                ShowToast.show(msg: validateFields());
                return;
              }
              const Center(child: CircularProgressIndicator());
              callFrom == 'Login'
                  ? await loginController.loginUser(data: {
                      "MobileNumber":
                          '${countryController.selectedCountryPhoneCode}${loginController.mobileNumber.text.trim()}',
                      // "MobileNumber": '+917066000016',

                      "Email": "",
                      "AuthenticationId": "",
                      "AuthenticationType": "",
                      "DeviceToken": "sdgsgsgsg",
                      "DeviceType": GetPlatform.isAndroid ? "Android" : "iOS",
                    }).then((value) {
                      // Get.back();
                      if (value) {
                        Get.toNamed('/login/otp', arguments: [
                          {
                            'mobileNumber':
                                '${countryController.selectedCountryPhoneCode}${loginController.mobileNumber.text.trim()}',
                          },
                          {
                            'callFrom': "Login",
                          }
                        ]);
                      }
                    })
                  : registerController.registerUser(data: {
                      "MobileNumber":
                          '${countryController.selectedCountryPhoneCode}${loginController.mobileNumber.text.trim()}',
                      // "MobileNumber": '+917066000016',
                      "Email": "",
                      "AuthenticationId": "",
                      "AuthenticationType": "",
                      "DeviceToken": "sdgsgsgsg",
                      "DeviceType": GetPlatform.isAndroid ? "Android" : "iOS",
                    }).then((value) {
                      // Get.back();
                      if (value) {
                        Get.toNamed('/register/otp', arguments: [
                          {
                            'mobileNumber':
                                '${countryController.selectedCountryPhoneCode}${loginController.mobileNumber.text.trim()}',
                          },
                          {
                            'callFrom': "Register",
                          }
                        ]);
                      }
                    });
              // Get.off(
              //   () => OtpScreenView(
              //     callFrom: callFrom,
              //   ),
              // );

              /**
                  Check Country Code & Mobile Number
                  If Valid then goto OtpScreenView
               **/
              print(countryController.selectedCountryCode);
              print(countryController.selectedCountryPhoneCode);
              print(
                  '${countryController.selectedCountryPhoneCode}${loginController.mobileNumber.text.trim()}');
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
            controller: loginController.mobileNumber,
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
  Widget _codePicker() {
    return CountryPhoneCodePicker.withDefaultSelectedCountry(
      defaultCountryCode:
          Country(name: 'INDIA', countryCode: 'IN', phoneCode: '+91'),
      borderRadius: 50,
      borderWidth: 0,
      flagBorderRadius: 100,
      flagHeight: 30,
      flagWidth: 30,

      searchBarPrefixIcon: const Icon(null),
      borderColor: Colors.transparent,

      searchBarHintText: 'Search by name',

      // contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }

  // validateFields() {
  validateFields() {
    if (!GetUtils.isPhoneNumber(
        loginController.mobileNumber.value.text.trim())) {
      return 'please enter a valid phone number!'.toTitleCase();
    }
    return '';
  }
}
