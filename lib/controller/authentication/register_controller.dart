import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/network/api_calls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var mobileNumber = TextEditingController();

  var isLoading = true.obs;

  var isChecked = false.obs;

  void updateCheckbox() {
    isChecked.value = !isChecked.value;
  }

  ApiCalls apiCall = ApiCalls();

  Future<bool> registerUser({Map<String, String>? data}) async {
    final response = await apiCall.callPostApi(
      data!,
      signUpEndPoint,
      // token: 'token',
    );
    print(data);
    // print('Register Response ======> ${response.body}');
    if (response['response'] == 1) {
      ShowToast.show(
        msg: "Otp Is ${response['otp'].toString()}",
      );
      isLoading.value = false;
      update();
      return true;
    } else {
      ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!', isError: true);
      isLoading.value = false;
      update();
    }
    return false;
  }
}
