import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/common/widgets_methods/progress_loader.dart';
import '/controller/profile/profile_controller.dart';
import '/utils/common/toast_message.dart';
import '/utils/common/widgets_methods/common_button.dart';
import '/utils/common/widgets_methods/common_date_picker_widget.dart';
import '/utils/common/widgets_methods/common_phone_field.dart';
import '/utils/common/widgets_methods/common_text.dart';
import '/utils/common/widgets_methods/common_text_form_field.dart';
import '/utils/extensions/capitalization_strings.dart';
import '../../../utils/common/common_strings.dart';
import '../../../utils/common/widgets_methods/image_picker.dart';

class EditProfileScreenBody extends StatelessWidget {
  final String callFrom;
  final String mobileNumber;
  final ProfileController profileController;
  const EditProfileScreenBody({
    required this.callFrom,
    required this.mobileNumber,
    Key? key,
    required this.profileController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Obx(
      () => Column(
        children: [
          callFrom == 'Create Profile'
              ? SizedBox(
                  // height: 200,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Image.asset(createProfileBackGroundImage),
                          SizedBox(
                            width: Get.width,
                            height: 50,
                          ),
                        ],
                      ),
                      Positioned(
                        //alignment: Alignment.bottomCenter,
                        bottom: 0,
                        left: MediaQuery.of(context).size.width * 0.3,
                        right: MediaQuery.of(context).size.width * 0.3,
                        top: 60,
                        child: Container(
                          margin: const EdgeInsets.only(top: 25),
                          width: 123,
                          height: 123,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 10, color: white)),
                          child: Container(
                            width: 105,
                            height: 103,
                            color: red26E2211C,
                            child: profileController
                                        .createProfileImage.value.path !=
                                    ""
                                ? Image.file(
                                    profileController.createProfileImage.value,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(
                                    Icons.person,
                                    size: 70,
                                    color: red4DE2211C,
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Center(
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
          InkWell(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              Future(
                () => showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return const ImagePickerBottomSheet();
                    }).then((value) {
                  profileController.createProfileImage.value = value.file;
                }),
              );
            },
            child: Center(
              child: CommonText(
                text: callFrom == 'Create Profile'
                    ? "Upload Photo"
                    : "Change Photo",
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: redE2211C,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 20, 30, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                // const CommonTextField(
                //   hint: "Chaire",
                // ),
                CommonTextFormField(
                  hintText: "Enter Your First name".toTitleCase(),
                  filled: true,
                  fillColor: greyF4F4F4,
                  controller: profileController.firstNameController,
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
                // const CommonTextField(
                //   hint: "Fiona",
                // ),
                CommonTextFormField(
                  hintText: "Enter your Last name".toTitleCase(),
                  filled: true,
                  fillColor: greyF4F4F4,
                  controller: profileController.lastNameController,
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
                PhoneField(
                  isCreateProfile: true,
                  enable: false,
                  phoneController: profileController.mobileNumberControllerNew,
                  // phoneController: profileController
                  // .mobileNumberController,
                  countryCode: profileController.countryCode.value,
                  countryFlag: profileController.countryFlag.value,
                  // onCountryFlag: (value) {
                  //   //   print('Country flag ---> ${value}');
                  //   profileController.countryFlag.value = value;
                  // },
                  // onCodeChange: (value) {
                  //   profileController.countryCode.value = value;
                  // },
                  textFieldColor: greyF4F4F4,
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
                CommonDatePicker(
                  //enable: false,
                  controller: profileController.dateController,
                ),
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
                // const CommonTextField(
                //   hint: "23050 W Rd",
                // ),
                CommonTextFormField(
                  hintText: "enter your street address".toTitleCase(),
                  filled: true,
                  fillColor: greyF4F4F4,
                  controller: profileController.streetAddressController,
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
                // const CommonTextField(
                //   hint: "Brownstone Twp",
                // ),
                CommonTextFormField(
                  hintText: "enter your city".toTitleCase(),
                  filled: true,
                  fillColor: greyF4F4F4,
                  controller: profileController.cityController,
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
                // const CommonTextField(
                //   hint: "Michigan",
                // ),
                CommonTextFormField(
                  hintText: "enter your state".toTitleCase(),
                  filled: true,
                  fillColor: greyF4F4F4,
                  controller: profileController.stateController,
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
                // const CommonTextField(
                //   hint: "48183",
                // ),
                CommonTextFormField(
                  hintText: "enter your zipcode".toTitleCase(),
                  filled: true,
                  fillColor: greyF4F4F4,
                  controller: profileController.zipCodeController,
                ),
                const SizedBox(
                  height: 30,
                ),
                callFrom == 'Create Profile'
                    ? CommonButton(
                        onTap: () async {
                          print(
                              'button clicked----->${profileController.dateController.text}');
                          if (validateFields() != "") {
                            ShowToast.show(
                              msg: validateFields(),
                              isError: true,
                            );
                            return;
                          }
                          ProgressDialog.showProgressDialog(context);
                          profileController.isLoading.value = true;
                          await profileController.createProfile(
                              body: {
                                'FirstName': profileController
                                    .firstNameController.text
                                    .trim(),
                                'LastName': profileController
                                    .lastNameController.text
                                    .trim(),
                                'Email': '',
                                'MobileNo': profileController
                                    .mobileNumberController.value.text
                                    .trim(),
                                'Address': profileController
                                    .streetAddressController.text
                                    .trim(),
                                'DeviceToken': '',
                                'DeviceType':
                                    GetPlatform.isAndroid ? "Android" : "iOS",
                                'DateofBirth':
                                    //'2020-11-02',
                                    profileController.dateController.text,
                                'City': profileController.cityController.text
                                    .trim(),
                                'State': profileController.stateController.text
                                    .trim(),
                                'ZipCode':
                                    profileController.zipCodeController.text,
                                'AuthenticationId': '',
                                'AuthenticationType': ''
                              },
                              //  endPoint: createProfileEndPoint,
                              // filename: "ProfilePic",
                              imageFile: profileController
                                  .createProfileImage.value).then(
                            (value) {
                              Navigator.pop(context);
                              if (value) {
                                profileController.isLoading.value = false;
                                print(
                                    profileController.createProfileImage.value);
                                Get.offAllNamed('/zip-code');

                                // showtoast
                              }
                            },
                          );
                          // Get.toNamed('/zip-code');
                        },
                        text: "Proceed",
                        bgColor: redE2211C,
                        textColor: white,
                      )
                    : CommonButton(
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
        ],
      ),
    ));
  }

  /// validateFields
  validateFields() {
    if (profileController.firstNameController.text.trim().isEmpty) {
      return 'please enter your first name!'.toTitleCase();
    } else if (profileController.lastNameController.value.text.trim().isEmpty) {
      return 'please enter your last name!'.toTitleCase();
    } else if (profileController.mobileNumberController.value.text
        .trim()
        .isEmpty) {
      return 'please enter your mobile Number!'.toTitleCase();
    } else if (profileController.dateController.value.text.isEmpty) {
      return 'please select date!'.toTitleCase();
    } else if (profileController.streetAddressController.value.text
        .trim()
        .isEmpty) {
      return 'please enter your Street Address!'.toTitleCase();
    } else if (profileController.cityController.value.text.trim().isEmpty) {
      return 'please enter your city!'.toTitleCase();
    } else if (profileController.stateController.value.text.trim().isEmpty) {
      return 'please enter your state!'.toTitleCase();
    } else if (profileController.zipCodeController.value.text.trim().isEmpty) {
      return 'please enter your zip code!'.toTitleCase();
    } else if (profileController.createProfileImage.value.path.isEmpty) {
      return 'please upload profile image'.toTitleCase();
    }
    return '';
  }
}
