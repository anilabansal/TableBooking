import 'package:booking_table/controller/notification_screen/notification_screen_controller.dart';
import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget {
  NotificationView({Key? key}) : super(key: key);

  NotificationScreenController controller =
      Get.put(NotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(text: 'Notifications'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Container(
              height: 87,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: 'Settings',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      FlutterSwitch(
                        width: 31.0,
                        height: 16.0,
                        valueFontSize: 0.0,
                        toggleSize: 10.0, inactiveColor: Color(0xFFD9D9D9),

                        value: controller.isOpen.value,
                        borderRadius: 00.0,
                        // padding: 8.0,
                        showOnOff: false,
                        onToggle: (val) {
                          controller.toggleSwitch(val);
                          print(val);
                        },
                      ),
                    ],
                  ),
                  CommonSizedBox(
                    height: 11,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 15,
                      ),
                      CommonSizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: CommonText(
                          text:
                              'You can make your toggle on/off for getting notifications',
                          color: textLight868686,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              width: Get.width,
              color: whiteE5E5E5,
            ),
            CommonSizedBox(
              height: 20,
            ),
            const NotificationWidget(),
            const NotificationWidget(),
            const NotificationWidget(),
          ],
        ),
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonSizedBox(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommonText(
            fontSize: 14,
            text: '22 July, 2022',
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w400,
          ),
          CommonSizedBox(
            height: 15,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 48,
                  alignment: Alignment.topCenter,
                  width: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCE9E9),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.paste,
                      color: redE2211C,
                    ),
                  ),
                ),
                CommonSizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                                text: '@Josh Cafe ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: redE2211C,
                                    fontSize: 16)),
                            TextSpan(
                              text: 'confirmed your booking for 23 july, 2022',
                              style: const TextStyle(
                                color: black040404,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // TODO : TERMS & CONDITIONS
                                },
                            ),
                          ],
                        ),
                      ),
                      CommonSizedBox(
                        height: 6,
                      ),
                      CommonText(
                        fontSize: 12,
                        text: '3 Min Ago',
                        fontWeight: FontWeight.w400,
                      ),
                      CommonSizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
