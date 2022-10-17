import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddCardDetailsController extends GetxController {
  var selectedCardDate = DateTime.now().obs;
  var cardExpiryDate = TextEditingController();

  // Select Date
  selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedCardDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(3000),
    );
    if (pickedDate != null && pickedDate != selectedCardDate.value) {
      selectedCardDate.value = pickedDate;
      cardExpiryDate.text =
          DateFormat('MM-y').format(selectedCardDate.value).toString();
    } else if (cardExpiryDate.text.isEmpty) {
      cardExpiryDate.text =
          DateFormat('MM-y').format(DateTime.now()).toString();
    }
  }
}
