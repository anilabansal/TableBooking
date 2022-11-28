import 'package:booking_table/utils/common/common_strings.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserSessionController extends GetxController {
  GetStorage box = GetStorage();

  final _isLogin = false.obs;
  final _token = ''.obs;
  final _mobileNumber = ''.obs;

  init() async {
    _isLogin.value = box.read(isLogInString) ?? false;
    print("loginValue --->${_isLogin.value}");
    _token.value = box.read(tokenString) ?? '';
    _mobileNumber.value = box.read(mobileNumberString) ?? '';
   // _isProfileCreated.value = box.read(isProfileCreatedString)??false;
  }

  get isLogin => _isLogin.value;
  get token => _token.value;
  get mobileNumber => _mobileNumber.value;
 final _isProfileCreated = false.obs;
  get isProfileCreated => _isProfileCreated;

  void setIsProfileCreated(bool value){
    _isProfileCreated.value = value;
    // setPref(isProfileCreatedString, value);
  }
  void setIsLogin(bool value) {
    _isLogin.value = value;
    setPref(isLogInString, value);
  }

  void setUserToken(String value) {
    _token.value = value;
    update();
    setPref(tokenString, value);
  }

  void setMobileNumber(String value) {
    _mobileNumber.value = value;
    setPref(mobileNumberString, value);
  }

  void setPref(String key, dynamic value) async {
    await box.write(key, value);
  }

  getPref(String key) async {
    await box.read(key);
  }

  void logOut() async {
    await box.erase();

    setIsLogin(false);
    Get.toNamed(
      '/authentication',
    );

  }
}
