import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  dynamic onTap;
  String? text;
  dynamic bgColor;
  dynamic textColor;
  CommonButton({
    this.onTap,
    this.text,
    this.bgColor,
    this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(05),
        ),
        child: Text(
          text!,
          style: TextStyle(
              color: textColor, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
