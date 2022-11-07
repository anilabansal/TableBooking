import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/network/api_calls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var mobileNumber = TextEditingController();
  var pinOutPut = ''.obs;

  ApiCalls apiCall = ApiCalls();

  Future<bool> loginUser({Map<String, String>? data}) async {
    final response = await apiCall.callPostApi(
      data!,
      logInEndPoint,
      // token: 'token',
    );
    print(data);
    print('Register Response ======> ${response.body}');
    if (response.body['response'] == 30) {
      return true;
    } else {
      ShowToast.show(
          msg: response.body['errorMessage'] ?? 'Please try again!',
          isError: true);
    }
    return false;
  }
}
