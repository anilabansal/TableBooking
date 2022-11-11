import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../utils/common/toast_message.dart';
import '../../utils/network/api_calls.dart';

class ProfileController extends GetxController {
  static final ProfileController profileController =
      ProfileController._internal();
  factory ProfileController() {
    return profileController;
  }
  ProfileController._internal();

  @override
  void onInit() {
    // TODO: implement onInit
    var data = Get.arguments;
    mobileNumberController.text = data[0]['mobileNumber'];
    print(data);
    super.onInit();
  }

  /// Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dateController = TextEditingController();
  final streetAddressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();
  final mobileNumberController = TextEditingController();

  var countryCode = '1'.obs;
  var countryFlag = '🇺🇸'.obs;
  ApiCalls apiCall = ApiCalls();
  var createProfileImage = File('').obs;

  /// Create Profile
  Future<bool> createProfile(
      {Map<String, dynamic>? body,
      String? endPoint,
      File? imageFile,
      String? filename}) async {
    try {
      final response = await apiCall.callPostApiWithFile(
        body!, endPoint!,
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
