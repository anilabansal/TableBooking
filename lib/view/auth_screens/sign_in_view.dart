import 'package:booking_table/view/auth_screens/widgets/sign_in_bottom_view.dart';
import 'package:booking_table/view/auth_screens/widgets/sign_in_top_view.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  String? callFrom;

  SignInView({required this.callFrom, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SignInScreenTopView(),
          SizedBox(height: 35),
          SignInScreenBottomView(
            callFrom: callFrom,
          ),
        ],
      ),
    );
  }
}
