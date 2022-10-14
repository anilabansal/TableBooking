import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text_field.dart';
import 'package:booking_table/view/auth_screens/get_zip_code_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpScreenViewWidget extends StatelessWidget {
  String? callFrom;
  OtpScreenViewWidget({
    required this.callFrom,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 25),
        CommonTextField(
          text: 'Enter the 4 digit code sent to',
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
        const SizedBox(height: 5),
        CommonTextField(
          text: '+1-310-422-5076',
          fontWeight: FontWeight.w500,
          fontSize: 22,
        ),
        const SizedBox(height: 40),
        const PinBoxWidget(),
        const SizedBox(height: 38),
        // Button
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CommonButton(
            onTap: () {
              Get.off(
                () => const GetZipCodeView(),
              );
            },
            text: callFrom == 'Login' ? 'Sign In' : 'Submit',
            bgColor: Colors.red,
            textColor: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        CommonTextField(
          text: 'Resend Code',
          decoration: TextDecoration.underline,
          color: Colors.red,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        const SizedBox(height: 20),
        callFrom == 'Login'
            ? Container()
            : CommonTextField(
                text: 'Change Phone Number',
                decoration: TextDecoration.underline,
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
      ],
    );
  }
}

class PinBoxWidget extends StatelessWidget {
  const PinBoxWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
      ),
      child: const Pinput(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        defaultPinTheme: PinTheme(
          width: 64,
          height: 75,
          decoration: BoxDecoration(color: Color.fromRGBO(253, 244, 243, 1)),
          textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 40),
        ),
      ),
    );
  }
}
