import 'package:get/get.dart';

class AuthViewController extends GetxController {
  static final AuthViewController authViewController =
      AuthViewController._internal();
  factory AuthViewController() {
    return authViewController;
  }
  AuthViewController._internal();
  var pinOutPut = ''.obs;
  // var selectedCountry = 'USA'.obs;
  // var countryCode = 'USA'.obs;
  // var phoneCode = '+1'.obs;
  // CountryController countryController = CountryController();
  // late Country selectedCountry;
  // var selectedCountry = ''.obs;
  //  updateSelectedCountry( country) {
  //   selectedCountry = country;
  //   update();
  // }
  // toLogin() => Get.toNamed(RouteName.login);
  // toRegister() => Get.toNamed(RouteName.register);
  // toHome() => Get.toNamed(RouteName.home);

}
