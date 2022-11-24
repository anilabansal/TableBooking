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
  /// Initialization
  @override
  void onInit() async {
    // TODO: implement onInit
    print("Profile COntroller Initialization");
    if (userProfileData.value.firstName != null) {
      firstNameController.text = userProfileData.value.firstName!;
      lastNameController.text = userProfileData.value.lastName!;
      dateController.text = userProfileData.value.dateofBirth!.substring(0, 10);
      streetAddressController.text = userProfileData.value.address!;
      emailAddressController.text = userProfileData.value.email!;
      flagController.text = userSession.countryFlag;
      countryCodeController.text = userSession.countryCode;
      cityController.text = userProfileData.value.city!;
      stateController.text = userProfileData.value.state!;
      zipCodeController.text = userProfileData.value.zipCode!;
      mobileNumberController.text = userSession.mobileNumber;
    } else {
      flagController.text = userSession.countryFlag;
      countryCodeController.text = userSession.countryCode;
      mobileNumberController.text = userSession.mobileNumber;
    }
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
  var flagController = TextEditingController();
  var countryCodeController = TextEditingController();

  /// Variables
  var countryCode = ''.obs;
  // var countryCode = '91'.obs;
  // var countryFlag = '🇺🇸'.obs;
  var countryFlag = ''.obs;
  var userProfileData = ProfileData().obs;
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
        body!,
        endPoint!,
        imageFile!,
        token: userSession.token,
      );

      if (response['response'] == 1) {
        print(response['data']);

        /// Set ISCREATE_PROFILE value to true
        userSession.setIsProfileCreated(response['data']['isProfileCreated']);
        userSession.setEmail(response['data']['emailId'] ?? "No Email Found");
        userSession.setUserId(response['data']['userId'].toString());
        userSession.setFullName(
            "${response['data']['firstName']} ${response['data']['lastName']}");
        userSession.setProfilePic(response['data']['profilePic'] ?? "");

        // ProfileData profile = ProfileData.fromMap(response['data']);
        // userProfileData.value = profile;
        // print("User Details====>> ${userProfileData.value}");
        // userSession.setMobileNumber(response['mobileNumber'].toString());
        // userSession.setUserId(response['userId'].toString());
        // userSession.setFullName(response['fullName'].toString());
        // userSession.setUserId(response['userId'].toString());
        // userSession.setEmail(response['email'].toString());

        // print("Full Name ${userSession.fullName}");
        // print("UserID ${userSession.userId}");
        // print("MobileNumber ${userSession.mobileNumber}");
        // ProfileController().getProfileDetails();
        print("IsProfileCreated Profile Controller ===>>> ${userSession}");
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

  /// Get Profile Details
  Future<dynamic> getProfileDetails({dynamic body}) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        getProfileDetail,
        token: userSession.token,
      );

      if (response['response'] == 1) {
        ProfileData profile = ProfileData.fromMap(response['data']);
        userProfileData.value = profile;
        userSession.setEmail(response['data']['emailId']);
        userSession.setUserId(response['data']['userId'].toString());
        userSession.setFullName(
            "${response['data']['firstName']} ${response['data']['lastName']}");
        userSession.setProfilePic(response['data']['profilePic'] ?? "");
        onInit();
        // print(
        //     "User Details from Profile Controller  ====>> ${userProfileData.value}");

        print(
            "User Details Name from Profile Controller====>> ${userProfileData.value.firstName}");

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
