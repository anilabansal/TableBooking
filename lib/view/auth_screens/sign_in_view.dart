// ignore_for_file: must_be_immutable

import 'package:booking_table/view/auth_screens/widgets/sign_in_bottom_view.dart';
import 'package:booking_table/view/auth_screens/widgets/sign_in_top_view.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  String? callFrom;

  SignInView({required this.callFrom, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          const SignInScreenTopView(),
          const SizedBox(height: 35),
          SignInScreenBottomView(
            callFrom: callFrom,
          ),
        ],
      ),
    );
  }
}
