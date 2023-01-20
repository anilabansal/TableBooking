// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import '../../../controller/profile/profile_controller.dart';
// import '../common_strings.dart';
//
// class DateInputTextField extends StatefulWidget {
//  final TextEditingController? controller;
//
//  const DateInputTextField({Key? key, this.controller}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return _DateInputTextFieldState();
//   }
// }
//
// class _DateInputTextFieldState extends State<DateInputTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: widget.controller,
//       style: const TextStyle(
//         //fontSize: 18.0,
//         fontWeight: FontWeight.w400,
//         color: black000000,
//       ),
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: greyF4F4F4,
//         hintText: "yyyy-mm-dd",
//         hintStyle: const TextStyle(
//           fontSize: 18.0,
//           color: textLight868686,
//           fontWeight: FontWeight.w400,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(5),
//           borderSide: const BorderSide(
//             color: greyF4F4F4,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(5),
//           borderSide: const BorderSide(
//             color: whiteF4F4F4,
//           ),
//         ),
//       ),
//       keyboardType: TextInputType.number,
//       inputFormatters: [DateTextFormatter()],
//       onChanged: (String value) {},
//     );
//   }
// }
/// format for d.o.b
import 'dart:math';
import 'package:flutter/services.dart';

class DateTextFormatter extends TextInputFormatter {
  int _maxChars = 8;
 // ProfileController profileController = Get.find();
  // ProfileController profileController = Get.put(ProfileController());
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
      if (i == 1 && i != value.length - 1) {
        newString += seperator;
      }
      if (i == 3 && i != value.length - 1) {
        newString += seperator;
      }
      if (i == 8 && i != value.length - 1) {
        newString += seperator;
      }
      // if (i == 3 && i != value.length - 1) {
      //   newString += seperator;
      // }
      // if (i == 5 && i != value.length - 1) {
      //   newString += seperator;
      // }
    }
    //profileController.dateController.text = newString.toString();
    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
/// format for expiry date in add card
class CardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String valueToReturn = '';
    for (int i = 0; i < newValueString.length; i++) {
      if (newValueString[i] != '/') valueToReturn += newValueString[i];
      var nonZeroIndex = i + 1;
      final contains = valueToReturn.contains(RegExp(r'\/'));
      if (nonZeroIndex % 2 == 0 &&
          nonZeroIndex != newValueString.length &&
          !(contains)) {
        valueToReturn += '/';
      }
    }
    return newValue.copyWith(
      text: valueToReturn,
      selection: TextSelection.fromPosition(
        TextPosition(offset: valueToReturn.length),
      ),
    );
  }
}