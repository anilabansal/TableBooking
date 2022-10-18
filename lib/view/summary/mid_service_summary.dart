import 'package:booking_table/controller/summary/summary_controller.dart';
import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/view/summary/widgets/mid_service_summary_bottom_view.dart';
import 'package:booking_table/view/summary/widgets/mid_service_summary_details_button_view.dart';
import 'package:booking_table/view/summary/widgets/mid_service_summary_top_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MidServiceSummaryView extends StatelessWidget {
  MidServiceSummaryView({
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
            MidSummaryTopView(),
            CommonSizedBox(height: 21),
            MidSummaryBookingDetailsView(),
            Container(
              margin: const EdgeInsets.only(bottom: 18.0, top: 26.0),
              height: 1,
              width: Get.width * 0.9,
              color: textLight868686,
            ),
            MidSummaryBottomView(),
          ],
        ),
      ),
    );
  }
}
