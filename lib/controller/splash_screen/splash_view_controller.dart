// ignore_for_file: file_names

import 'package:booking_table/controller/profile/profile_controller.dart';
import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:get/get.dart';

class SplashViewController extends GetxController {
  UserSessionController controller = Get.find();
  ProfileController profileController = Get.find();

  @override
  void onInit() async {
    // TODO: implement onInit
    await controller.init();
    print('Splash Screen Init');
    print(controller.isLogin);
    super.onInit();
  }

  @override
  void onReady() {
    splashInit();
    super.onReady();
  }

  Future<void> splashInit() async {
    await Future.delayed(const Duration(seconds: 3));
    if (controller.isLogin) {
      await Get.offAllNamed('/zip-code');
      // if (controller.isProfileCreated) {
      //   // await Get.offAllNamed('/home');
      //   await Get.offAllNamed('/zip-code');
      // }
      // else {
      //   Get.offAllNamed('/create-profile');
      // }
      // Get.offAllNamed('/authentication');
    } else {
      Get.offAllNamed('/authentication');
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    print('Splash Screen Close');
    super.onClose();
  }
}
