import 'package:booking_table/utils/common/common_strings.dart';
import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  String? text;
  Color? color;
  bool? softWrap;
  double? fontSize;
  FontWeight? fontWeight;
  TextDecoration? decoration;
  TextOverflow? overflow;
  String? fontFamily;
  TextAlign? textAlign;
  CommonText({
    this.overflow,
    this.text,
    this.softWrap,
    this.fontFamily,
    this.decoration,
    this.fontWeight,
    this.color,
    this.fontSize,
    this.textAlign,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      // text!,
      textAlign: textAlign,
      softWrap: softWrap ?? false,
      style: TextStyle(
        overflow: overflow,

        fontFamily: fontFamily ?? mainLaToFont,
        decoration: decoration,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        // fontWeight: FontWeight.bold,
      ),
    );
  }
}

