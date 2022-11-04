import 'package:booking_table/controller/authentication/authentication.dart';
import 'package:booking_table/controller/authentication/login_controller.dart';
import 'package:booking_table/controller/splash_screen/splash_view_controller.dart';
import 'package:country_phone_code_picker/controller/country_controller.dart';
import 'package:get/get.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<AuthenticationController>(AuthenticationController());
    Get.put<LoginController>(LoginController());
    Get.put<SplashViewController>(SplashViewController());
    Get.put<CountryController>(CountryController());
  }
}
