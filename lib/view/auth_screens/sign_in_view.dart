// ignore_for_file: must_be_immutable

import 'package:booking_table/controller/authentication/authentication.dart';
import 'package:booking_table/view/auth_screens/widgets/sign_in_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInView extends StatelessWidget {
  String? callFrom;
  AuthenticationController authController = Get.put(AuthenticationController());

  SignInView({required this.callFrom,  Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // BODY
      body: SignInBody(
        callFrom: callFrom,
        controller: authController,
      ),
    );
  }
}
