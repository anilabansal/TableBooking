// ignore_for_file: must_be_immutable

import 'package:booking_table/controller/home/home_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/common/widgets_methods/common_button.dart';
import '../../utils/common/widgets_methods/common_sized_box.dart';
import '../../utils/common/widgets_methods/common_text.dart';

class GetZipCodeView extends StatelessWidget {
  HomeController controller = Get.find();
  GetZipCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonSizedBox(height: 65),
            CommonSizedBox(
              height: 93,
              width: 93,
              child: Container(
                decoration: const BoxDecoration(),
                child: Image.asset(zipcodeUserImage),
              ),
            ),
            CommonSizedBox(
              height: 33,
            ),
            CommonText(
              text: 'Welcome!',
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              //decoration: TextDecoration.underline,
            ),
            CommonSizedBox(
              height: 7,
            ),
            CommonText(
              text: 'Claire Fiona',
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
            CommonSizedBox(
              height: 18,
            ),
            CommonText(
              textAlign: TextAlign.center,
              text: 'Enter your location to find restaurants\n in your area.',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            CommonSizedBox(
              height: 35,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: CommonTextFormField(
                keyboardType: TextInputType.number,
                filled: true,
                hintText: 'Location',
                suffixIcon: const Icon(
                  Icons.place,
                  color: Colors.black,
                ),
              ),
            ),
            CommonSizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () async {
                print('Button clicked');
                // await controller.getRestaurantDetailsUsingLatLon(
                //   body: {
                //     "Latitude": "30.713649330499276",
                //     "Longitude": "76.69060936300099"
                //   },
                //   endPoint: zipCode,
                // ).then((value) {
                //   if (value) {
                //     Get.toNamed('/home');
                //   }
                // });
              },
              child: Obx(() {
                return CommonSizedBox(
                  height: 50,
                  width: 184,
                  child: controller.isLoading.value == true
                      ? Center(
                          child: CircularProgressIndicator(
                          color: redE2211C,
                        ))
                      : CommonButton(
                          onTap: () async {
                            controller.isLoading.value = true;
                            print('Button clicked');

                            await controller.getRestaurantDetailsUsingLatLon(
                              body: {
                                "Latitude": "30.713649330499276",
                                "Longitude": "76.69060936300099"
                              },
                            ).then((value) {
                              if (value) {
                                // controller.isLoading.value = false;
                                Get.toNamed('/home');
                              }
                            });
                          },
                          text: 'Search',
                          bgColor: Colors.red,
                          textColor: Colors.white,
                        ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
