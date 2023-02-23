import 'package:booking_table/controller/home/home_controller.dart';
import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text_form_field.dart';
import 'package:booking_table/utils/common/widgets_methods/progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/location/location_controller.dart';
import '../../utils/common/widgets_methods/common_button.dart';
import '../../utils/common/widgets_methods/common_sized_box.dart';
import '../../utils/common/widgets_methods/common_text.dart';
import '../profile_screen/search_location.dart';

class GetZipCodeView extends StatefulWidget {
  const GetZipCodeView({Key? key}) : super(key: key);
  @override
  State<GetZipCodeView> createState() => _GetZipCodeViewState();
}

class _GetZipCodeViewState extends State<GetZipCodeView> {
  // LocationController locationController = Get.find();
  HomeController controller = Get.find();
  LocationController locationController = Get.find();
  UserSessionController userController = Get.find();
  //ProfileController profileController = Get.put(ProfileController());
  // _getAddressFromLatLng() async {
  //   locationController.isLoading.value = true;
  //   await locationController.requestPermission().then(
  //     (value) async {
  //       try {
  //         locationController.isLoading.value = false;
  //         print(
  //             'LOCATION ========> ${locationController.locationData!.latitude}/${locationController.locationData!.longitude}');
  //         List<Placemark> placemarks = await placemarkFromCoordinates(
  //             locationController.locationData!.latitude!,
  //             locationController.locationData!.longitude!);
  //         Placemark place = placemarks[0];
  //         locationController.currentAddress.value =
  //             "${place.name},${place.locality},${place.subLocality},${place.administrativeArea}, ${place.country}";
  //       } catch (e) {
  //         print(e);
  //       }
  //     },
  //   );
  // }

  @override
  void initState() {
    // TODO: implement initState
    // _getAddressFromLatLng();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserSessionController>(builder: (userSessionController) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonSizedBox(height: 65),
              Container(
                width: 93,
                height: 93,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: greyCACACA,
                  image: userController.profilePic != ''
                      ? DecorationImage(
                          image: NetworkImage(userSessionController.profilePic),
                          fit: BoxFit.fill)
                      : const DecorationImage(
                          image: AssetImage("assets/images/auth/user.png"),
                          fit: BoxFit.fill,
                        ),
                ),
                // child: userController.isLogin == true
                //     ? Container()
                //     : const Icon(
                //         Icons.person_outline,
                //         size: 80,
                //       ),
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
              userController.isLogin == true
                  ? CommonText(
                      text: userSessionController.fullName == ''
                          ? ""
                          : userSessionController.fullName,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    )
                  : CommonText(
                      text: "Guest User",
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
                child: Obx(
                  () => locationController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: redE2211C,
                          ),
                        )
                      : CommonTextFormField(
                 //   contentPadding: const EdgeInsets.only(top:10),
                          //maxLines: 2,
                           maxLength: 250,
                          hintMaxLines: 3,
                          readOnly: true,
                          controller: locationController.searchController.value,
                        //  keyboardType: TextInputType.number,
                          filled: true,
                          hintText:
                              locationController.currentAddress.value == ''
                                  ? "Search"
                                  : locationController.currentAddress.value,
                          suffixIcon: InkWell(
                            onTap: () {
                              locationController.requestPermission().then(
                                (value) {
                                  if (value) {
                                    Get.to(() => const SearchLocation());
                                  }
                                },
                              );
                            },
                            child: const Icon(
                              Icons.place,
                              color: Colors.black,
                            ),
                          ),
                        ),
                ),
              ),
              CommonSizedBox(
                height: 25,
              ),
              CommonSizedBox(
                height: 50,
                width: 184,
                child: CommonButton(
                  onTap: () async {
                    print('Button clicked');
                    if (locationValidation() == "") {
                      ProgressDialog.showProgressDialog(context);
                      await controller.getRestaurantDetailsUsingLatLon(
                        body: {
                          "Latitude": locationController.latLng.value.latitude
                              .toString(),
                          "Longitude": locationController.latLng.value.longitude
                              .toString(),
                          "RestaurantName":""
                        },
                      ).then(
                        (value) {
                          if (value) {
                            Get.offAllNamed('/home');
                            // Get.toNamed('/home');
                            print("finalLocation ----->${locationController.searchController.value.text}");
                            locationController
                                    .searchController.value.text.isEmpty
                                ? userController.setSearchLocation(
                                    locationController.currentAddress.value,
                                    locationController.latLng.value.latitude,
                                    locationController.latLng.value.longitude,
                                  )
                                :
                            userController.setSearchLocation(
                                    locationController
                                        .searchController.value.text,
                                    locationController.latLng.value.latitude,
                                    locationController.latLng.value.longitude,
                                  );
                          }
                        },
                      );
                    }
                  },
                  text: 'Search',
                  bgColor: Colors.red,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  locationValidation() {
    if (locationController.latLng.value.latitude == 0.0 &&
        locationController.latLng.value.longitude == 0.0) {
      // return _getAddressFromLatLng();
      return locationController.requestPermission();
    } else {
      return "";
    }
  }
}
