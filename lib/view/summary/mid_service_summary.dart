import 'package:booking_table/controller/summary/summary_controller.dart';
import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/utils/common/widgets_methods/common_textformfield.dart';
import 'package:booking_table/utils/common/widgets_methods/restaurant_name_distance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceSummaryView extends StatelessWidget {
  String callFrom;
  ServiceSummaryView({
    required this.callFrom,
    Key? key,
  }) : super(key: key);

  SummaryController controller = Get.put(SummaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommon(text: "Summary"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SummaryTopView(),
            CommonSizedBox(height: 21),
            SummaryBookingDetailsView(),
            Container(
              margin: const EdgeInsets.only(bottom: 18.0, top: 26.0),
              height: 1,
              width: Get.width * 0.9,
              color: textLight868686,
            ),
            SummaryBottomView(),
          ],
        ),
      ),
    );
  }
}

class SummaryBottomView extends StatelessWidget {
  const SummaryBottomView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                textAlign: TextAlign.left,
                text: 'Special Event',
                color: black000000,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              CommonSizedBox(
                height: 20,
              ),
              CommonTextFormField(
                fillColor: whiteF5F5F5,
                filled: true,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 18.0, top: 26.0),
          height: 1,
          width: Get.width,
          color: textLight868686,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                textAlign: TextAlign.left,
                text: 'Allergies/Special Requests',
                color: black000000,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              CommonSizedBox(
                height: 20,
              ),
              CommonTextFormField(
                fillColor: whiteF5F5F5,
                filled: true,
                hintText: 'Type Here...',
                color: textLight868686,
                fontSize: 18,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 18.0, top: 26.0),
          height: 1,
          width: Get.width,
          color: textLight868686,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                textAlign: TextAlign.left,
                text: 'Select Payment Mode',
                color: black000000,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              CommonSizedBox(
                height: 20,
              ),
              Row(
                children: [],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 18.0, top: 26.0),
          height: 1,
          width: Get.width,
          color: textLight868686,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                textAlign: TextAlign.left,
                text: 'Add Tip',
                color: black000000,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              CommonSizedBox(
                height: 20,
              ),
              Row(
                children: [],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SummaryBookingDetailsView extends StatelessWidget {
  const SummaryBookingDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: whiteF2F2F2,
      collapsedBackgroundColor: whiteF2F2F2,
      title: CommonText(
        text: 'Booking Details',
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: 'Date',
                        color: textLight868686,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      CommonSizedBox(
                        height: 5,
                      ),
                      CommonText(
                        color: black000000,
                        text: '24 may, 2022',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: 'Date',
                        color: textLight868686,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      CommonSizedBox(
                        height: 5,
                      ),
                      CommonText(
                        color: black000000,
                        text: '24 may, 2022',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
              CommonSizedBox(
                height: 25,
              ),
              CommonText(
                text: 'Party Size',
                color: textLight868686,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              CommonSizedBox(
                height: 5,
              ),
              CommonText(
                color: black000000,
                text: '5 Members',
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              CommonSizedBox(
                height: 25,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            bottom: 20.0,
          ),
          height: 1,
          width: Get.width * 0.9,
          color: textLight868686,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: 'Service Type',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              CommonSizedBox(
                height: 20,
              ),
              CommonText(
                text: 'Mid Service',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: redE2211C,
              ),
              CommonSizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: 'Pre-Order',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: black000000,
                  ),
                  SizedBox(
                    height: 40,
                    width: 100,
                    child: CommonButton(
                      text: 'Place Order',
                      bgColor: redF2E6E6,
                      fontSize: 14,
                      textColor: redE2211C,
                    ),
                  ),
                ],
              ),
              CommonSizedBox(
                height: 28,
              ),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  height: 33,
                  width: 181,
                  decoration: BoxDecoration(
                    color: black000000,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 16,
                      ),
                      CommonSizedBox(
                        width: 9,
                      ),
                      CommonText(
                        text: 'Edit Your Booking',
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ).paddingOnly(bottom: 21),
            ],
          ),
        ),
      ],
    );
  }
}

class SummaryTopView extends StatelessWidget {
  const SummaryTopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CommonRestaurantNameDistance();
  }
}
