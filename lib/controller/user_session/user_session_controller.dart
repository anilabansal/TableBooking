import 'dart:convert';
import 'dart:io';

import 'package:booking_table/controller/profile/profile_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../location/modals/previous_locations_lat_lng.dart';

class UserSessionController extends GetxController {
  GetStorage box = GetStorage();
  final _isLogin = false.obs;
  final _token = ''.obs;
  final _mobileNumber = ''.obs;
  final _userId = ''.obs;
  final _countryCode = ''.obs;
  final _countryFlag = ''.obs;
  final _isProfileCreated = false.obs;
  final _fullName = ''.obs;
  final _email = ''.obs;
  final _profilePic = ''.obs;
  final _isSocialLogin = false.obs;

  // final _recentSearchLocation = <String>[].obs;

  final _recentSearchLocation = <RecentSearch>[].obs;

  init() async {
    _isLogin.value = box.read(isLogInString) ?? false;
    _token.value = box.read(tokenString) ?? '';
    _userId.value = box.read(userIdString) ?? '';
    _mobileNumber.value = box.read(mobileNumberString) ?? '';
    _countryCode.value = box.read(countryCodeString) ?? '';
    _countryFlag.value = box.read(countryFlagString) ?? '';
    _isProfileCreated.value = box.read(isProfileCreatedString) ?? false;
    _fullName.value = box.read(fullNameString) ?? '';
    _email.value = box.read(emailString) ?? '';
    _profilePic.value = box.read(profilePicString) ?? '';
    _recentSearchLocation.value = box.read(recentSearchLocationString) != null
        ? List<RecentSearch>.from(box
            .read(recentSearchLocationString)
            .map((x) => RecentSearch.fromJson(x)))
        : [];
    //_isSocialLogin.value = box.read(socialLoginString)??false;
  }

  get isLogin => _isLogin.value;

  get token => _token.value;

  get countryCode => _countryCode.value;

  get countryFlag => _countryFlag.value;

  get userId => _userId.value;

  get mobileNumber => _mobileNumber.value;

  get isProfileCreated => _isProfileCreated.value;

  get fullName => _fullName.value;

  get email => _email.value;

  get profilePic => _profilePic.value;

  List<RecentSearch> get recentSearchLocation => _recentSearchLocation;

  get isSocialLogin => _isSocialLogin.value;

  void setSocialLogin(bool value){
    _isSocialLogin.value = value;
  }

  void setSearchLocation(String value, double latitude, double longitude) {
    RecentSearch temp = _recentSearchLocation.firstWhere(
      (element) => element.address == value.trim(),
      orElse: () => RecentSearch(
        address: "",
      ),
    );
    if (temp.address == "") {
      _recentSearchLocation.add(
        RecentSearch(
          address: value,
          lat: latitude,
          long: longitude,
        ),
      );
    }
    setPrefList(recentSearchLocationString, _recentSearchLocation);
  }

  void setIsLogin(bool value) {
    _isLogin.value = value;
    setPref(isLogInString, value);
  }

  void setUserToken(String value) {
    _token.value = value;
    setPref(tokenString, value);
  }

  void setProfilePic(String value) {
    _profilePic.value = value;
    setPref(profilePicString, value);
    update();
  }

  void setCountryFlag(String value) {
    _countryFlag.value = value;
    setPref(countryFlagString, value);
  }

  void setCountryCode(String value) {
    _countryCode.value = value;
    setPref(countryCodeString, value);
  }

  void setUserId(String value) {
    _userId.value = value;
    setPref(userIdString, value);
  }

  void setMobileNumber(String value) {
    _mobileNumber.value = value;
    setPref(mobileNumberString, value);
  }

  void setIsProfileCreated(dynamic value) {
    _isProfileCreated.value = value;
    setPref(isProfileCreatedString, value);
  }

  void setFullName(String value) {
    _fullName.value = value;
    setPref(fullNameString, value);
    update();
  }

  void setEmail(String value) {
    _email.value = value;
    setPref(emailString, value);
    update();
  }

  void setPref(String key, dynamic value) async {
    await box.write(key, value);
  }

  void setPrefList(String key, List<RecentSearch> value) async {
    // await box.write(key, value);
    await box.write(key, value);
  }

  // saveListWithGetStorage(String storageKey, List<dynamic> storageValue) async {
  //   await box.write( storageKey, value: jsonEncode(storageValue));}
  // readWithGetStorage(String storageKey) => box.read(storageKey);
  getPref(String key) async {
    await box.read(key);
  }

  Future logOut() async {
    // Get.deleteAll(force: true);
    //Get.delete<ProfileController>();

    setIsLogin(false);
    setSocialLogin(false);
    await box.erase();
    Get.offAllNamed('/authentication');
    // Get.toNamed(
    //   '/authentication',
    // );
  }
}
