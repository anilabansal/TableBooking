import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/profile/profile_controller.dart';
import '../../utils/common/common_colors.dart';
import '../../utils/common/images_string.dart';
import '../../utils/common/widgets_methods/common_date_picker_widget.dart';
import '../../utils/common/widgets_methods/common_phone_field.dart';
import '../../utils/common/widgets_methods/common_text_form_field.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      fontWeight: FontWeight.w400,
                    ),
                    // const CommonTextField(
                    //   hint: "Enter First Name",
                    // ),
                    const SizedBox(
                      height: 5,
                    ),
                    CommonTextFormField(
                      hintText: "Enter First Name",
                      filled: true,
                      fillColor: greyF4F4F4,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
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
                    const SizedBox(
                      height: 5,
                    ),
                    // const CommonTextField(
                    //   hint: "Enter Last Name",
                    // ),
                    CommonTextFormField(
                      hintText: "Enter Last Name",
                      filled: true,
                      fillColor: greyF4F4F4,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonText(
                      text: "Mobile Number",
                      color: black040404,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // const CommonTextField(
                    //   hint: "Enter Mobile Number",
                    // ),
                    Obx(
                      () => PhoneField(
                        textFieldColor: greyF4F4F4,
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
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const CommonDatePicker(
                      fillColor: greyF4F4F4,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonText(
                      text: "Street Address",
                      color: black040404,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // const CommonTextField(),
                    CommonTextFormField(
                      filled: true,
                      fillColor: greyF4F4F4,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonText(
                      text: "City",
                      color: black040404,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // const CommonTextField(),
                    CommonTextFormField(
                      filled: true,
                      fillColor: greyF4F4F4,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonText(
                      text: "State",
                      color: black040404,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // const CommonTextField(),
                    CommonTextFormField(
                      filled: true,
                      fillColor: greyF4F4F4,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonText(
                      text: "Zipcode",
                      color: black040404,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // const CommonTextField(),
                    CommonTextFormField(
                      filled: true,
                      fillColor: greyF4F4F4,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
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
      ),
    );
  }
}
