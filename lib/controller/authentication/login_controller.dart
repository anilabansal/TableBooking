import 'dart:io';

import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:booking_table/model/profile_details/profile_details/data.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/network/api_calls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var mobileNumber = TextEditingController();
  var countryCode = '1'.obs;
  var countryFlag = '🇺🇸'.obs;
  var isLoading = false.obs;
  var userProfileData = ProfileData().obs;
  // var countryFlag = '🇺🇸'.obs;
  ApiCalls apiCall = ApiCalls();
  UserSessionController userSession = Get.find();
  var authLoading = true.obs;

  /// login api call
  Future<bool> loginUser({Map<String, String>? data}) async {
    final response = await apiCall.callPostApi(
      // isToken: false,
      data!,
      logInEndPoint,
    );
    if (response['response'] == 1) {
      ShowToast.show(
        msg: "Otp Is ${response['otp'].toString()}",
      );
      isLoading.value = false;
      userSession.setIsProfileCreated(response['isProfileCreated']);
      if(response['isProfileCreated']==true){
        userSession.setIsLogin(true);
      }
      userSession.setCountryCode(countryCode.value);
      userSession.setCountryFlag(countryFlag.value);
      userSession.setMobileNumber(mobileNumber.value.text);
      userSession.setEmail(response['emailId']);
      userSession.setUserId(response['userId'].toString());
      userSession.setFullName(response['fullName']);
      userSession.setProfilePic(response['profilePic'] ?? "");
      print("User Session Number Login Page====>> $userSession");
      print(
          "IsProfileCreated Login Page ===>>> ${userSession.isProfileCreated}");
      return true;
    } else {
      ShowToast.show(
        msg: response['errorMessage'] ?? 'Please try again!',
        isError: true,
      );
      isLoading.value = false;
      update();
    }
    return false;
  }

  ///social Login api call
  Future<dynamic> socialLogin(
      {dynamic body,
        String? endPoint,
      File? imageFile,
       }) async {
    try {
      final response = await apiCall.callMultipartWithFileAPI(
        body!,
        endPoint!,
        File(''),
       // token: userSession.token,
      );

      if (response['response'] == 1) {
        print(response['data']);
       userSession.setIsProfileCreated(response['data']['isProfileCreated']);
         userSession.setUserToken(response['token']);
        if(response['data']['isProfileCreated']==true){
          userSession.setIsLogin(true);
        }
        userSession.setSocialLogin(true);
        userSession.setEmail(response['data']['emailId']??"");
        userSession.setUserId(response['data']['userId'].toString());
        // userSession.setFullName(response['firstName']['lastName']);
        userSession.setFullName(response['data']['firstName']??"");
        userSession.setProfilePic(response['data']['profilePic'] ?? "");
        authLoading.value = false;
        // update();
        return true;
      } else {
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );
        authLoading.value = false;
        return false;
      }
    } catch (e) {
      print('Error --------> $e');
    }
    return false;
  }
}
