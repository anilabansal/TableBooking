// ignore_for_file: must_be_immutable

import 'package:booking_table/view/auth_screens/widgets/sign_in_body.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  String? callFrom;

  SignInView({required this.callFrom, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // BODY
      body: SignInBody(callFrom: callFrom),
    );
  }
}
