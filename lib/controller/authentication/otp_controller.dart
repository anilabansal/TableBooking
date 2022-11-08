import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/extensions/capitalization_strings.dart';
import 'package:booking_table/utils/network/api_calls.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  var pinOutPut = ''.obs;

  ApiCalls apiCall = ApiCalls();

  Future<bool> enterLoginOTP({Map<String, dynamic>? data}) async {
    final response = await apiCall.callPostApi(
      data!,
      submitOtp,
      // token: 'token',
    );
    print(data);
    print('OTP Response ======> ${response.body}');
    if (response.body['response'] == 1 && response.body['address'] != null) {
      return true;
    } else if (response.body['response'] == 1 &&
        response.body['address'] == null) {
      ShowToast.show(
          msg: 'User not Registered!!!'.toTitleCase(), isError: true);
      return false;
    } else {
      ShowToast.show(
        msg: response.body['errorMessage'] ?? 'Please try again!',
        isError: true,
      );
    }
    return false;
  }

  Future<bool> enterRegisterOTP({Map<String, dynamic>? data}) async {
    final response = await apiCall.callPostApi(
      data!,
      submitOtp,
      // token: 'token',
    );
    print(data);
    print('OTP Response ======> ${response.body}');
    if (response.body['response'] == 1 && response.body['address'] == null) {
      return true;
    } else if (response.body['response'] == 1 &&
        response.body['address'] != null) {
      ShowToast.show(
          msg: 'user already exists!!!'.toTitleCase(), isError: true);
    } else {
      ShowToast.show(
        msg: response.body['errorMessage'] ?? 'Please try again!',
        isError: true,
      );
    }
    return false;
  }
}
