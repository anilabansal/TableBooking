import 'package:get/get.dart';

class LoginController extends GetxController {
  // toHome() => Get.toNamed(RouteName.home);
  // toUserDetailsPage() => Get.toNamed(RouteName.loginOTP);
  static final LoginController loginController = LoginController._internal();
  factory LoginController() {
    return loginController;
  }
  LoginController._internal();
}
