import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/common/common_strings.dart';
import '../../utils/common/toast_message.dart';
import '../../utils/network/api_calls.dart';
import '../user_session/user_session_controller.dart';

class SupportController extends GetxController
{
  ApiCalls apiCall = ApiCalls();
  UserSessionController userSessionController = Get.find();
var contactUsLoading = true.obs;

  /// customer support api call
  Future<dynamic> contactUstApiCall({
    dynamic body,
  }) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        contactUsEndPoint,
        token: userSessionController.token,
      );
      if (response['response'] == 1) {
        ShowToast.show(
          msg: response['errorMessage'] ,
        );
        return true;
      } else {
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );
        return false;
      }
    } catch (e) {
      print('Error --------> $e');
    }
    return false;
  }


  ///delete account api call

  Future<dynamic> deleteAccountApiCall({
    dynamic body,
  }) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        deleteAccountEndPoint,
        token: userSessionController.token,
      );
      if (response['response'] == 1) {
        ShowToast.show(
          msg:'Account Deleted Successfully' ,
        );
        userSessionController.setIsLogin(false);
        userSessionController.setSocialLogin(false);
        userSessionController.setUserToken("");
        await  userSessionController.box.erase();
        Get.offAllNamed('/authentication');
        userSessionController.setGuestUserNavigateScreen("");
        return true;
      } else {
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );
        return false;
      }
    } catch (e) {
      print('Error --------> $e');
    }
    return false;
  }

}