// ignore_for_file: must_be_immutable

import 'package:booking_table/utils/common/common_colors.dart';
import 'package:flutter/material.dart';

class CommonTextFormField extends StatelessWidget {
  String? hintText;
  double? fontSize;
  int? maxLength;
  Widget? suffixIcon;
  Color? color;
  Color? fillColor;
  bool? filled;
  bool? obscureText;
  TextInputType? keyboardType;
  EdgeInsetsGeometry? contentPadding;
  FontWeight? fontWeight;
  CommonTextFormField({
    this.hintText,
    this.maxLength,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText,
    this.contentPadding,
    this.fontSize,
    this.color,
    this.fillColor,
    this.filled,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.always,
      keyboardType: keyboardType,
      maxLength: maxLength,
      cursorWidth: 1,
      style: const TextStyle(fontSize: 20, color: black000000),
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        helperMaxLines: 3,
        contentPadding: contentPadding ?? const EdgeInsets.only(left: 13),
        hintText: hintText,
        filled: filled,
        fillColor: fillColor,
        suffixIcon: suffixIcon,
        counterText: '',
        hintStyle: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}
