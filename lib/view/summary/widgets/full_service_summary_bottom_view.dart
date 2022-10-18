import 'package:booking_table/controller/summary/summary_controller.dart';
import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/images_string.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/utils/common/widgets_methods/common_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:get/get.dart';

class FullSummaryBottomView extends StatelessWidget {
  FullSummaryBottomView({
    Key? key,
  }) : super(key: key);
  SummaryController controller = Get.put(SummaryController());

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
        // Payment Method
        ChoosePaymentMethodWidget(),
        Container(
          margin: const EdgeInsets.only(bottom: 18.0, top: 26.0),
          height: 1,
          width: Get.width,
          color: textLight868686,
        ),
        // ADD A TIP
        AddATipWidget(controller: controller),
        CommonButton(
          text: 'Confirm Booking',
          textColor: Colors.white,
          bgColor: redE2211C,
        ).paddingOnly(left: 20, right: 20),
        CommonSizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class ChoosePaymentMethodWidget extends StatelessWidget {
  const ChoosePaymentMethodWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 32,
                width: 97,
                decoration: BoxDecoration(
                    color: whiteF8F8F8, borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      venmoLogo,
                      height: 16,
                      width: 16,
                    ),
                    CommonSizedBox(
                      width: 10,
                    ),
                    CommonText(
                      text: 'Venmo',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: textLight868686,
                    ),
                  ],
                ),
              ),
              Container(
                height: 32,
                width: 82,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      appleLogo,
                      height: 15,
                      width: 13,
                    ),
                    CommonSizedBox(
                      width: 10,
                    ),
                    CommonText(
                      text: 'Apple',
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                height: 32,
                width: 97,
                decoration: BoxDecoration(
                    color: whiteF8F8F8, borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      gPayLogo,
                      height: 15,
                      width: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
          CommonSizedBox(
            height: 18,
          ),
          Container(
            height: 32,
            width: 137,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: whiteF8F8F8, borderRadius: BorderRadius.circular(4)),
            child: CommonText(
              textAlign: TextAlign.center,
              text: 'Pay At Restaurant',
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: textLight868686,
            ),
          ),
        ],
      ),
    );
  }
}

class AddATipWidget extends StatelessWidget {
  const AddATipWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SummaryController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Center(
            child: Obx(
              () => FlutterToggleTab(
                height: 37,
                width: 75,
                borderRadius: 5,
                // marginSelected: const EdgeInsets.only(left: 10, right: 10),
                selectedIndex: controller.selectTipPrice.value,
                selectedBackgroundColors: const [Colors.black],
                selectedTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
                unSelectedTextStyle: const TextStyle(
                    color: textLight868686,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
                labels: controller.listOfTipPrice,
                selectedLabelIndex: (index) => controller.selectTipPrice(index),
                isScroll: false,
              ),
            ),
          ),
          CommonSizedBox(
            height: 15,
          ),
          CommonTextFormField(
            hintText: 'Enter Amount',
            fillColor: whiteF5F5F5,
            filled: true,
          ),
          CommonSizedBox(
            height: 41,
          ),
        ],
      ),
    );
  }
}
