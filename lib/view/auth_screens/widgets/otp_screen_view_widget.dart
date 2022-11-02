// ignore_for_file: must_be_immutable
import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../controller/authentication/auth_view_controller.dart';

class OtpScreenViewWidget extends StatefulWidget {
  final String? callFrom;

  const OtpScreenViewWidget({
    required this.callFrom,
    Key? key,
  }) : super(key: key);

  @override
  State<OtpScreenViewWidget> createState() => _OtpScreenViewWidgetState();
}

AuthViewController controller = Get.put(AuthViewController());

class _OtpScreenViewWidgetState extends State<OtpScreenViewWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: <Widget>[
        CommonText(
          text: 'Enter the 4 digit code sent to',
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: textDark3F3E3E,
        ),
        const SizedBox(height: 5),
        CommonText(
          text: '+1-310-422-5076',
          fontWeight: FontWeight.w500,
          color: black000000,
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
              print("pinOutPut --->${controller.pinOutPut}");
              if (widget.callFrom == 'Login') {
                Get.offAllNamed('/zip-code');
              } else {
                Get.offAllNamed('/create-profile');
              }
            },
            text: 'Submit',
            bgColor: redE2211C,
            textColor: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        CommonText(
          text: 'Resend Code',
          decoration: TextDecoration.underline,
          color: redE2211C,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        const SizedBox(height: 20),
        widget.callFrom == 'Login'
            ? Container()
            : InkWell(
                onTap: () {
                  Get.toNamed('/register');
                },
                child: CommonText(
                  text: 'Change Phone Number',
                  decoration: TextDecoration.underline,
                  color: black040404,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              )
      ]),
    );
  }
}

class PinBoxWidget extends StatelessWidget {
  const PinBoxWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // PIN INPUT BOX
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 22,
      ),
      child: Pinput(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        defaultPinTheme: const PinTheme(
          width: 64,
          height: 75,
          decoration: BoxDecoration(color: otpFieldFDF4F3),
          textStyle: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 40, color: black000000),
        ),
        onCompleted: (pin) {
          controller.pinOutPut.value = pin;
        },
      ),
    );
  }
}
