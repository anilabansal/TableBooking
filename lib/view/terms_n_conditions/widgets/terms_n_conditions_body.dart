import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../controller/home/home_controller.dart';
import '../../../utils/common/common_strings.dart';

class TermsNConditionBody extends StatelessWidget {
  TermsNConditionBody({
    Key? key,
  }) : super(key: key);
  // final Completer<WebViewController> _controller =
  //     Completer<WebViewController>();
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Stack(
          children: [
            WebView(
              initialUrl: termsAndConditionUrl,
              // onWebViewCreated: (WebViewController webViewController) {
              //   _controller.complete(webViewController);
              // },
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
