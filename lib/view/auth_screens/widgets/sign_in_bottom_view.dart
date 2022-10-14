import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text_field.dart';
import 'package:booking_table/view/auth_screens/otp_screen.dart';
import 'package:country_phone_code_picker/core/country_phone_code_picker_widget.dart';
import 'package:country_phone_code_picker/country_phone_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreenBottomView extends StatelessWidget {
  String? callFrom;
  SignInScreenBottomView({
    required this.callFrom,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Heading
        CommonTextField(
          text: callFrom == 'Login'
              ? 'Enter Mobile Number'
              : 'Create Your Free Account',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(height: 15),
        _textFieldRow(),
        const SizedBox(height: 15),
        CommonTextField(
          text: 'A 4 digit code will be sent to this number.',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.grey,
        ),
        callFrom == 'Login'
            ? const SizedBox(height: 40)
            : _privacyPolicyNTerms(),
        // Button
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CommonButton(
            onTap: () {
              Get.off(
                () => OtpScreenView(
                  callFrom: callFrom,
                ),
              );
            },
            text: callFrom == 'Login' ? 'Sign In' : 'Sign Up',
            bgColor: redE2211C,
            textColor: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        CommonTextField(text: 'OR', color: Colors.grey, fontSize: 14),
        const SizedBox(height: 20),
        CommonTextField(
          text: 'Continue as Guest',
          color: redE2211C,
          fontSize: 16,
          decoration: TextDecoration.underline,
        ),
      ],
    );
  }

  Container _textFieldRow() {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(253, 244, 243, 1),
          borderRadius: BorderRadius.circular(5)),
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
            color: Colors.grey,
            height: 34,
          ),
          // TextField
          Expanded(
              child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            keyboardType: TextInputType.number,
            cursorWidth: 0,
            style: const TextStyle(
              fontSize: 20,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          )),
        ],
      ),
    );
  }

  SizedBox _codePicker() {
    return SizedBox(
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
      ),
    );
  }

  Column _privacyPolicyNTerms() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 58),
        Row(
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
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                    TextSpan(
                      text: 'Terms & Conditions ',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // TODO : TERMS & CONDITIONS
                        },
                    ),
                    const TextSpan(
                        text: 'and ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        )),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // TODO : PRIVACY POLICY
                        },
                    ),
                    const TextSpan(
                      text: '.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
