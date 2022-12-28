import 'package:booking_table/controller/service_type/summary_controller.dart';
import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/view/service_type/widgets/full_service_summary_bottom_view.dart';
import 'package:booking_table/view/service_type/widgets/full_service_summary_details_button_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/common/common_strings.dart';
import '../../utils/common/widgets_methods/restaurant_name_distance.dart';

class FullServiceSummaryView extends StatelessWidget {
  String? callFrom;
  FullServiceSummaryView({
    this.callFrom,
    Key? key,
  }) : super(key: key);
  SummaryController controller = Get.put(SummaryController());
  var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommon(text: "Summary"),
      // body: FullServiceSummaryBody(
      //   callFrom: callFrom,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             CommonRestaurantNameDistance(
              restaurantName: data[0]['restaurantName'],
              restaurantDistance: data[0]['restaurantDistance'],
              restaurantPic: data[0]['restaurantPic'],
            ),
            //const FullSummaryTopView(),
            // CommonSizedBox(height: 21),
            FullSummaryBookingDetailsView(
              callFrom: callFrom,
            ),
            Container(
              width: Get.width,
              height: 1,
              color: whiteE5E5E5,
            ).paddingOnly(
              top: 5,
              bottom: 5,
            ),
            FullSummaryBottomView(),
          ],
        ),
      ),
    );
  }
}
