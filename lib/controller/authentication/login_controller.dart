import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/network/api_calls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var mobileNumber = TextEditingController();

  ApiCalls apiCall = ApiCalls();

  Future<bool> loginUser({Map<String, String>? data}) async {
    final response = await apiCall.callPostApi(
      data!,
      logInEndPoint,
      // token: 'token',
    );
    print(data);
    print('Login Response ======> ${response.body}');
    if (response.body['response'] == 1) {
      return true;
    } else {
      ShowToast.show(
        msg: response.body['errorMessage'] ?? 'Please try again!',
        isError: true,
      );
    }
    return false;
  }
}
