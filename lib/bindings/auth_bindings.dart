import 'package:booking_table/controller/authentication/login_controller.dart';
import 'package:booking_table/controller/authentication/otp_controller.dart';
import 'package:booking_table/controller/authentication/register_controller.dart';
import 'package:booking_table/controller/profile/profile_controller.dart';
import 'package:booking_table/controller/splash_screen/splash_view_controller.dart';
import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:get/get.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(UserSessionController());
    Get.lazyPut<SplashViewController>(() => SplashViewController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<OtpController>(() => OtpController());
    Get.put(ProfileController());
  }
}
