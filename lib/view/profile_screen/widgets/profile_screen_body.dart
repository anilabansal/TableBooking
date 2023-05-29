import 'dart:io';
import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:booking_table/utils/common/widgets_methods/progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utils/common/widgets_methods/date_format_widget.dart';
import '/controller/profile/profile_controller.dart';
import '/utils/common/toast_message.dart';
import '/utils/common/widgets_methods/common_button.dart';
import '/utils/common/widgets_methods/common_phone_field.dart';
import '/utils/common/widgets_methods/common_text.dart';
import '/utils/common/widgets_methods/common_text_form_field.dart';
import '/utils/extensions/capitalization_strings.dart';
import '../../../utils/common/common_strings.dart';
import '../../../utils/common/widgets_methods/image_picker.dart';

class EditProfileScreenBody extends StatefulWidget {
  final String callFrom;

  const EditProfileScreenBody({
    required this.callFrom,
    Key? key,
  }) : super(key: key);

  @override
  State<EditProfileScreenBody> createState() => _EditProfileScreenBodyState();
}

class _EditProfileScreenBodyState extends State<EditProfileScreenBody> {
  final ProfileController _profileController = Get.find();
 var data = Get.arguments;
  //  ProfileController _profileController = Get.put(ProfileController());
  final UserSessionController userSessionController = Get.find();
  var isFirstCome = false;
  // var firstNameController = TextEditingController();
  // var lastNameController = TextEditingController();
  var dateController = TextEditingController();
  var streetAddressController = TextEditingController();
  // var emailAddressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var zipCodeController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var flagController = TextEditingController();
  var countryCodeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    loadAllEditProfileData();

    super.initState();
  }

  loadAllEditProfileData() {
    _profileController.editProfileLoader.value = true;
    _profileController.getProfileDetails().then(
      (value) {
        _profileController.editProfileLoader.value = false;
        if (!isFirstCome) {
          isFirstCome = true;
          _profileController.firstNameController.text =

              _profileController.userProfileData.value.firstName!;
          _profileController.lastNameController.text =
              _profileController.userProfileData.value.lastName!;
          // dateController.text = _profileController
          //     .userProfileData.value.dateofBirth!
          //     .substring(0, 10);
          dateController.text = _profileController
              .userProfileData.value.dateofBirth!
              .convertEditProfileDateBirthToFormat();

          streetAddressController.text =
              _profileController.userProfileData.value.address!;
          _profileController.emailAddressController.text =
              _profileController.userProfileData.value.email!;
          flagController.text = _profileController.userSession.countryFlag;
          countryCodeController.text =
              _profileController.userSession.countryCode;
          cityController.text = _profileController.userProfileData.value.city!;
          stateController.text =
              _profileController.userProfileData.value.state!;
          zipCodeController.text =
              _profileController.userProfileData.value.zipCode!;
          mobileNumberController.text =
              _profileController.userSession.mobileNumber;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        child: _profileController.editProfileLoader.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: redE2211C,
                ),
              )
            : Column(
                children: [
                  widget.callFrom == 'Create Profile'
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
                                    border: Border.all(
                                      width: 10,
                                      color: white,
                                    ),
                                  ),
                                  child: Container(
                                    width: 105,
                                    height: 103,
                                    color: red26E2211C,
                                    child: _profileController.createProfileImage
                                                .value.path !=
                                            ""
                                        ? Image.file(
                                            _profileController
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
                                  color: Color.fromRGBO(
                                    192,
                                    192,
                                    192,
                                    0.25,
                                  ),
                                ),
                              ],
                            ),
                            child: _profileController
                                        .createProfileImage.value.path ==
                                    ""
                                ? _profileController.userProfileData.value
                                            .profileImage !=
                                        null
                                    ? Image.network(
                                        _profileController
                                            .userProfileData.value.profileImage
                                            .toString(),
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        "assets/images/auth/user.png",
                                        fit: BoxFit.fill,
                                      )
                                : Image.file(
                                    _profileController.createProfileImage.value,
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
                        () async {
                          await showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return const ImagePickerBottomSheet();
                              }).then(
                            (value) {
                              _profileController.createProfileImage.value =
                                  value.file;
                            },
                          );
                        },
                      );
                    },
                    child: Center(
                      child: CommonText(
                        text: widget.callFrom == 'Create Profile'
                            ? "Upload Photo (optional)"
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
                        CommonTextFormField(
                          hintText: "Enter Your First name".toTitleCase(),
                          filled: true,
                          fillColor: greyF4F4F4,
                          // controller: _profileController.firstNameController,
                          controller: _profileController.firstNameController,
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp('[a-zA-Z]'),
                            ),
                          ],
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
                          // controller: _profileController.lastNameController,
                          controller: _profileController.lastNameController,
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp('[a-zA-Z]'),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: userSessionController.isSocialLogin ||
                                  _profileController.userProfileData.value
                                          .authenticationType ==
                                      "Google" ||
                                  _profileController.userProfileData.value
                                          .authenticationType ==
                                      "Facebook" ||
                                  _profileController.userProfileData.value
                                          .authenticationType ==
                                      "Apple"
                              ? false
                              : true,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              widget.callFrom == "Create Profile"
                                  ? PhoneField(
                                      isCreateProfile: true,
                                      enable: false,
                                      phoneController: _profileController
                                          .mobileNumberControllerRegister.value,
                                      //  _profileController.mobileNumberController,

                                      // phoneController: _profileController
                                      // .mobileNumberController,
                                      countryCode:
                                          userSessionController.countryCode,
                                      countryFlag:
                                          userSessionController.countryFlag,
                                      // onCountryFlag: (value) {
                                      //   //   print('Country flag ---> ${value}');
                                      //   _profileController.countryFlag.value = value;
                                      // },
                                      // onCodeChange: (value) {
                                      //   _profileController.countryCode.value = value;
                                      // },
                                      textFieldColor: greyF4F4F4,
                                    )
                                  : PhoneField(
                                      isCreateProfile: true,
                                      enable: false,
                                      phoneController: mobileNumberController,
                                      // phoneController: _profileController
                                      //     .mobileNumberController,
                                      // phoneController: _profileController
                                      // .mobileNumberController,
                                      countryCode:
                                          userSessionController.countryCode,
                                      countryFlag:
                                          userSessionController.countryFlag,
                                      // onCountryFlag: (value) {
                                      //   //   print('Country flag ---> ${value}');
                                      //   _profileController.countryFlag.value = value;
                                      // },
                                      // onCodeChange: (value) {
                                      //   _profileController.countryCode.value = value;
                                      // },
                                      textFieldColor: greyF4F4F4,
                                    ),
                            ],
                          ),
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
                          controller: _profileController.emailAddressController,
                          keyboardType: TextInputType.emailAddress,
                          readOnly:widget.callFrom == 'Social Login'?true:false ,
                          // controller: _profileController.emailAddressController,
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
                        // CommonDatePicker(
                        //   enable: false,
                        //   controller: _profileController.dateController,
                        // ),
                        // DateInputTextField(
                        //   // controller: _profileController.dateController,
                        //   controller: dateController,
                        // ),
                        CommonTextFormField(
                          controller: dateController,
                          hintText: "mm-dd-yyyy",
                          maxLines: 1,
                          // maxLength: 1,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            DateTextFormatter(),
                          ],
                          filled: true,

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
                          keyboardType: TextInputType.text,
                          fillColor: greyF4F4F4,
                          controller: streetAddressController,
                          // controller:
                          //     _profileController.streetAddressController,
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
                          keyboardType: TextInputType.text,
                          // controller: _profileController.cityController,
                          controller: cityController,
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
                          controller: stateController,
                          keyboardType: TextInputType.text,
                          // controller: _profileController.stateController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        CommonText(
                          text: "Zip Code",
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
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          fillColor: greyF4F4F4,
                          controller: zipCodeController,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp('[0-9]'),
                            ),
                          ],
                          // controller: _profileController.zipCodeController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CommonButton(
                          onTap: () async {
                            // print(
                            //     "EMAIL VALUE ====>>> ${_profileController.emailAddressController.value.text}");
                            // print(
                            //   "Phone VALUE ====>>>                                +${userSessionController.countryCode}${_profileController.mobileNumberController.value.text.trim()}",
                            // );
                            print('button clicked');
                            if (validateFields() != "") {
                              ShowToast.show(
                                msg: validateFields(),
                                isError: true,
                              );
                              return;
                            }
                            ProgressDialog.showProgressDialog(context);
                            await _profileController.createProfile(
                              body: {
                                "FirstName": _profileController.firstNameController.text.trim(),
                                "LastName": _profileController.lastNameController.text.trim(),
                                "MobileNo": userSessionController.isSocialLogin
                                    ? ""
                                    : widget.callFrom == "Create Profile"
                                        ? "+${userSessionController.countryCode}${_profileController.mobileNumberControllerRegister.value.text.trim()}"
                                        : "+${userSessionController.countryCode}${mobileNumberController.value.text.trim()}",
                                "Address": streetAddressController.text.trim(),
                                "DateofBirth": dateController.text,
                                "City": cityController.text.trim(),
                                "Email": _profileController.emailAddressController.text.trim(),
                                "State": stateController.text.trim(),
                                "ZipCode": zipCodeController.text,
                                "AuthenticationId": "fgs",
                                "AuthenticationType": "",
                                "DeviceToken": "gdfs",
                                "DeviceType": "dfsgfgsd",
                              },
                              endPoint: widget.callFrom == "Create Profile"
                                  ? createProfileEndPoint
                                  : updateProfileDetail,
                              imageFile:
                                  _profileController.createProfileImage.value,
                            ).then(
                              (value) async {
                                if (value) {
                                  // _profileController.createProfileImage.value == "";
                                  print(_profileController
                                      .createProfileImage.value);
                                  // await _profileController.getProfileDetails();
                                  // callFrom == "Create Profile"
                                  //     ? Get.toNamed('/zip-code')
                                  //     : Get.back();
                                  if (widget.callFrom == "Create Profile"||widget.callFrom == "Social Login" &&
                                      userSessionController
                                              .saveGuestUserNavigateScreen !=
                                          'Book-now') {
                                    Get.offNamedUntil('/zip-code', (route) => false);
                                    //Get.offNamed('/zip-code');
                                  } else if (widget.callFrom ==
                                          "Create Profile" || widget.callFrom == "Social Login"&&
                                      userSessionController
                                              .saveGuestUserNavigateScreen ==
                                          'Book-now') {

                                    Get.offAllNamed(
                                      '/restaurant-details',
                                      arguments: [
                                        {"restaurantId": userSessionController.saveRestaurantId},
                                      ],
                                    );
                                  }
                                  else {
                                    // Get.offAllNamed('/home');
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  }
                                  _profileController.createProfileImage.value =
                                      File('');
                                  _profileController.firstNameController
                                      .clear();
                                  _profileController.lastNameController.clear();
                                  // _profileController
                                  //     .mobileNumberControllerRegister.value
                                  //     .clear();
                                  // _profileController.dateController.clear();
                                  // _profileController.streetAddressController
                                  //     .clear();
                                  // _profileController.cityController.clear();
                                  // _profileController.stateController.clear();
                                  // _profileController.zipCodeController.clear();
                                  // _profileController.createProfileImage.value =
                                  //     File('');
                                  _profileController.emailAddressController.clear();

                                  // showtoast
                                }
                              },
                            );
                            // Get.toNamed('/zip-code');
                          },
                          text: widget.callFrom == "Create Profile"||widget.callFrom == "Social Login"
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
    });
  }

  /// validateFields
  validateFields() {
    if (_profileController.firstNameController.text.trim().isEmpty) {
      return 'please enter your first name!'.toTitleCase();
    } else if (_profileController.lastNameController.value.text.isEmpty) {
      return 'please enter your last name!'.toTitleCase();
    } else if (!GetUtils.isEmail(_profileController.emailAddressController.value.text.trim())) {
      return 'please enter valid email!'.toTitleCase();
    }
    // else if (_profileController.dateController.value.text.isEmpty) {
    //   return 'please select date!'.toTitleCase();
    // }
    // else if(_profileController.dateController.text.toString()!= DateFormat("yyyy-MM-dd")){
    //   return "please enter valid date of birth!".toTitleCase();
    // }
    // else if (!RegExp(r"((?:19|20)[0-2][0-2])-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])")
    //     .hasMatch(_profileController.dateController.text.trim())) {
    //   return "please enter valid date of birth!".toTitleCase();
    // }
    else if (!RegExp(
            r"^(0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])[-](19|20)[0-9]{2}")
        .hasMatch(dateController.text.trim())) {
      return "please enter valid date of birth!".toTitleCase();
    }
    // else if (!RegExp(r"^\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$")
    //     .hasMatch(dateController.text.trim())) {
    //   return "please enter valid date of birth!".toTitleCase();
    // }
    else if (streetAddressController.value.text.trim().isEmpty) {
      return 'please enter your Street Address!'.toTitleCase();
    } else if (cityController.value.text.trim().isEmpty) {
      return 'please enter your city!'.toTitleCase();
    } else if (stateController.value.text.trim().isEmpty) {
      return 'please enter your state!'.toTitleCase();
    } else if (zipCodeController.value.text.trim().isEmpty) {
      return 'please enter your zip code!'.toTitleCase();
    }
    // else if (_profileController.mobileNumberController.value.text.isEmpty) {
    //   return 'please enter your mobile Number!'.toTitleCase();
    // }
    return '';
  }
}
