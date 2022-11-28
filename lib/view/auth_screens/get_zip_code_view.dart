import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text_form_field.dart';
import 'package:booking_table/utils/common/widgets_methods/progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import '../../controller/location/location_controller.dart';
import '../../utils/common/widgets_methods/common_button.dart';
import '../../utils/common/widgets_methods/common_sized_box.dart';
import '../../utils/common/widgets_methods/common_text.dart';
import '../profile_screen/search_location.dart';

class GetZipCodeView extends StatefulWidget {
  // HomeController controller = Get.find();
  const GetZipCodeView({Key? key}) : super(key: key);

  @override
  State<GetZipCodeView> createState() => _GetZipCodeViewState();
}

class _GetZipCodeViewState extends State<GetZipCodeView> {
  // LocationController locationController = Get.find();
  LocationController locationController = Get.find();

  _getAddressFromLatLng() async {
    locationController.isLoading.value = true;
    await locationController.requestPermission().then(
      (value) async {
        try {
          locationController.isLoading.value = false;
          print(
              'LOCATION ========> ${locationController.locationData!.latitude}/${locationController.locationData!.longitude}');
          List<Placemark> placemarks = await placemarkFromCoordinates(
              locationController.locationData!.latitude!,
              locationController.locationData!.longitude!);
          Placemark place = placemarks[0];
          locationController.currentAddress.value =
              "${place.name},${place.locality},${place.subLocality},${place.administrativeArea}, ${place.country}";
        } catch (e) {
          print(e);
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _getAddressFromLatLng();
    super.initState();
  }

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
              child: Obx(
                () => locationController.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: redE2211C,
                      ))
                    : CommonTextFormField(
                        readOnly: true,
                        controller: locationController.searchController.value,
                        keyboardType: TextInputType.number,
                        filled: true,
                        hintText: locationController.currentAddress.value == ''
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
                  if (locationValidation() == "") {
                    ProgressDialog.showProgressDialog(context);
                    await locationController.searchLocationApi(data: {
                      "Latitude":
                          locationController.latLng.value.latitude.toString(),
                      "Longitude":
                          locationController.latLng.value.longitude.toString()
                    }).then((value) {
                      if (value) {
                        Get.toNamed('/home');
                      }
                    });
                  }
                  // else{
                  //
                  // }
                },
                text: 'Search',
                bgColor: Colors.red,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  locationValidation() {
    if (locationController.latLng.value.latitude == 0.0 &&
        locationController.latLng.value.longitude == 0.0) {
      return _getAddressFromLatLng();
    } else {
      return "";
    }
  }
}
