// ignore_for_file: must_be_immutable

import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../../controller/authentication/login_controller.dart';
import '../../../utils/common/widgets_methods/progress_loader.dart';

class AuthScreenViewWidget extends StatelessWidget {
  AuthScreenViewWidget({Key? key}) : super(key: key);
  LoginController loginController = Get.find();
  UserSessionController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // LOGO
        Image.asset(
          authSelectScreenLogo,
          height: 54,
          width: 143,
        ),
        CommonSizedBox(height: 26),
        // WELCOME TEXT
        CommonText(
          text: 'Welcome!',
          color: black040404,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        CommonSizedBox(height: 20),
        // SIGNIN BUTTON
        CommonButton(
          text: 'Sign In',
          bgColor: redE2211C,
          onTap: () {
            //  controller.selectedCountry.phoneCode;
            // print(
            //     "countryCode ---->${ controller.selectedCountry.phoneCode}");
            // TODO: Sign In Functionality
            Get.toNamed('/login');
          },
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
              text: 'OR',
              color: textLight868686,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
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
        CommonText(
            text: 'No Account?',
            color: textLight868686,
            fontWeight: FontWeight.w400,
            fontSize: 14),
        CommonSizedBox(height: 10),
        // REGISTER BUTTON
        CommonButton(
          onTap: () {
            Get.toNamed('/register');
          },
          text: 'Sign Up',
          bgColor: black000000,
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
              text: 'OR',
              color: textLight868686,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
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
        CommonText(
          text: 'Continue with',
          color: black000000,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        // SOCIAL SIGN IN
        CommonSizedBox(height: 15),
        _iconRow(context),
       Visibility(
         visible:GetPlatform.isIOS?true:false ,
         child: Padding(
           padding: const EdgeInsets.only(top: 15.0),
           child: Column(
             children: [
               signInApple(context)
             ],
           ),
         ),
       ),
      ],
    );
  }

  // SOCIAL SIGN IN
  Row _iconRow(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () async {
            final fb = FacebookLogin();
            final res = await fb.logIn(
              permissions: [
                FacebookPermission.publicProfile,
                FacebookPermission.email,
              ],
            );
            switch (res.status) {
              case FacebookLoginStatus.success:

                ///User Profile to get name and userid
                final profile = await fb.getUserProfile();
                print('Hello, ${profile!.name}! You ID: ${profile.userId}');
                final email = await fb.getUserEmail();
                if (email != null) print('And your email is $email');

              socialLogin(context,"Facebook",profile.userId);
                break;
              case FacebookLoginStatus.cancel:
                Fluttertoast.showToast(
                    msg: 'You have canceled. Please try again!');
                break;
            }

          },
          child: Image.asset(
            facebookLogo,
            height: 46,
            width: 70,
          ),
        ),
        CommonSizedBox(width: 20),
        InkWell(
          onTap: () async {
            print("googleSignIn");
            final GoogleSignIn _googleSignIn = GoogleSignIn(
              scopes: [
                'email',
              ],
            );
            await _googleSignIn.signIn().then(
              (value) {
                socialLogin(context,"Google",value!.id);
              },
            );
          },
          child: Image.asset(
            googleLogo,
            height: 46,
            width: 70,
          ),
        ),
        // GetPlatform.isIOS
        //     ? Row(
        //         children: [
        //           CommonSizedBox(width: 20),
        //           Image.asset(
        //             appleLogo,
        //             height: 46,
        //             width: 70,
        //           ),
        //         ],
        //       )
        //     : Container(),
        // CommonSizedBox(width: 20),
        // signInApple()
      ],
    );
  }

  signInApple(context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        //border: Border.all(color: socialBorder488192),
        color: white,
      ),
      child: SignInWithAppleButton(
        height: 46,
        //height: 40,
      //  style: SignInWithAppleButtonStyle.white,
        borderRadius: BorderRadius.circular(5.0),
        onPressed: () async {
          final credential = await SignInWithApple.getAppleIDCredential(
            scopes: [
              AppleIDAuthorizationScopes.email,
              AppleIDAuthorizationScopes.fullName,
            ],
          );
          if (credential.email == null || credential.email == '') {
            var value =
                await FlutterKeychain.get(key: "${credential.userIdentifier}");
            if (value != null) {
              print('User detail --> $value');
              String name = value.split('/').first;
              String email = value.split('/').last;
              // appleLogin(email, credential.userIdentifier, name);
              //socialLogin("Apple",credential.userIdentifier);
              print('Email - $name');
              print('Email - $email');
              //  appleLogIn(email, credential.userIdentifier);
              socialLogin(context,"Apple",credential.userIdentifier.toString());
            } else {
              //   appleLogIn(credential.email, credential.userIdentifier);
              socialLogin(context,"Apple",credential.userIdentifier.toString());
            }
          } else {
            await FlutterKeychain.put(
                key: credential.userIdentifier.toString(),
                value: "${credential.givenName}/${credential.email}");
            // appleLogIn(credential.email, credential.userIdentifier);
          socialLogin(context,"Apple",credential.userIdentifier.toString());
          }
        },
      ),
    );
  }

  socialLogin(context,String authenticationType, String authenticationId){
    ProgressDialog.showProgressDialog(context);
    loginController.authLoading.value = true;
   return loginController.socialLogin(
      body: {
        "FirstName": "",
        "LastName": "",
        "Address": "",
        "DateofBirth": "",
        "City": "",
        "State": "",
        "ZipCode": "",
        "DeviceToken": "zsfsf",
        "DeviceType": GetPlatform.isAndroid ? "Android" : "iOS",
        "AuthenticationType":authenticationType,
        "AuthenticationId": authenticationId,
      },
      endPoint: socialLogInEndPoint,
    ).then(
          (value) {
        // Get.back();
        if (value) {
          print("signIn successfully");
          loginController.authLoading.value = false;
          userController.isProfileCreated == true
              ? Get.offAllNamed('/zip-code')
              : Get.offAllNamed('/create-profile');
        }
      },
    );
  }
}
