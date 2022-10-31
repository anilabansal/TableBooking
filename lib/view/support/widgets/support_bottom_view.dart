import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/utils/common/widgets_methods/common_textformfield.dart';
import 'package:flutter/material.dart';

class SupportBottomView extends StatelessWidget {
  const SupportBottomView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
