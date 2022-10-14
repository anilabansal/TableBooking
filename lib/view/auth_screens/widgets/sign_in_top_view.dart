import 'package:booking_table/utils/common/images_string.dart';
import 'package:flutter/material.dart';

class SignInScreenTopView extends StatelessWidget {
  const SignInScreenTopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          signInBackgroundLogo,
          height: 247,
        ),
        Image.asset(
          signInLogo,
          height: 247,
        ),
      ],
    );
  }
}
