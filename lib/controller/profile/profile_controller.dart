import 'dart:io';

import 'package:booking_table/controller/authentication/login_controller.dart';
import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:booking_table/model/profile_details/profile_details/data.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../utils/common/toast_message.dart';
import '../../utils/network/api_calls.dart';

class ProfileController extends GetxController {
  var data = Get.arguments;

  /// Initialization
  @override
  void onInit() async {
    // TODO: implement onInit
    await getProfileDetails();
    print("Arguments ===>>>> $data");
    // print(
    //     "Country Code ===>> ${userDetailsData.value.mobileNo!.substring(1, 3)}");

    firstNameController.text = userDetailsData.value.firstName!;
    print("Init First Name ===> ${userDetailsData.value.firstName}");
    lastNameController.text = userDetailsData.value.lastName!;
    dateController.text = userDetailsData.value.dateofBirth!.substring(0, 10);
    streetAddressController.text = userDetailsData.value.address!;
    emailAddressController.text = userDetailsData.value.email!;
    flagController.text = userSession.countryFlag;
    countryCodeController.text = userSession.countryCode;
    cityController.text = userDetailsData.value.city!;
    print(
        "Init Country COde Flad ===> ${flagController.text} ${countryCodeController.text}");
    stateController.text = userDetailsData.value.state!;
    zipCodeController.text = userDetailsData.value.zipCode!;
    mobileNumberController.text = userDetailsData.value.mobileNo!.substring(3);
    print('====> Token PROFILE ${userSession.token}');
    super.onInit();
  }

  /// View Controllers
  UserSessionController userSession = Get.find();
  LoginController loginController = Get.find();

  /// Network Calling
  ApiCalls apiCall = ApiCalls();

  /// Text Editing Controllers
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var dateController = TextEditingController();
  var streetAddressController = TextEditingController();
  var emailAddressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var zipCodeController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var mobileNumberControllerNew = TextEditingController();
  var flagController = TextEditingController();
  var countryCodeController = TextEditingController();

  /// Variables
  var countryCode = '91'.obs;
  var countryFlag = '🇺🇸'.obs;
  var userDetailsData = ProfileData().obs;
  var createProfileImage = File('').obs;

  /// Update Image File
  updateImageFile(File value) {
    createProfileImage.value = value;
  }

  /// Create Profile
  Future<dynamic> createProfile(
      {dynamic body,
      String? endPoint,
      File? imageFile,
      String? filename}) async {
    try {
      final response = await apiCall.callMultipartWithFileAPI(
          // body, endPoint!, imageFile!,
          body!,
          endPoint!,
          // filename: filename!,
          imageFile!,
          token: '${userSession.token}'
          // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImN0eSI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMzkiLCJleHAiOjE2Njg1ODUyMjAsImlzcyI6IlRlc3QuY29tIiwiYXVkIjoiVGVzdC5jb20ifQ.kOsK1K1dYmXDrVS8DdWE-_FvIcoc03DBxq6uXIuoIIw',
          );

      if (response['response'] == 1) {
        userSession.setIsProfileCreated(response['isProfileCreated']);
        // ProfileData profile = ProfileData.fromMap(response['data']);
        // userDetailsData.value = profile;
        // print("User Details====>> ${userDetailsData.value}");
        // userSession.setMobileNumber(response['mobileNumber'].toString());
        // userSession.setUserId(response['userId'].toString());
        // userSession.setFullName(response['fullName'].toString());
        // userSession.setUserId(response['userId'].toString());
        // userSession.setEmail(response['email'].toString());

        // print("Full Name ${userSession.fullName}");
        // print("UserID ${userSession.userId}");
        // print("MobileNumber ${userSession.mobileNumber}");

        print("IsProfileCreated ===>>> ${userSession.isProfileCreated}");
        return true;
      } else {
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );
        return false;
      }

      //print('Response --------> ${jsonDecode(response)}');

    } catch (e) {
      print('Error --------> $e');
    }
    return false;
  }

  /// Get Profle Details
  Future<dynamic> getProfileDetails({dynamic body}) async {
    try {
      final response = await apiCall.callPostApi(
          // body, endPoint!, imageFile!,
          body,
          getProfileDetail,
          // filename: filename!,

          token: '${userSession.token}'
          // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImN0eSI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMzkiLCJleHAiOjE2Njg1ODUyMjAsImlzcyI6IlRlc3QuY29tIiwiYXVkIjoiVGVzdC5jb20ifQ.kOsK1K1dYmXDrVS8DdWE-_FvIcoc03DBxq6uXIuoIIw',
          );

      if (response['response'] == 1) {
        ProfileData profile = ProfileData.fromMap(response['data']);
        userDetailsData.value = profile;
        print("User Details from GET Details====>> ${userDetailsData.value}");
        print("Arguments ===>>>> ${data}");

        print("User Details Name====>> ${userDetailsData.value.firstName}");
        return true;
      } else {
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );
        return false;
      }

      //print('Response --------> ${jsonDecode(response)}');

    } catch (e) {
      print('Error --------> $e');
    }
    return false;
  }
}
