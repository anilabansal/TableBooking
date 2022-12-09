import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/network/api_calls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var mobileNumber = TextEditingController();
  var countryCode = '1'.obs;
  var countryFlag = '🇺🇸'.obs;

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
    print('Register Response ======> $response');
    if (response['response'] == 1) {
      ShowToast.show(
        msg: "Otp Is ${response['otp'].toString()}",
      );
    //  userSession.setIsProfileCreated(response['isProfileCreated']);
      userSession.setCountryCode(countryCode.value);
      userSession.setCountryFlag(countryFlag.value);
       userSession.setMobileNumber(mobileNumber.value.text);

      // userSession.setMobileNumber(response['mobileNumber'].toString());
      // userSession.setUserId(response['userId'].toString());
      // userSession.setFullName(response['fullName'].toString());
      // userSession.setUserId(response['userId'].toString());

      // print("Full Name ${userSession.fullName}");
      // print("UserID ${userSession.userId}");
      // print("MobileNumber ${userSession.mobileNumber}");
      // print("TOKEN ===>>> ${userSession.token}");
      print(
          "IsProfileCreated REGISTER PAGE ===>>> ${userSession.isProfileCreated}");
      return true;
    } else {
      ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!', isError: true);
      return false;
    }
  }
}
