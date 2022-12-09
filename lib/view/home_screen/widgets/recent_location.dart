import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home/home_controller.dart';
import '../../../controller/location/location_controller.dart';
import '../../../controller/user_session/user_session_controller.dart';
import '../../../utils/common/common_strings.dart';
import '../../../utils/common/widgets_methods/common_app_bar.dart';
import '../../../utils/common/widgets_methods/progress_loader.dart';

class RecentLocation extends StatelessWidget {
  RecentLocation({Key? key}) : super(key: key);
  UserSessionController userSession = Get.find();
  HomeController controller = Get.find();
  LocationController locationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            // CommonText(
            //   text: "Recent Search",
            //   fontWeight: FontWeight.bold,
            //   fontSize: 18.0,
            // ),
            appBarCommon(text: "Recent Search"),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: userSession.recentSearchLocation.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () async {
                      ProgressDialog.showProgressDialog(context);
                      await controller.getRestaurantDetailsUsingLatLon(
                        body: {
                          "Latitude":
                              userSession.recentSearchLocation[index].lat,
                          "Longitude": userSession
                              .recentSearchLocation[index].long
                              .toString()
                        },
                      ).then(
                        (value) {
                          Navigator.pop(context);
                          if (value) {
                            Navigator.pop(context);
                            locationController.searchController.value.text =
                                userSession.recentSearchLocation[index].address
                                    .toString();
                          }
                        },
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: black000000,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Obx(
                          () => Expanded(
                            child: CommonText(
                              softWrap: true,
                              text: userSession
                                  .recentSearchLocation[index].address,
                              fontWeight: FontWeight.normal,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
