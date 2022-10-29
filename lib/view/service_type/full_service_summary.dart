// ignore_for_file: must_be_immutable

import 'package:booking_table/controller/service_type/summary_controller.dart';
import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/view/service_type/widgets/full_service_summary_bottom_view.dart';
import 'package:booking_table/view/service_type/widgets/full_service_summary_details_button_view.dart';
import 'package:booking_table/view/service_type/widgets/full_service_summary_top_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullServiceSummaryView extends StatelessWidget {
  String callFrom;
  FullServiceSummaryView({
    required this.callFrom,
    Key? key,
  }) : super(key: key);

  SummaryController controller = Get.put(SummaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommon(text: "Summary"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FullSummaryTopView(),
            // CommonSizedBox(height: 21),
            const FullSummaryBookingDetailsView(),
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
