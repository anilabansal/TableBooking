// ignore_for_file: must_be_immutable

import 'package:booking_table/view/auth_screens/widgets/otp_screen_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreenView extends StatelessWidget {
  String? callFrom;
  String? mobileNumber;
  var data = Get.arguments;

  OtpScreenView({required this.callFrom, this.mobileNumber, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data[0]['mobileNumber']);
    return Scaffold(
      body: OtpScreenViewWidget(
        mobileNumber: data[0]['mobileNumber'],
        callFrom: callFrom,
      ),
    );
  }
}
