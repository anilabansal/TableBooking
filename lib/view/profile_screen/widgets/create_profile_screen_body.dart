import 'package:booking_table/controller/profile/profile_controller.dart';
import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/common_text_field.dart';
import 'package:booking_table/utils/common/images_string.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_date_picker_widget.dart';
import 'package:booking_table/utils/common/widgets_methods/common_phone_field.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateProfileScreenBody extends StatelessWidget {
  const CreateProfileScreenBody({
    Key? key,
    required this.profileController,
  }) : super(key: key);

  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: MediaQuery.of(context).size.width * 0.3,
                  right: MediaQuery.of(context).size.width * 0.3,
                  child: Container(
                    width: 123,
                    height: 123,
                    decoration: BoxDecoration(
                        border: Border.all(width: 10, color: white)),
                    child: Container(
                      width: 105,
                      height: 103,
                      color: red26E2211C,
                      child: const Icon(
                        Icons.person,
                        size: 70,
                        color: red4DE2211C,
                      ),
                    ),
                  ),
                ),
                Image.asset(createProfileBackGroundImage),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: CommonText(
                text: "Upload Photo",
                decoration: TextDecoration.underline,
                color: redE2211C,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CommonText(
                    text: "First Name",
                    color: black040404,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  const CommonTextField(
                    hint: "Enter First Name",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonText(
                    text: "Last Name",
                    color: black040404,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  const CommonTextField(
                    hint: "Enter Last Name",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonText(
                    text: "Mobile Number",
                    color: black040404,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  // const CommonTextField(
                  //   hint: "Enter Mobile Number",
                  // ),
                  Obx(
                    () => PhoneField(
                      countryCode: profileController.countryCode.value,
                      countryFlag: profileController.countryFlag.value,
                      onCountryFlag: (value) {
                        profileController.countryFlag.value = value;
                      },
                      onCodeChange: (value) {
                        profileController.countryCode.value = value;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonText(
                    text: "Date of Birth",
                    color: black040404,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  const CommonDatePicker(),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonText(
                    text: "Street Address",
                    color: black040404,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  const CommonTextField(),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonText(
                    text: "City",
                    color: black040404,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  const CommonTextField(),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonText(
                    text: "State",
                    color: black040404,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  const CommonTextField(),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonText(
                    text: "Zipcode",
                    color: black040404,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  const CommonTextField(),
                  const SizedBox(
                    height: 30,
                  ),
                  CommonButton(
                    onTap: () {
                      Get.toNamed('/zip-code');
                    },
                    text: "Proceed",
                    bgColor: redE2211C,
                    textColor: white,
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
