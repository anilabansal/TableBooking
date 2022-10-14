import 'package:booking_table/routes/route_name.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  toHome() => Get.toNamed(RouteName.home);
  toUserDetailsPage() => Get.toNamed(RouteName.loginOTP);
}
