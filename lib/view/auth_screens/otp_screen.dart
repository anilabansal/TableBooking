import 'package:booking_table/view/auth_screens/widgets/otp_screen_view_widget.dart';
import 'package:flutter/material.dart';

class OtpScreenView extends StatelessWidget {
  String? callFrom;
  OtpScreenView({required this.callFrom, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: OtpScreenViewWidget(
            callFrom: callFrom,
          ),
        ),
      ),
    );
  }
}
