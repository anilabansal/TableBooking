// ignore_for_file: file_names

import 'package:booking_table/controller/user_session/user_session.dart';
import 'package:get/get.dart';

class SplashViewController extends GetxController {
  @override
  void onReady() {
    print('Splash Screen Init');
    splashInit();
    super.onReady();
  }

  Future<void> splashInit() async {
    await Future.delayed(const Duration(seconds: 2));
    if (UserSession().isLogin) {
      Get.offAllNamed('/home');
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
