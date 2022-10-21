import 'package:booking_table/controller/notification_screen/notification_screen_controller.dart';
import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/view/notifications/widgets/notification_widget.dart';
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
                        toggleSize: 10.0,
                        inactiveColor: const Color(0xFFD9D9D9),

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
