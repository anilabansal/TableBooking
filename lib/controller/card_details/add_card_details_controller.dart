import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/network/api_calls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../model/saved_card_details/saved_card_details.dart';

class AddCardDetailsController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    savedCardList();
    super.onInit();
  }

  var selectedCardDate = DateTime.now().obs;

  var isLoading = true.obs;
  var isChecked = false.obs;
  void updateCheckbox() {
    isChecked.value = !isChecked.value;
  }

  var savedCardList = [].obs;
  ApiCalls apiCall = ApiCalls();
  UserSessionController userSessionController = Get.find();

  // Select Date
  // selectDate() async {
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: Get.context!,
  //     initialDatePickerMode: DatePickerMode.year,
  //     initialEntryMode: DatePickerEntryMode.calendarOnly,
  //     initialDate: selectedCardDate.value,
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(3000),
  //   );
  //   if (pickedDate != null && pickedDate != selectedCardDate.value) {
  //     selectedCardDate.value = pickedDate;
  //     cardExpiryDate.text =
  //         DateFormat('M-yy').format(selectedCardDate.value).toString();
  //   } else if (cardExpiryDate.text.isEmpty) {
  //     cardExpiryDate.text =
  //         DateFormat('M-yy').format(DateTime.now()).toString();
  //   }
  // }

  /// Saved Card Detail List
  Future<dynamic> savedCardListData({
    dynamic body,
    endPoint,
  }) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        // endPoint ?? savedCardDetailString,
        endPoint,
        token: userSessionController.token,
      );

      // SavedCardDetails savedCardListApiData =
      // SavedCardDetails.fromMap(response);

      // if (endPoint == null
      //     ? savedCardListApiData.response == 1
      //     : response['response'] == 1) {
      //   // aboutUsRestaurantList.value = (response['data'])?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
      //   //     .toList();
      //   //
      //   // print(index.value);
      //   // print(aboutUsRestaurantList.value);
      //   endPoint == null
      //       ? savedCardList.value = savedCardListApiData.userCardlist!
      //       : null;
      //   isLoading.value = false;
      //  // update();
      //   return true;
      // }
    if(response['response'] == 1){
      ShowToast.show(
        msg: response['errorMessage'],
      );
      isLoading.value = false;
      return true;
    }
      else {
        isLoading.value = false;
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );
        return false;
      }
    } catch (e) {
      print('Error --------> $e');
    }
    isLoading.value = false;

    return false;
  }
}