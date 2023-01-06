import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../common_strings.dart';

class ProgressDialog {
  static void showProgressDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      elevation: 0,
      content: Center(
        child: SizedBox(
          child: Container(
            // width: 300,
            // height: 330,
            // color: white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // Lottie.asset(
                //   'assets/images/animation/14521-hotel-booking.json',
                //   width: 300,
                //   height: 300,
                //   fit: BoxFit.fill,
                //   repeat: true,
                // ),
                CircularProgressIndicator(
                  color: redE2211C,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(onWillPop: () async => true, child: alert);
      },
    );
  }
}
