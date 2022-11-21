import 'package:booking_table/controller/user_session/user_session_controller.dart';
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

  UserSessionController userSession = Get.find();

  ApiCalls apiCall = ApiCalls();

  Future<bool> registerUser({Map<String, String>? data}) async {
    final response = await apiCall.callPostApi(
      data!,
      signUpEndPoint,
      // token: 'token',
    );
    print(data);
    print('Register Response ======> ${response}');
    if (response['response'] == 1) {
      userSession.setUserToken(response['token'].toString());
      userSession.setIsProfileCreated(response['isProfileCreated']);
      userSession.setMobileNumber(response['mobileNumber'].toString());
      userSession.setUserId(response['userId'].toString());
      userSession.setFullName(response['fullName'].toString());
      userSession.setUserId(response['userId'].toString());

      print("Full Name ${userSession.fullName}");
      print("UserID ${userSession.userId}");
      print("MobileNumber ${userSession.mobileNumber}");
      print("TOKEN ===>>> ${userSession.token}");
      print("IsProfileCreated ===>>> ${userSession.isProfileCreated}");
      isLoading.value = false;
      return true;
    } else {
      ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!', isError: true);
    }
    isLoading.value = false;

    return false;
  }
}
