import 'package:booking_table/utils/common/common_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../controller/location/location_controller.dart';

class SearchBoxScreen extends StatefulWidget {
  SearchBoxScreen({Key? key}) : super(key: key);

  @override
  State<SearchBoxScreen> createState() => _SearchBoxScreenState();
}

class _SearchBoxScreenState extends State<SearchBoxScreen> {
  final TextEditingController searchController = TextEditingController();
  HomeController homeController = Get.find();
  LocationController locationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: greyB3F5F5F5),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                    child: TextFormField(
                      controller: searchController,
                      onChanged: (text)async{
                      if( homeController.searchQuery.value != text.trim()){
                        homeController.updateLoading(true);
                        homeController.searchQuery.value = text.trim();
                           await homeController.getRestaurantDetailsUsingLatLon(
                          body: {
                            "Latitude": locationController.latLng.value.latitude
                                .toString(),
                            "Longitude": locationController.latLng.value.longitude
                                .toString(),
                            "RestaurantName" : homeController.searchQuery.value
                          },
                        ).then((value){
                             // FocusScope.of(context).unfocus();
                           });
                      }
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          fontFamily: interFont,
                          color: textGrey868686,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed('/filter-screen');
                },
                child: Container(
                  width: 45,
                  height: 45,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: redE2211C,
                  ),
                  child: Image.asset(filterImage),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
