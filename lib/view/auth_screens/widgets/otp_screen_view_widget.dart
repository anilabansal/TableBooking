// ignore_for_file: must_be_immutable
import 'package:booking_table/controller/authentication/login_controller.dart';
import 'package:booking_table/controller/authentication/otp_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/utils/extensions/capitalization_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../controller/user_session/user_session_controller.dart';
import '../../../utils/common/widgets_methods/progress_loader.dart';

class OtpScreenViewWidget extends StatelessWidget {
  String? mobileNumber;
  LoginController loginController = Get.find();
  final String? callFrom;

  OtpScreenViewWidget({
    required this.callFrom,
    this.mobileNumber,
    Key? key,
  }) : super(key: key);
  OtpController controller = Get.find();
  UserSessionController userSession = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          CommonText(
            text: 'Enter the 4 digit code sent to',
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: textDark3F3E3E,
          ),
          const SizedBox(height: 5),
          CommonText(
            text: mobileNumber.toString(),
            // text: '+1-310-422-5076',
            fontWeight: FontWeight.w500,
            color: black000000,
            fontSize: 22,
          ),
          const SizedBox(height: 40),
          PinBoxWidget(),
          const SizedBox(height: 38),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: CommonButton(
              onTap: () async {
                if (controller.pinOutPut.value == "") {
                  ShowToast.show(
                      msg:
                          'Please enter the 4 digit code sent to $mobileNumber');
                  return;
                }
                var otp = int.parse(controller.pinOutPut.value);
                print("pinOutPut --->${controller.pinOutPut.value}");
                ProgressDialog.showProgressDialog(context);
                // controller.isLoading.value = true;
                await controller.enterOTP(
                  data: {
                    "otp": otp,
                    "mobileNumber": mobileNumber.toString(),
                  },
                ).then(
                  (value) {
                    Navigator.pop(context);
                    if (value) {
                      if (userSession.isProfileCreated) {
                        Get.offAllNamed('/zip-code');
                      } else {
                        Get.offAllNamed(
                          '/create-profile',
                          // arguments: [
                          //   {
                          //     'mobileNumber': '$mobileNumber',
                          //     'preFilledMobileNumber':
                          //         loginController.mobileNumber.text,
                          //     'countryCode': loginController.countryCode.value,
                          //     'countryFlag': loginController.countryFlag.value,
                          //     // '${loginController.mobileNumber.text.substring(3)}',
                          //   },
                          // ],
                        );
                      }
                    }
                  },
                );
              },
              text: 'Submit',
              bgColor: redE2211C,
              textColor: Colors.white,
            ),
          ),

          const SizedBox(height: 20),
          // controller.resendLoading.value
          //     ? const Center(
          //         child: CircularProgressIndicator(
          //         color: redE2211C,
          //       ))
          //     :
          InkWell(
            onTap: () async {
              ProgressDialog.showProgressDialog(context);
              controller.resendLoading.value = true;
              await controller.resendOTP(data: {
                "MobileNumber": mobileNumber.toString(),
                // "MobileNumber": '+917066000016',
              }).then((value) {
                Navigator.pop(context);

                if (value) {
                  controller.resendLoading.value = false;
                  // Get.toNamed('/login/otp', arguments: [
                  //   {
                  //     'mobileNumber':
                  //     '+${loginController.countryCode.value}${loginController.mobileNumber.text.trim()}',
                  //   },
                  //   {
                  //     'callFrom': "Login",
                  //   }
                  // ]);
                }
              });
              // Get.back();
            },
            child: CommonText(
              text: 'Resend Code',
              decoration: TextDecoration.underline,
              color: redE2211C,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          callFrom == 'Login'
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
                ),
        ],
      ),
    );
    ;
  }

  // validateFields() {
  validateFields() {
    if (controller.pinOutPut.value != '') {
      return 'Please enter otp!'.toTitleCase();
    }
    return '';
  }
}

class PinBoxWidget extends StatelessWidget {
  OtpController controller = Get.find();

  PinBoxWidget({
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
        // controller: controller.otp,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        defaultPinTheme: const PinTheme(
          width: 64,
          height: 75,
          decoration: BoxDecoration(color: otpFieldFDF4F3),
          textStyle: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 40, color: black000000),
        ),
        onChanged: (newValue) {
          controller.pinOutPut.value = newValue;
          print(newValue);
        },
      ),
    );
  }
}
