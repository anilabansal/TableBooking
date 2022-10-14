import 'package:booking_table/routes/route_name.dart';
import 'package:get/get.dart';

class AuthViewController extends GetxController {
  toLogin() => Get.toNamed(RouteName.login);
  toRegister() => Get.toNamed(RouteName.register);
  toHome() => Get.toNamed(RouteName.home);
}
