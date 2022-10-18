import 'package:booking_table/controller/service_type/pre_order_controller.dart';
import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/images_string.dart';
import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/utils/common/widgets_methods/restaurant_name_distance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreOrderView extends StatelessWidget {
  PreOrderView({Key? key}) : super(key: key);

  PreOrderController controller = Get.put(PreOrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommon(text: 'Pre Order'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonRestaurantNameDistance(),
            Container(
              margin: const EdgeInsets.only(bottom: 18.0, top: 26.0),
              height: 1,
              width: Get.width,
              color: textLight868686,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonText(
                    text: 'Menu',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  CommonSizedBox(
                    height: 10,
                  ),
                  CommonText(
                    text: 'Popular Items',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  CommonSizedBox(
                    height: 20,
                  ),
                  CommonSizedBox(
                    height: 12,
                  ),
                  PopularItemsIwdgets(controller: controller),
                  CommonSizedBox(
                    height: 10,
                  ),
                  CommonText(
                    text: 'Main Course',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  CommonSizedBox(
                    height: 20,
                  ),
                  MainCourseItemsIwdgets(controller: controller),
                ],
              ),
            ),
            Container(
              height: 50,
              width: Get.width,
              color: redE2211C,
              margin: const EdgeInsets.only(
                top: 30,
                bottom: 30,
                right: 20,
                left: 20,
              ),
              child: CommonButton(
                text: 'Add',
                bgColor: redE2211C,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopularItemsIwdgets extends StatelessWidget {
  const PopularItemsIwdgets({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PreOrderController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        bookATableImage,
                        height: 49,
                        width: 64,
                        fit: BoxFit.cover,
                      ),
                      CommonSizedBox(
                        height: 4,
                      ),
                      Container(
                        color: textLight868686,
                        height: 22,
                        width: 64,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  controller.decrement();
                                },
                                child: Container(
                                    color: Colors.black,
                                    height: 22,
                                    width: 21,
                                    alignment: Alignment.center,
                                    child: CommonText(
                                      text: '-',
                                      color: Colors.white,
                                      fontSize: 18,
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                            ),
                            Obx(() => Expanded(
                                  child: CommonText(
                                    textAlign: TextAlign.center,
                                    text: controller.count.value.toString(),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  controller.increment();
                                },
                                child: Container(
                                  color: Colors.black,
                                  height: 22,
                                  width: 21,
                                  alignment: Alignment.center,
                                  child: CommonText(
                                    text: '+',
                                    color: Colors.white,
                                    fontSize: 18,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CommonSizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: 'Spicy Crunchy Chicken',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        CommonSizedBox(
                          height: 4,
                        ),
                        CommonText(
                          text:
                              'Creamy Hot Tomato Sauce, Jalapeno with Mozzarella Cheese',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        CommonSizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CommonText(
                              text: 'Price: ',
                              color: textDark3F3E3E,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            CommonText(
                              text: '\$ 45.98',
                              color: redE2211C,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              CommonSizedBox(
                height: 31,
              ),
            ],
          );
        });
  }
}

class MainCourseItemsIwdgets extends StatelessWidget {
  const MainCourseItemsIwdgets({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PreOrderController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        bookATableImage,
                        height: 49,
                        width: 64,
                        fit: BoxFit.cover,
                      ),
                      CommonSizedBox(
                        height: 4,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(4)),
                        height: 22,
                        width: 64,
                        alignment: Alignment.center,
                        child: CommonText(
                          textAlign: TextAlign.center,
                          text: "Add",
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  CommonSizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: 'Spicy Crunchy Chicken',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        CommonSizedBox(
                          height: 4,
                        ),
                        CommonText(
                          text:
                              'Creamy Hot Tomato Sauce, Jalapeno with Mozzarella Cheese',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        CommonSizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CommonText(
                              text: 'Price: ',
                              color: textDark3F3E3E,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            CommonText(
                              text: '\$ 45.98',
                              color: redE2211C,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              CommonSizedBox(
                height: 31,
              ),
            ],
          );
        });
  }
}
