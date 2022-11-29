import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:booking_table/model/profile_details/profile_details/data.dart';
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
  var userProfileData = ProfileData().obs;

  // var countryFlag = '🇺🇸'.obs;
  ApiCalls apiCall = ApiCalls();
  UserSessionController userSession = Get.find();

  Future<bool> loginUser({Map<String, String>? data}) async {
    final response = await apiCall.callPostApi(
      // isToken: false,
      data!,
      logInEndPoint,
      // token: 'token',
    );

    // print(data);
    // print('Login Response ======> ${response['token']}');
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
      userSession.setIsProfileCreated(response['isProfileCreated']);
      userSession.setCountryCode(countryCode.value);
      userSession.setCountryFlag(countryFlag.value);
      userSession.setMobileNumber(mobileNumber.value.text);
      userSession.setEmail(response['emailId']);
      userSession.setUserId(response['userId'].toString());
      userSession.setFullName(response['fullName']);
      userSession.setProfilePic(response['profilePic'] ?? "");
      // ProfileData profile = ProfileData.fromMap(response);
      // userProfileData.value = profile;
      // print("Country Code ====>> ${countryCode.value}");
      // print("User Details====>> ${userDetailsData.value}");
      print("User Session Number Login Page====>> $userSession");
      // userSession.setMobileNumber(response['mobileNumber'].toString());
      // userSession.setUserId(response['userId'].toString());
      // userSession.setFullName(response['fullName'].toString());

      // print("Full Name ${userSession.fullName}");
      // print("UserID ${userSession.userId}");
      // print("MobileNumber ${userSession.mobileNumber}");
      // print("TOKEN ===>>> ${userSession.token}");
      print(
          "IsProfileCreated Login Page ===>>> ${userSession.isProfileCreated}");
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
