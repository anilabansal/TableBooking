import 'package:booking_table/controller/profile/profile_controller.dart';
import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';

class DrawerScreen extends StatelessWidget {
  var controller;
  UserSessionController userSessionController = Get.find();
  ProfileController profileController = Get.find();
  DrawerScreen({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Drawer(
      backgroundColor: white,
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Positioned(
            top: 10,
            right: -6,
            child: IconButton(
              onPressed: () {
                homeController.drawerKey.currentState!.closeDrawer();
              },
              icon: const Icon(
                Icons.close,
                size: 25,
                color: black000000,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    userSessionController.isLogin == false
                        ? const Icon(
                            Icons.person,
                            size: 40,
                          )
                        : profileController
                                    .userDetailsData.value.profileImage !=
                                ""
                            ? Container(
                                width: 68,
                                height: 68,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(profileController
                                                    .userDetailsData
                                                    .value
                                                    .profileImage ==
                                                ""
                                            ? profileController.userDetailsData
                                                .value.profileImage!
                                            : "https://i.picsum.photos/id/175/200/200.jpg?hmac=5rzD884Hqi9oWr_n5vg0XSc9f6yMlPotvKa8Y0cVzd4"),
                                        fit: BoxFit.cover)),
                              )
                            : Container(
                                width: 68,
                                height: 68,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(profileImage),
                                        fit: BoxFit.cover)),
                              ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: userSessionController.isLogin == false
                              ? "Guest User"
                              : "${profileController.userDetailsData.value.firstName} ${profileController.userDetailsData.value.lastName}",
                          fontFamily: proximaNovaFont,
                          fontWeight: FontWeight.w600,
                          color: black000000,
                          fontSize: 16,
                        ),
                        userSessionController.isLogin == false
                            ? Container()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: profileController
                                                .userDetailsData.value.email ==
                                            ""
                                        ? ""
                                        : profileController
                                            .userDetailsData.value.email,
                                    fontFamily: proximaNovaFont,
                                    fontWeight: FontWeight.w400,
                                    color: black000000,
                                    fontSize: 14,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await profileController
                                          .getProfileDetails()
                                          .then((value) {
                                        if (value) {
                                          Get.toNamed('/edit-profile');
                                        }
                                      });
                                    },
                                    child: CommonText(
                                      text: "Edit Profile",
                                      fontFamily: proximaNovaFont,
                                      fontWeight: FontWeight.w400,
                                      color: redE2211C,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                Image.asset(
                  lineImage,
                ),
                const SizedBox(
                  height: 13,
                ),
                iconContainer(
                    const Icon(
                      Icons.home,
                      color: redE2211C,
                    ),
                    "Home", () {
                  Get.toNamed('/home');
                  print('Home Button Clicked');
                  homeController.drawerKey.currentState!.closeDrawer();
                }),
                iconContainer(
                    const Icon(
                      Icons.favorite,
                      color: redE2211C,
                    ),
                    "Favorites", () {
                  userSessionController.isLogin == false
                      ? getXBuildDefaultDialog()
                      : Get.toNamed('/favourite');
                }),
                iconContainer(
                    const Icon(
                      Icons.book,
                      color: redE2211C,
                    ),
                    "Reservations", () {
                  userSessionController.isLogin == false
                      ? getXBuildDefaultDialog()
                      : Get.toNamed('/reservation');
                }),
                iconContainer(
                    const Icon(
                      Icons.wallet,
                      color: redE2211C,
                    ),
                    "Payment Methods", () {
                  userSessionController.isLogin == false
                      ? getXBuildDefaultDialog()
                      : Get.toNamed('/payment-method');
                }),
                iconContainer(
                    const Icon(
                      Icons.notifications,
                      color: redE2211C,
                    ),
                    "Notifications", () {
                  userSessionController.isLogin == false
                      ? getXBuildDefaultDialog()
                      : Get.toNamed('/notifications');
                }),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(lineImage),
                const SizedBox(
                  height: 30,
                ),
                textAndIcon("Terms & Conditions", () {
                  Get.toNamed('/terms-and-conditions');
                }),
                textAndIcon("Legal & About", () {
                  Get.toNamed('/privacy-policy');
                }),
                textAndIcon("Customer Support", () {
                  userSessionController.isLogin == false
                      ? getXBuildDefaultDialog()
                      : Get.toNamed('/support');
                }),
                // userSessionController.isLogin == true
                //     ?
                userSessionController.isLogin == false
                    ? Container()
                    : textAndIcon("Logout", () async {
                        // userSessionController.logOut();

                        await getXBuildDefaultDialog(callFrom: "Logout");
                      })
                // : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getXBuildDefaultDialog({callFrom}) async {
    Get.defaultDialog(
      title: callFrom == "Logout" ? "LOGOUT!" : "LOGIN!",
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      content: Column(
        children: [
          Image.asset(
            'assets/images/error.png',
            height: 80,
          ),
          CommonSizedBox(
            height: 15,
          ),
          CommonText(
            fontSize: 16,
            text: callFrom == "Logout"
                ? 'Are you sure you want to logout?'
                : "You're not logged In\nPlease login to continue..",
            textAlign: TextAlign.center,
          ),
        ],
      ),
      radius: 0010,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5.0),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: CommonButton(
                    bgColor: redE2211C,
                    text: callFrom == "Logout" ? "Confirm" : 'Login',
                    textColor: Colors.white,
                    onTap: () async {
                      callFrom == "Logout"
                          ? await userSessionController.logOut()
                          : Get.toNamed('/login');
                    },
                  ),
                ),
              ),
              CommonSizedBox(
                width: 15,
              ),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: CommonButton(
                    bgColor: redE2211C,
                    text: 'Cancel',
                    onTap: () {
                      Get.back();
                    },
                    textColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  iconContainer(icon, text, onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: greyF5F5F5),
                  child: icon,
                ),
                const SizedBox(
                  width: 12,
                ),
                CommonText(
                  text: text,
                  fontWeight: FontWeight.w400,
                  fontFamily: proximaNovaFont,
                  fontSize: 16,
                ),
                const Spacer(),
                // Image.asset(
                //   forwardArrowImage,
                //   width: 4,
                //   height: 9,
                // )
                const Icon(
                  Icons.chevron_right,
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  textAndIcon(text, onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                CommonText(
                  text: text,
                  fontSize: 16,
                  fontFamily: proximaNovaFont,
                  fontWeight: FontWeight.w400,
                  color: black000000,
                ),
                const Spacer(),
                const Icon(
                  Icons.chevron_right,
                  size: 18,
                ),
                // Image.asset(
                //   forwardArrowImage,
                //   width: 4,
                //   height: 9,
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
