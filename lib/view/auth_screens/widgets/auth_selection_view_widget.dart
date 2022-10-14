import 'package:booking_table/controller/authentication/auth_view_controller.dart';
import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/images_string.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/view/auth_screens/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreenViewWidget extends StatelessWidget {
  const AuthScreenViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.lazyPut(() => AuthViewController());

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          authSelectScreenLogo,
          height: 54,
          width: 143,
        ),
        CommonSizedBox(height: 26),
        CommonText(
          text: 'Welcome!',
          color: black040404,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        CommonSizedBox(height: 20),
        CommonButton(
          text: 'Sign In',
          bgColor: redE2211C,
          onTap: () {
            // TODO: Sign In Functionality
            Get.to(
              () => SignInView(
                callFrom: 'Login',
              ),
            );
          },
          textColor: Colors.white,
        ),
        CommonSizedBox(height: 20),
        CommonText(
          text: 'OR',
          color: textLight868686,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        CommonSizedBox(height: 20),
        CommonText(
            text: 'No Account?',
            color: textLight868686,
            fontWeight: FontWeight.w400,
            fontSize: 14),
        CommonSizedBox(height: 10),
        CommonButton(
          onTap: () {
            Get.to(
              () => SignInView(
                callFrom: 'Sign Up',
              ),
            );
          },
          text: 'Sign Up',
          bgColor: black000000,
          textColor: Colors.white,
        ),
        CommonSizedBox(height: 20),
        CommonText(
            text: 'OR',
            fontWeight: FontWeight.w400,
            color: textLight868686,
            fontSize: 14),
        CommonSizedBox(height: 20),
        CommonText(
          text: 'Continue with',
          color: black000000,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        CommonSizedBox(height: 15),
        _iconRow(),
      ],
    );
  }

  Row _iconRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          facebookLogo,
          height: 46,
          width: 70,
        ),
        CommonSizedBox(width: 20),
        Image.asset(
          googleLogo,
          height: 46,
          width: 70,
        ),
        CommonSizedBox(width: 20),
        Image.asset(
          appleLogo,
          height: 46,
          width: 70,
        ),
      ],
    );
  }
}
