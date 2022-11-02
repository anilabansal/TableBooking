import 'package:booking_table/view/auth_screens/widgets/sign_in_bottom_view.dart';
import 'package:booking_table/view/auth_screens/widgets/sign_in_top_view.dart';
import 'package:flutter/material.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({
    Key? key,
    required this.callFrom,
  }) : super(key: key);

  final String? callFrom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // TOP VIEW
        const SignInScreenTopView(),
        const SizedBox(height: 35),
        // BOTTOM VIEW
        SignInScreenBottomView(
          callFrom: callFrom,
        ),
      ],
    );
  }
}
