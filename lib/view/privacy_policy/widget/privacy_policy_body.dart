import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../controller/home/home_controller.dart';
import '../../../utils/common/common_strings.dart';

class PrivacyPolicyBody extends StatelessWidget {
  PrivacyPolicyBody({
    Key? key,
  }) : super(key: key);
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Stack(
          children: [
            WebView(
              initialUrl: privacyPolicyUrl,
              onPageFinished: (finish) {
                homeController.privacyLoading.value = false;
              },
            ),
            homeController.privacyLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: redE2211C,
                    ),
                  )
                : Stack(),
          ],
        );
      },
    );
  }
}
