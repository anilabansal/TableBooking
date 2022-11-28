import 'package:booking_table/controller/profile/profile_controller.dart';
import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:get/get.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserSessionController>(
      () => UserSessionController(),
    );
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
