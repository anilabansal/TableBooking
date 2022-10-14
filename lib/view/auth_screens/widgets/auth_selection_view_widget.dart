import 'package:booking_table/utils/common/images_string.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text_field.dart';
import 'package:booking_table/view/auth_screens/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreenViewWidget extends StatelessWidget {
  const AuthScreenViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          authSelectScreenLogo,
          height: 54,
          width: 143,
        ),
        _sizedBox(height: 26),
        CommonTextField(
          text: 'Welcome!',
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        _sizedBox(height: 20),
        CommonButton(
          text: 'Sign In',
          bgColor: Colors.red,
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
        _sizedBox(height: 20),
        CommonTextField(
          text: 'OR',
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        _sizedBox(height: 20),
        CommonTextField(
            text: 'No Account?',
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 14),
        _sizedBox(height: 10),
        CommonButton(
          onTap: () {
            Get.to(
              () => SignInView(
                callFrom: 'Sign Up',
              ),
            );
          },
          text: 'Sign Up',
          bgColor: Colors.black,
          textColor: Colors.white,
        ),
        _sizedBox(height: 20),
        CommonTextField(
            text: 'OR',
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            fontSize: 14),
        _sizedBox(height: 20),
        CommonTextField(
          text: 'Continue with',
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        _sizedBox(height: 15),
        _iconRow(),
      ],
    );
  }

  SizedBox _sizedBox({double? height, double? width}) {
    return SizedBox(
      height: height,
      width: width,
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
        _sizedBox(width: 20),
        Image.asset(
          googleLogo,
          height: 46,
          width: 70,
        ),
        _sizedBox(width: 20),
        Image.asset(
          appleLogo,
          height: 46,
          width: 70,
        ),
      ],
    );
  }
}
