import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/network/api_calls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var mobileNumber = TextEditingController();
  var countryCode = '91'.obs;
  var countryFlag = '🇮🇳'.obs;
  var isLoading = false.obs;

  // var countryFlag = '🇺🇸'.obs;
  ApiCalls apiCall = ApiCalls();

  Future<bool> loginUser({Map<String, String>? data}) async {
    final response = await apiCall.callPostApi(
      data!,
      logInEndPoint,
      // token: 'token',
    );
    print(data);
    // print('Login Response ======> ${response.body}');
    // if (response.body['response'] == 1 && response.body['data'] != null) {
    //   return true;
    // } else if (response.body['response'] == 1 &&
    //     response.body['address'] == null) {
    //   ShowToast.show(
    //     msg: 'User not Registered!!',
    //     isError: true,
    //   );
    // }
    if (response['response'] == 1) {
      ShowToast.show(
        msg: response['errorMessage'],
      );
      isLoading.value = false;

      return true;
    }
    ShowToast.show(
      msg: response['errorMessage'] ?? 'Please try again!',
      isError: true,
    );

    isLoading.value = false;
    return false;
  }
}
