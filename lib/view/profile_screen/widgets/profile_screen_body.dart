import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  final ProfileController profileController;
  final UserSessionController userSessionController = Get.find();

  EditProfileScreenBody({
    required this.callFrom,
    Key? key,
    required this.profileController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (profileController) {
        return SingleChildScrollView(
          child: Column(
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
                                        profileController
                                            .createProfileImage.value,
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
                          // image: DecorationImage(
                          //   image: NetworkImage(profileController
                          //       .userProfileData.value.profileImage!),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        child:
                            profileController.createProfileImage.value.path ==
                                    ""
                                ? Image.network(
                                    profileController
                                        .userProfileData.value.profileImage!,
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    profileController.createProfileImage.value,
                                    fit: BoxFit.cover,
                                  ),
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
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
                    callFrom == "Create Profile"
                        ? PhoneField(
                            isCreateProfile: true,
                            enable: false,
                            phoneController:
                                profileController.mobileNumberController,

                            // phoneController: profileController
                            // .mobileNumberController,
                            countryCode: userSessionController.countryCode,
                            countryFlag: userSessionController.countryFlag,
                            // onCountryFlag: (value) {
                            //   //   print('Country flag ---> ${value}');
                            //   profileController.countryFlag.value = value;
                            // },
                            // onCodeChange: (value) {
                            //   profileController.countryCode.value = value;
                            // },
                            textFieldColor: greyF4F4F4,
                          )
                        : PhoneField(
                            isCreateProfile: true,
                            enable: false,
                            phoneController:
                                profileController.mobileNumberController,

                            // phoneController: profileController
                            // .mobileNumberController,
                            countryCode: userSessionController.countryCode,
                            countryFlag: userSessionController.countryFlag,
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
                      text: "Email",
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
                      hintText: "enter your email address".toTitleCase(),
                      filled: true,
                      fillColor: greyF4F4F4,
                      controller: profileController.emailAddressController,
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
                      enable: false,
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
                      keyboardType: TextInputType.emailAddress,
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
                      keyboardType: TextInputType.number,
                      fillColor: greyF4F4F4,
                      controller: profileController.zipCodeController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CommonButton(
                      onTap: () async {
                        // print(
                        //     "EMAIL VALUE ====>>> ${profileController.emailAddressController.value.text}");
                        // print(
                        //   "Phone VALUE ====>>>                                +${userSessionController.countryCode}${profileController.mobileNumberController.value.text.trim()}",
                        // );
                        print('button clicked');
                        if (validateFields() != "") {
                          ShowToast.show(
                            msg: validateFields(),
                            isError: true,
                          );
                          return;
                        }
                        await profileController.createProfile(
                            body: {
                              // "userId": "19",
                              // "roleId": "3",
                              // "FirstName": "sahil",
                              // "LastName": 'Kauhsal',
                              // "Email": "ss@g.com",
                              // "MobileNo": '+917066000016',
                              // "Address": "address",
                              // "DeviceToken": "1234",
                              // "DeviceType":
                              //     GetPlatform.isAndroid ? "Android" : "iOS",
                              // "DateofBirth": "09/12/1999",
                              // "City": "city",
                              // "State": "state",
                              // "ZipCode": "zipcode",
                              // "AuthenticationId": "s",
                              // "AuthenticationType": "s",
                              "FirstName": profileController
                                  .firstNameController.text
                                  .trim(),
                              "LastName": profileController
                                  .lastNameController.text
                                  .trim(),
                              "MobileNo":
                                  "+${userSessionController.countryCode}${profileController.mobileNumberController.value.text.trim()}",
                              // "+917066000014",
                              "Address": profileController
                                  .streetAddressController.text
                                  .trim(),
                              "DateofBirth":
                                  profileController.dateController.text,
                              "City":
                                  profileController.cityController.text.trim(),
                              "Email": profileController
                                  .emailAddressController.text
                                  .trim(),
                              "State":
                                  profileController.stateController.text.trim(),
                              "ZipCode":
                                  profileController.zipCodeController.text,
                              "AuthenticationId": "fgs",
                              "AuthenticationType": "fg",
                              "DeviceToken": "gdfs",
                              "DeviceType": "dfsgfgsd",
                            },
                            endPoint: callFrom == "Create Profile"
                                ? createProfileEndPoint
                                : updateProfileDetail,
                            // filename: "ProfilePic",
                            imageFile: profileController
                                .createProfileImage.value).then(
                          (value) async {
                            if (value) {
                              print(profileController.createProfileImage.value);
                              // await profileController.getProfileDetails();
                              callFrom == "Create Profile"
                                  ? Get.toNamed('/zip-code')
                                  : null;

                              // showtoast
                            }
                          },
                        );
                        // Get.toNamed('/zip-code');
                      },
                      text: callFrom == "Create Profile"
                          ? "Proceed"
                          : "Save Changes",
                      bgColor: redE2211C,
                      textColor: white,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// validateFields
  validateFields() {
    if (profileController.firstNameController.text.isEmpty) {
      return 'please enter your first name!'.toTitleCase();
    } else if (profileController.lastNameController.value.text.isEmpty) {
      return 'please enter your last name!'.toTitleCase();
    } else if (!GetUtils.isEmail(
        profileController.emailAddressController.value.text.trim())) {
      return 'please enter valid email!'.toTitleCase();
    } else if (profileController.stateController.value.text.isEmpty) {
      return 'please enter your state!'.toTitleCase();
    } else if (profileController.cityController.value.text.isEmpty) {
      return 'please enter your city!'.toTitleCase();
    } else if (profileController.streetAddressController.value.text.isEmpty) {
      return 'please enter your Street Address!'.toTitleCase();
    } else if (profileController.dateController.value.text.isEmpty) {
      return 'please select date!'.toTitleCase();
    } else if (profileController.zipCodeController.value.text.isEmpty) {
      return 'please enter your zip code!'.toTitleCase();
    } else if (profileController.mobileNumberController.value.text.isEmpty) {
      return 'please enter your mobile Number!'.toTitleCase();
    }
    return '';
  }
}
