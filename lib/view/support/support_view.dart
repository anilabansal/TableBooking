import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/images_string.dart';
import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/utils/common/widgets_methods/common_textformfield.dart';
import 'package:flutter/material.dart';

class SupportView extends StatelessWidget {
  const SupportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommon(
        text: 'Support',
      ),
      body: const SupportBody(),
    );
  }
}

class SupportBody extends StatelessWidget {
  const SupportBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          CommonSizedBox(
            height: 20,
          ),
          Image.asset(
            supportIcon,
            height: 139,
            width: 132,
          ),
          CommonSizedBox(
            height: 30,
          ),
          CommonText(
            textAlign: TextAlign.center,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            text: 'We will respond as quickly as possible\n to all inquiries',
          ),
          CommonSizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: 'Email',
                  fontSize: 14,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w400,
                ),
                CommonTextFormField(
                  filled: true,
                  fillColor: whiteF4F4F4,
                  hintText: 'Enter Email',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                CommonSizedBox(
                  height: 25,
                ),
                CommonText(
                  text: 'Topic',
                  fontSize: 14,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w400,
                ),
                CommonTextFormField(
                  filled: true,
                  fillColor: whiteF4F4F4,
                  hintText: 'Enter Topic',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                CommonSizedBox(
                  height: 25,
                ),
                CommonText(
                  text: 'Comment',
                  fontSize: 14,
                  textAlign: TextAlign.left,
                  fontWeight: FontWeight.w400,
                ),
                CommonTextFormField(
                  filled: true,
                  fillColor: whiteF4F4F4,
                  hintText: 'Type Here...',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                CommonSizedBox(
                  height: 25,
                ),
                CommonButton(
                  text: 'Submit',
                  fontSize: 18,
                  bgColor: redE2211C,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
