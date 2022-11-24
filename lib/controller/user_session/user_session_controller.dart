import 'package:booking_table/utils/common/common_strings.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
  }

  void setEmail(String value) {
    _email.value = value;
    setPref(emailString, value);
  }

  void setPref(String key, dynamic value) async {
    await box.write(key, value);
  }

  getPref(String key) async {
    await box.read(key);
  }

  Future logOut() async {
    await box.erase();
    setIsLogin(false);
    Get.toNamed(
      '/authentication',
    );
  }
}
