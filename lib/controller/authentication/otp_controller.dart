import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/network/api_calls.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class OtpController extends GetxController {
  /// Variables
  var pinOutPut = ''.obs;
  var isLoading = false.obs;
  var resendLoading = false.obs;
  // var mobileNumberData = Get.arguments;

  /// Controllers

  ApiCalls apiCall = ApiCalls();
  LoginController loginController = Get.find();
  UserSessionController userSession = Get.find();

  /// SUBMIT OTP ON REGISTER & LOGIN SCREEN
  Future<bool> enterOTP({Map<String, dynamic>? data}) async {
    final response = await apiCall.callPostApi(
      data!,
      submitOtp,
      token: userSession.token,
    );
    print(data);
    print('OTP Response ======> $response');
    if (response['response'] == 1) {
      userSession.setUserToken(response['token'].toString());

      // print("ARGUMENTS OTP $mobileNumberData");

      ShowToast.show(
        msg: response['errorMessage'] ?? 'Please try again!',
      );
      // userDetails.value = UserProfile.fromMap(response);
      // userSession.setIsLogin(true);
      // print("Is USer Logge in on SUmit OTP ====>> ${userSession.isLogin}");

      // print("User Detail Model ====>>>>  ${userDetails.value}");
      //

    //  isLoading.value = false;
      return true;
    }
    ShowToast.show(
      msg: response['errorMessage'] ?? 'Please try again!',
      isError: true,
    );
   // isLoading.value = false;

    return false;
  }



  Future<bool> resendOTP({Map<String, dynamic>? data}) async {
    final response = await apiCall.callPostApi(
      data!,
      resendOtp,
      // token: 'token',
    );
    print(data);
    print('OTP Response ======> $response');
    if (response['response'] == 1) {
      ShowToast.show(
        msg:  response["errorMessage"],
      );
      resendLoading.value = false;
      return true;
    }
    ShowToast.show(
      msg: response['errorMessage'] ?? 'Please try again!',
      isError: true,
    );
    resendLoading.value = false;

    return false;
  }

  // Future<bool> enterRegisterOTP({Map<String, dynamic>? data}) async {
  //   final response = await apiCall.callPostApi(
  //     data!,
  //     submitOtp,
  //     // token: 'token',
  //   );
  //   print(data);
  //   print('OTP Response ======> ${response.body}');
  //   if (response.body['response'] == 1 &&
  //       response.body['isProfileCreated'] == false) {
  //     userModel = UserDetailsModel.fromMap(response);
  //
  //     print('=====> User Model$userModel');
  //     userSession.setIsLogin(true);
  //     // userSession.mobileNumber(userModel.mobileNumber.toString());
  //     // userSession.token(userModel.token.toString());
  //     return true;
  //   } else if (response.body['response'] == 1 &&
  //       response.body['isProfileCreated'] == true) {
  //     ShowToast.show(
  //         msg: 'user already exists!!!'.toTitleCase(), isError: true);
  //   } else {
  //     ShowToast.show(
  //       msg: response.body['errorMessage'] ?? 'Please try again!',
  //       isError: true,
  //     );
  //   }
  //   return false;
  // }
}
