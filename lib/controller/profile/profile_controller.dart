import 'dart:io';

import 'package:get/get.dart';

import '../../utils/common/common_strings.dart';
import '../../utils/common/toast_message.dart';
import '../../utils/network/api_calls.dart';

class ProfileController extends GetxController {
  static final ProfileController profileController =
  ProfileController._internal();

  factory ProfileController() {
    return profileController;
  }

  ProfileController._internal();

  var countryCode = '1'.obs;

  //var countryCode = 'USA'.obs;
  var countryFlag = '🇺🇸'.obs;

  ApiCalls apiCall = ApiCalls();
  var createProfileImage = File('').obs;
  Future<bool> createProfile(
      {Map<String, String>? body,
        String? endPoint,
        File? imageFile,
        String? filename}) async {
    try {
      final response = await apiCall.callPostApiWithFile(body!, endPoint!,
        filename: filename!, imageFile: imageFile,
        // token:
      );
      print('Response --------> ${response!}');
      if (response['response'] == 1) {
        return true;
      } else {
        ShowToast.show(
          msg: response['message'] ?? 'Please try again!',
          isError: true,
        );
      }
    } catch (e) {
      return false;
    }
    return false;
  }
}
