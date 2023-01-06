// ignore_for_file: must_be_immutable

import 'package:booking_table/controller/authentication/login_controller.dart';
import 'package:booking_table/controller/authentication/register_controller.dart';
import 'package:booking_table/controller/profile/profile_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:booking_table/utils/extensions/capitalization_strings.dart';
import 'package:booking_table/view/auth_screens/widgets/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/location/location_controller.dart';
import '../../../utils/common/widgets_methods/common_phone_field.dart';
import '../../../utils/common/widgets_methods/progress_loader.dart';

class SignInScreenBottomView extends StatelessWidget {
  LoginController loginController;
  RegisterController registerController;

  String? callFrom;

  SignInScreenBottomView({
    required this.loginController,
    required this.registerController,
    required this.callFrom,
    Key? key,
  }) : super(key: key);

  // ProfileController profileController = Get.put(ProfileController());
  ProfileController profileController = Get.find();
  LocationController locationController = Get.find();

  // AuthViewController controller = Get.put(AuthViewController());
  // Country? selectedCountry;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          // HEADER
          CommonText(
            text: callFrom == 'Login'
                ? 'Enter Mobile Number'
                : 'Create Your Free Account',
            fontSize: 24,
            color: black040404,
            fontWeight: FontWeight.w700,
          ),
          CommonSizedBox(height: 15),
          // _textFieldRow(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PhoneField(
                  phoneController: callFrom == 'Login'
                      ? loginController.mobileNumber
                      : registerController.mobileNumber,
                  countryCode: callFrom == 'Login'
                      ? loginController.countryCode.value
                      : registerController.countryCode.value,
                  countryFlag: callFrom == 'Login'
                      ? loginController.countryFlag.value
                      : registerController.countryFlag.value,
                  onCountryFlag: (value) {
                    print('Country flag ---> $value');
                    callFrom == 'Login'
                        ? loginController.countryFlag.value = value
                        : registerController.countryFlag.value = value;
                  },
                  onCodeChange: (value) {
                    callFrom == 'Login'
                        ? loginController.countryCode.value = value
                        : registerController.countryCode.value = value;
                    print('Country Code ---> $value');
                    print(
                        'Country Code Controller Value ---> ${loginController.countryCode.value}');
                  },
                  textFieldColor: red0FE2211C,
                ),
                CommonSizedBox(height: 15),
                Center(
                  child: CommonText(
                    text: 'A 4 digit code will be sent to this number.',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: textLight868686,
                    textAlign: TextAlign.center,
                  ),
                ),

                callFrom == 'Login'
                    ? CommonSizedBox(height: 40)
                    : privacyPolicyNTerms(),
                // Button
                // LOGIN/REGISTER BUTTON

                //
                // loginController.isLoading.value
                //     ? const Center(
                //         child: CircularProgressIndicator(
                //         color: redE2211C,
                //       ))
                //     :
                CommonButton(
                  onTap: () async {
                    //  loginController.isLoading.value = true;
                    if (validateFields() != '') {
                      ShowToast.show(
                        msg: validateFields(),
                        isError: true,
                      );

                      return false;
                    }
                    ProgressDialog.showProgressDialog(context);
                    loginController.isLoading.value = true;
                    callFrom == 'Login'
                        ? await loginController.loginUser(data: {
                            "MobileNumber":
                                '+${loginController.countryCode.value}${loginController.mobileNumber.text.trim()}',
                            // "MobileNumber": '+917066000016',
                            "Email": "",
                            "AuthenticationId": "",
                            "AuthenticationType": "",
                            "DeviceToken": "sdgsgsgsg",
                            "DeviceType":
                                GetPlatform.isAndroid ? "Android" : "iOS",
                            "Latitude": locationController.latLng.value.latitude
                                .toString(),
                            "Longitude": locationController
                                .latLng.value.longitude
                                .toString()
                          }).then(
                            (value) {
                              // Get.back();
                              Navigator.pop(context);
                              loginController.isLoading.value = false;
                              if (value) {
                                Get.offNamed(
                                  '/login/otp',
                                  arguments: [
                                    {
                                      'mobileNumber':
                                          '+${loginController.countryCode.value}${loginController.mobileNumber.value.text.trim()}',
                                    },
                                    {
                                      'callFrom': "Login",
                                    }
                                  ],
                                );
                                profileController.mobileNumberControllerRegister
                                    .value = loginController.mobileNumber;
                              }
                            },
                          )
                        : registerController.registerUser(data: {
                            "MobileNumber":
                                '+${registerController.countryCode.value}${registerController.mobileNumber.text.trim()}',
                            "Email": "",
                            "AuthenticationId": "",
                            "AuthenticationType": "",
                            "DeviceToken": "1234",
                            "DeviceType":
                                GetPlatform.isAndroid ? "Android" : "iOS",
                            "Latitude": locationController.latLng.value.latitude
                                .toString(),
                            "Longitude": locationController
                                .latLng.value.longitude
                                .toString()
                          }).then(
                            (value) {
                              Navigator.pop(context);
                              loginController.isLoading.value = false;
                              // Get.back();
                              if (value) {
                                Get.offNamed(
                                  '/register/otp',
                                  arguments: [
                                    {
                                      'mobileNumber':
                                          '+${registerController.countryCode.value}${registerController.mobileNumber.text.trim()}',
                                    },
                                    {
                                      'callFrom': "Register",
                                    }
                                  ],
                                );
                                profileController.mobileNumberControllerRegister
                                    .value = registerController.mobileNumber;
                              }
                            },
                          );
                  },
                  text: callFrom == 'Login' ? 'Sign In' : 'Sign Up',
                  bgColor: redE2211C,
                  textColor: Colors.white,
                ),

                CommonSizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      dividerImage,
                      width: 91,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CommonText(
                        text: 'OR', color: textLight868686, fontSize: 14),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      dividerImage,
                      width: 91,
                    ),
                  ],
                ),
                CommonSizedBox(height: 20),
                // GUEST BUTTON
                InkWell(
                  onTap: () async {
                    Get.toNamed('/zip-code');
                  },
                  child: Center(
                    child: CommonText(
                      text: 'Continue as Guest',
                      color: redE2211C,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  validateFields() {
    if (!GetUtils.isPhoneNumber(
            loginController.mobileNumber.value.text.trim()) &&
        !GetUtils.isPhoneNumber(
            registerController.mobileNumber.value.text.trim())) {
      return 'please enter a valid phone number!'.toTitleCase();
    } else if (callFrom == 'Register' &&
        registerController.isChecked == false) {
      return 'Please Accept The Terms & Conditions'.toTitleCase();
    }
    return '';
  }
}
