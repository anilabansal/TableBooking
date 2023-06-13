import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home/home_controller.dart';
import '../../../controller/support/customer_support_controller.dart';

class DrawerScreen extends StatelessWidget {
  UserSessionController userSessionController = Get.find();
  HomeController homeController = Get.find();

  DrawerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return GetBuilder<ProfileController>(
    //   builder: (profileController) {
    //
    //   },
    // );
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Drawer(
        backgroundColor: white,
        child: SafeArea(
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Positioned(
                top: 10,
                right: -6,
                child: IconButton(
                  onPressed: () {
                    homeController.drawerKey.currentState?.closeDrawer();
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
                child: GetBuilder<UserSessionController>(
                  builder: (_userSessionController) {
                    return Column(
                      children: <Widget>[
                        Row(
                          children: [
                            _userSessionController.isLogin == false
                                ? const Icon(
                                    Icons.person,
                                    size: 40,
                                  )
                                : _userSessionController.profilePic != ''
                                    ? CommonSizedBox(
                                        height: 49,
                                        width: 49,
                                        child: ClipOval(
                                          child: Image.network(
                                            _userSessionController.profilePic,
                                            height: 49,
                                            width: 49,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )
                                    : const Icon(
                                        Icons.person,
                                        size: 40,
                                      ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width-180,
                                  child: CommonText(
                                    text: _userSessionController.isLogin == false
                                        ? "Guest User"
                                        : _userSessionController.fullName,
                                    fontFamily: proximaNovaFont,
                                    fontWeight: FontWeight.w600,
                                    color: black000000,
                                    fontSize: 16,
                                    softWrap: true,
                                  ),
                                ),
                                _userSessionController.isLogin == false
                                    ? Container()
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonText(
                                            text: _userSessionController.email,
                                            fontFamily: proximaNovaFont,
                                            fontWeight: FontWeight.w400,
                                            color: black000000,
                                            fontSize: 14,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // await profileController
                                              //     .getProfileDetails()
                                              //     .then((value) async {
                                              //   if (value) {
                                              //     await profileController
                                              //         .getProfileDetails();
                                              //     Get.toNamed('/edit-profile');
                                              //   }
                                              // });
                                              Get.toNamed('/edit-profile');
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
                          homeController.drawerKey.currentState?.closeDrawer();
                        }),
                        iconContainer(
                          const Icon(
                            Icons.favorite,
                            color: redE2211C,
                          ),
                          "Favorites",
                          () async {
                            //  await homeController.favRestaurantDetailList();
                            userSessionController.isLogin == false
                                ? getXBuildDefaultDialog()
                                : Get.toNamed('/favourite');
                          },
                        ),
                        iconContainer(
                          const Icon(
                            Icons.book,
                            color: redE2211C,
                          ),
                          "Reservations",
                          () {
                            userSessionController.isLogin == false
                                ? getXBuildDefaultDialog()
                                : Get.toNamed('/reservation');
                          },
                        ),
                        iconContainer(
                          const Icon(
                            Icons.wallet,
                            color: redE2211C,
                          ),
                          "Payment Method",
                          () {
                            userSessionController.isLogin == false
                                ? getXBuildDefaultDialog()
                                : Get.toNamed('/payment-method');
                          },
                        ),
                        // iconContainer(
                        //   const Icon(
                        //     Icons.notifications,
                        //     color: redE2211C,
                        //   ),
                        //   "Notifications",
                        //   () {
                        //     userSessionController.isLogin == false
                        //         ? getXBuildDefaultDialog()
                        //         : Get.toNamed('/notifications');
                        //   },
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.asset(lineImage),
                        const SizedBox(
                          height: 30,
                        ),
                        textAndIcon(
                          "Terms & Conditions",
                          () {
                            Get.toNamed('/terms-and-conditions');
                          },
                        ),
                        textAndIcon(
                          "Legal & About",
                          () {
                            Get.toNamed('/privacy-policy');
                          },
                        ),
                        textAndIcon(
                          "Customer Support",
                          () {
                            userSessionController.isLogin == false
                                ? getXBuildDefaultDialog()
                                : Get.toNamed('/support');
                          },
                        ),
                        // userSessionController.isLogin == true
                        //     ?



                        userSessionController.isLogin == false
                            ? Container()
                            : textAndIcon(
                                "Logout",
                                () async {
                                  //  userSessionController.logOut();
                                  await getXBuildDefaultDialog(
                                    callFrom: "Logout",
                                  );
                                },
                              ),
                        textAndIcon(
                          "Delete Account",
                              textColor: redE2211C,
                              () async {
                            //  userSessionController.logOut();
                            await getXBuildDefaultDialog(
                              callFrom: "Delete Account",
                            );
                          },
                        ),
                        // : Container(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
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
                ? 'Are you sure you want to logout?':
            callFrom == "Delete Account"
                ?"Are you sure you want to Delete Account"
                : "You're not logged In\nPlease login to continue..",
            textAlign: TextAlign.center,
          ),
        ],
      ),
      radius: 0010,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5.0),
          // padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Expanded(
              //   child:
              SizedBox(
                width: 80,
                height: 40,
                child: CommonButton(
                  bgColor: redE2211C,
                  text: callFrom == "Logout"|| callFrom =="Delete Account" ? "Confirm" : 'Login',
                  textColor: Colors.white,
                  onTap: () async {
                    callFrom == "Logout"
                        ? await userSessionController.logOut():
                  callFrom=="Delete Account"?
                  await Get.find<SupportController>().deleteAccountApiCall(
                    body: {
                      "UserId":userSessionController.userId
                    }
                  )
                        : Get.offAllNamed('/authentication');

                    // : Get.toNamed('/login');
                  },
                ),
              ),
              // ),
              CommonSizedBox(
                width: 15,
              ),
              // Expanded(
              //   child:
              SizedBox(
                width: 80,
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
              // ),
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

  textAndIcon(text, onTap,{textColor}) {
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
                  color: textColor??black000000,
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
