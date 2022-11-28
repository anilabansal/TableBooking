import 'package:flutter/material.dart';

import '../common_strings.dart';


class ProgressDialog {
  static void showProgressDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              // Lottie.asset(
              //   'assets/images/animation/lf30_editor_mmabixpj.json',
              //   width: 300,
              //   height: 150,
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
