// ignore_for_file: file_names

import 'package:booking_table/view/auth_screens/auth_selection_view.dart';
import 'package:get/get.dart';

class SplashViewController extends GetxController {
  @override
  void onReady() {
    splashInit();
    super.onReady();
  }

  Future<void> splashInit() async {
    await Future.delayed(const Duration(seconds: 2));
    // if () {
    Get.offAll(() => const AuthSelectionView());
    // } else {
    //   Get.offAll(() => LoginView());
    // }
  }
}
