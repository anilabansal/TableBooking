import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../controller/profile/profile_controller.dart';
import '../common_strings.dart';

class DateInputTextField extends StatefulWidget {
 final TextEditingController? controller;

 const DateInputTextField({Key? key, this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DateInputTextFieldState();
  }
}

class _DateInputTextFieldState extends State<DateInputTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: const TextStyle(
        //fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: black000000,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: greyF4F4F4,
        hintText: "yyyy-mm-dd",
        hintStyle: const TextStyle(
          fontSize: 18.0,
          color: textLight868686,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: greyF4F4F4,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: whiteF4F4F4,
          ),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [DateTextFormatter()],
      onChanged: (String value) {},
    );
  }
}

class DateTextFormatter extends TextInputFormatter {
  int _maxChars = 8;
  ProfileController profileController = Get.find();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '-');
    return newValue.copyWith(
      text: text,
      selection: updateCursorPosition(text),
    );
  }

  String _format(String value, String seperator) {
    value = value.replaceAll(seperator, '');
    var newString = '';

    for (int i = 0; i < min(value.length, _maxChars); i++) {
      newString += value[i];
      // if ((i == 1 || i == 3) && i != value.length - 1) {
      //   newString += seperator;
      // }
      if (i == 3 && i != value.length - 1) {
        newString += seperator;
      }
      if (i == 5 && i != value.length - 1) {
        newString += seperator;
      }
    }
    profileController.dateController.text = newString.toString();
    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
