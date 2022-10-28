// ignore_for_file: must_be_immutable

import 'package:booking_table/utils/common/common_strings.dart';
import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  String? text;
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  TextDecoration? decoration;
  String? fontFamily;
  TextAlign? textAlign;
  CommonText({
    this.text,
    this.textAlign,
    this.fontFamily,
    this.decoration,
    this.fontWeight,
    this.color,
    this.fontSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: fontFamily ?? mainLatoFont,
        decoration: decoration,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        // fontWeight: FontWeight.bold,
      ),
    );
  }
}
