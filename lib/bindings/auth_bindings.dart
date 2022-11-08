import 'package:booking_table/controller/authentication/login_controller.dart';
import 'package:booking_table/controller/authentication/otp_controller.dart';
import 'package:booking_table/controller/authentication/register_controller.dart';
import 'package:booking_table/controller/splash_screen/splash_view_controller.dart';
import 'package:country_phone_code_picker/controller/country_controller.dart';
import 'package:get/get.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<SplashViewController>(() => SplashViewController());
    Get.lazyPut<CountryController>(() => CountryController());
    Get.lazyPut<OtpController>(() => OtpController());

  }
}
