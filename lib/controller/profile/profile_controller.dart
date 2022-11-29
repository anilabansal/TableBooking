import 'dart:io';

import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../utils/common/common_strings.dart';
import '../../utils/common/toast_message.dart';
import '../../utils/network/api_calls.dart';

class ProfileController extends GetxController {
  UserSessionController userSession = Get.find();
  var isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    var data = Get.arguments;
    countryCode.value = data[0]['countryCode'];
    countryFlag.value = data[0]['countryFlag'];
    mobileNumberController.text = data[0]['mobileNumber'];
    mobileNumberControllerNew.text = data[0]['preFilledMobileNumber'];
    print(data);
    print('====> Token PROFILE ${userSession.token}');
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
  final mobileNumberControllerNew = TextEditingController();

  var countryCode = '91'.obs;
  var countryFlag = '🇺🇸'.obs;
  ApiCalls apiCall = ApiCalls();
  var createProfileImage = File('').obs;

  /// Update Image File
  // updateImageFile(File value) {
  //   createProfileImage.value = value;
  // }

  /// Create Profile
  Future<dynamic> createProfile(
      { Map<String, String>?  body,
        // String? endPoint,
        File? imageFile,
        String? filename}) async {
    try {
      final response = await apiCall.callMultipartFileAPI(
        // body, endPoint!, imageFile!,
          body!,
          createProfileEndPoint,
         // filename: filename!,
          imageFile!,
          token: '${userSession.token}'
        // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImN0eSI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMzkiLCJleHAiOjE2Njg1ODUyMjAsImlzcyI6IlRlc3QuY29tIiwiYXVkIjoiVGVzdC5jb20ifQ.kOsK1K1dYmXDrVS8DdWE-_FvIcoc03DBxq6uXIuoIIw',
      );
      if (response['response'] == 1) {
        //userDetails.value = UserProfile.fromMap(response);
        //userSession.setIsLogin(true);
        print(userSession.isLogin);
        // print("User Detail Model ====>>>>  ${userDetails.value}");
        isLoading.value = false;
        return true;
      } else {
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );
        isLoading.value = false;
        return false;
      }


    } catch (e) {
      print('Error --------> $e');
    }
    return false;
  }
}