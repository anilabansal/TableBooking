import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/network/api_calls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../user_session/user_session_controller.dart';

class LoginController extends GetxController {
  var mobileNumber = TextEditingController();
  var countryCode = '91'.obs;
  var countryFlag = '🇮🇳'.obs;
  var isLoading = false.obs;

  // var countryFlag = '🇺🇸'.obs;
  ApiCalls apiCall = ApiCalls();
  UserSessionController userSession = Get.find();

  Future<bool> loginUser({Map<String, String>? data}) async {
    final response = await apiCall.callPostApi(
      data!,
      logInEndPoint,
    );
    print(data);

    if (response['response'] == 1) {
      ShowToast.show(
        msg: "Otp Is ${response['otp'].toString()}",
      );
      isLoading.value = false;
      userSession.setIsProfileCreated(response['isProfileCreated']);
      if (response['isProfileCreated'] == true) {
        userSession.setIsLogin(true);
      }

    userSession.setProfilePic(response['profilePic'] ?? "");
    update();
    return true;
    }
    else{
    ShowToast.show(
    msg: response['errorMessage'] ?? 'Please try again!',
    isError: true,
    );
    isLoading.value = false;
    update();
    }
    return
    false;
  }
}