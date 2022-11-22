import 'package:booking_table/bindings/auth_bindings.dart';
import 'package:booking_table/controller/home/home_controller.dart';
import 'package:booking_table/controller/profile/profile_controller.dart';
import 'package:booking_table/controller/restaurant_details/restaurant_details_controller.dart';
import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<UserSessionController>(
      () => UserSessionController(),
    );
    AuthBindings();

    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<RestaurantDetailsController>(
        () => RestaurantDetailsController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
