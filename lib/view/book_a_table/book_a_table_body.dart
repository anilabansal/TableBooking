import 'package:booking_table/controller/book_a_table/book_a_table_controller.dart';
import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/utils/common/widgets_methods/common_textformfield.dart';
import 'package:booking_table/utils/common/widgets_methods/restaurant_name_distance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:get/get.dart';

class BookATableBody extends StatelessWidget {
  BookATableBody({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(BookATableController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CommonRestaurantNameDistance(),
        Container(
          width: Get.width,
          height: 1,
          color: whiteE5E5E5,
        ).paddingOnly(
          top: 30,
          bottom: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date
            CommonText(
              text: 'Date',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            CommonSizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                await controller.selectDate();
                print('Button Clicked');
              },
              child: CommonTextFormField(
                enable: false,
                controller: controller.bookingDate,
                suffixIcon: const Icon(
                  Icons.calendar_month,
                  color: Colors.red,
                ),
                color: whiteF5F5F5,
              ),
            ),
            Container(
              width: Get.width,
              height: 1,
              color: whiteE5E5E5,
            ).paddingOnly(
              top: 20,
              bottom: 20,
            ),
            // Time
            CommonText(
              text: 'Time',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            CommonSizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                await controller.selectTime();
                print('Button Clicked');
              },
              child: CommonTextFormField(
                enable: false,
                controller: controller.bookingTime,
                color: whiteF5F5F5,
              ),
            ),
            Container(
              width: Get.width,
              height: 1,
              color: whiteE5E5E5,
            ).paddingOnly(
              top: 20,
              bottom: 20,
            ),
            // Party SIze
            CommonText(
              text: 'Party Size',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            CommonSizedBox(
              height: 20,
            ),
            CommonTextFormField(
              controller: controller.partySize,
              color: whiteF5F5F5,
              keyboardType: TextInputType.number,
              maxLength: 2,
            ),
            Container(
              width: Get.width,
              height: 1,
              color: whiteE5E5E5,
            ).paddingOnly(
              top: 20,
              bottom: 20,
            ),
            //  Field Four
            CommonText(
              text: 'Types of Services',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            CommonSizedBox(
              height: 20,
            ),
            Center(
              child: Obx(
                () => FlutterToggleTab(
                  height: 37,
                  width: 75,
                  borderRadius: 5,
                  // marginSelected: const EdgeInsets.only(left: 10, right: 10),
                  selectedIndex: controller.selectTypeOfService.value,
                  selectedBackgroundColors: const [Colors.black],
                  selectedTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  unSelectedTextStyle: const TextStyle(
                      color: textLight868686,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  labels: controller.listOfServices,
                  selectedLabelIndex: (index) =>
                      controller.selectService(index),
                  isScroll: false,
                ),
              ),
            ),
            CommonSizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                CommonSizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CommonText(
                    text:
                        'Pre-Order your food and drink and still have a server in restaurant',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: textLight868686,
                  ),
                ),
              ],
            ),
            CommonSizedBox(
              height: 31,
            ),
            // Button
            CommonButton(
              textColor: Colors.white,
              bgColor: redE2211C,
              text: 'Proceed',
            ),
            CommonSizedBox(
              height: 31,
            ),
          ],
        ).paddingOnly(
          left: 20,
          right: 24,
        ),
      ],
    );
  }
}
