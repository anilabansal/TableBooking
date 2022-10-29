import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/profile/profile_controller.dart';
import '../../utils/common/common_text_field.dart';
import '../../utils/common/widgets_methods/app_bar_back_button.dart';
import '../../utils/common/widgets_methods/common_phone_field.dart';
import '../../utils/common/widgets_methods/common_text.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: appBarCommon(text: "Edit Details"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0,20,30,30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stack(
              //   children: [
              //     const AppBarBackButton(),
              //     Center(
              //       child: CommonText(
              //         text: "Edit Details",
              //         fontWeight: FontWeight.w600,
              //         fontSize: 22,
              //         color: black000000,
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(
              //   height: 45,
              // ),
              Center(
                child: Container(
                  width: 105,
                  height: 105,
                  decoration: BoxDecoration(
                      border: Border.all(width: 9, color: white),
                      borderRadius: BorderRadius.circular(3.0),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 9,
                            offset: Offset(0, 4),
                            color: Color.fromRGBO(192, 192, 192, 0.25))
                      ],
                      image: const DecorationImage(
                        image: AssetImage(
                            "assets/images/profile/edit_profile_image.png"),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: CommonText(
                  text: "Change Photo",
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: redE2211C,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CommonText(
                text: "First Name",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: black040404,
              ),
              const SizedBox(
                height: 5.7,
              ),
              const CommonTextField(
                hint: "Chaire",
              ),
              const SizedBox(
                height: 20,
              ),
              CommonText(
                text: "Last Name",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: black040404,
              ),
              const SizedBox(
                height: 5.7,
              ),
              const CommonTextField(
                hint: "Fiona",
              ),
              const SizedBox(
                height: 20,
              ),
              CommonText(
                text: "Mobile Number",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: black040404,
              ),
              const SizedBox(
                height: 5.7,
              ),
              // const CommonTextField(
              //   hint: "23050 W Rd",
              // ),
              Obx(
                () => PhoneField(
                  countryCode: profileController.countryCode.value,
                  countryFlag: profileController.countryFlag.value,
                  onCountryFlag: (value) {
                    //   print('Country flag ---> ${value}');
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
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: black040404,
              ),
              const SizedBox(
                height: 5.7,
              ),
              const CommonDatePicker(),
              const SizedBox(
                height: 20,
              ),
              CommonText(
                text: "Street Address",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: black040404,
              ),
              const SizedBox(
                height: 5.7,
              ),
              const CommonTextField(
                hint: "23050 W Rd",
              ),
              const SizedBox(
                height: 20,
              ),
              CommonText(
                text: "City",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: black040404,
              ),
              const SizedBox(
                height: 5.7,
              ),
              const CommonTextField(
                hint: "Brownstone Twp",
              ),
              const SizedBox(
                height: 20,
              ),
              CommonText(
                text: "State",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: black040404,
              ),
              const SizedBox(
                height: 5.7,
              ),
              const CommonTextField(
                hint: "Michigan",
              ),
              const SizedBox(
                height: 20,
              ),
              CommonText(
                text: "State",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: black040404,
              ),
              const SizedBox(
                height: 5.7,
              ),
              const CommonTextField(
                hint: "Michigan",
              ),
              const SizedBox(
                height: 20,
              ),
              CommonText(
                text: "Zipcode",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: black040404,
              ),
              const SizedBox(
                height: 5.7,
              ),
              const CommonTextField(
                hint: "48183",
              ),
              const SizedBox(
                height: 30,
              ),
              CommonButton(
                onTap: () {
                  Get.back();
                },
                text: "Save Changes",
                bgColor: redE2211C,
                textColor: white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
