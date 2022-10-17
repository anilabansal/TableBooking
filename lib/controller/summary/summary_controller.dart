import 'package:get/get.dart';

class SummaryController extends GetxController {
  var isOpen = false.obs;

  toggleTile(val) {
    isOpen.value != val;
  }
}
