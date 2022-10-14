import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text_field.dart';
import 'package:booking_table/view/auth_screens/otp_screen.dart';
import 'package:country_phone_code_picker/core/country_phone_code_picker_widget.dart';
import 'package:country_phone_code_picker/country_phone_code_picker.dart';
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
        CommonTextField(
          text: callFrom == 'Login'
              ? 'Enter Mobile Number'
              : 'Create Your Free Account',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(5)),
          margin: const EdgeInsets.only(
            left: 27,
            right: 13,
          ),
          child: Row(
            children: <Widget>[
              SizedBox(
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
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 15,
                ),
                width: 1,
                color: Colors.grey,
                height: 34,
              ),
              Expanded(
                  child: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                keyboardType: TextInputType.number,
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
        ),
        const SizedBox(height: 15),
        CommonTextField(
          text: 'A 4 digit code will be sent to this number.',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.grey,
        ),
        callFrom == 'Login'
            ? const SizedBox(height: 40)
            : Column(
                children: <Widget>[
                  const SizedBox(height: 58),
                  Row(
                    children: [
                      const Checkbox(value: true, onChanged: null),
                      Expanded(
                        child: CommonTextField(
                            text:
                                'I agree with all Terms & Conditions and Privacy Policy.',
                            fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
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
            text: 'Continue as Guest', color: redE2211C, fontSize: 16),
      ],
    );
  }
}
