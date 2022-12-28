import 'package:booking_table/controller/authentication/login_controller.dart';
import 'package:booking_table/controller/authentication/otp_controller.dart';
import 'package:booking_table/controller/authentication/register_controller.dart';
import 'package:booking_table/controller/location/location_controller.dart';
import 'package:booking_table/controller/profile/profile_controller.dart';
import 'package:booking_table/controller/splash_screen/splash_view_controller.dart';
import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:get/get.dart';
import '../controller/book_a_table/book_a_table_controller.dart';
import '../controller/card_details/add_card_details_controller.dart';
import '../controller/filter/filter_screen_controller.dart';
import '../controller/home/home_controller.dart';
import '../controller/restaurant_details/restaurant_details_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(UserSessionController());
    Get.lazyPut<SplashViewController>(() => SplashViewController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<OtpController>(() => OtpController());
    Get.lazyPut<AddCardDetailsController>(() => AddCardDetailsController());
    //Get.lazyPut<ProfileController>(()=>ProfileController());
    Get.lazyPut<RestaurantDetailsController>(
            () => RestaurantDetailsController());
    Get.lazyPut<HomeController>(() => HomeController());
   Get.put(ProfileController());
    Get.put(LocationController());
    Get.put(FilterViewController());
    Get.lazyPut<BookATableController>(() => BookATableController());
  }
}
