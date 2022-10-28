import 'package:booking_table/utils/common/common_font.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/view/auth_screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignInScreenBottomView extends StatelessWidget {
 final  String? callFrom;
  const SignInScreenBottomView({
    required this.callFrom,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonText(
          text: 'Enter Mobile Number',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(height: 15),
        InternationalPhoneNumberInput(
          onInputChanged: null,
          hintText: 'Phone Number',
          errorMessage: 'Invalid phone number',
          textStyle: const TextStyle(
            fontFamily: mainLatoFont,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
         // inputDecoration: ,
        ),
        const SizedBox(height: 15),
        CommonText(
          text: 'A 4 digit code will be sent to this number.',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.grey,
        ),
        const SizedBox(height: 40),
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
            bgColor: Colors.red,
            textColor: Colors.white,
          ),
        ),
        const SizedBox(height: 58),
        CommonText(
            text: 'Continue as Guest', color: Colors.red, fontSize: 16),
      ],
    );
  }
}
