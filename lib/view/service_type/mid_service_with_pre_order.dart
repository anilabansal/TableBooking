import 'package:booking_table/controller/service_type/summary_controller.dart';
import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/view/service_type/widgets/mid_service_preorder_booking_details_view.dart';
import 'package:booking_table/view/service_type/widgets/mid_service_summary_bottom_view.dart';
import 'package:booking_table/view/service_type/widgets/mid_service_summary_top_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MidServicePreOrderSummaryView extends StatelessWidget {
  MidServicePreOrderSummaryView({
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
            MidSummaryPreOrderBookingDetailsView(),
            Container(
              margin: const EdgeInsets.only(
                bottom: 18.0,
              ),
              // height: 1,
              // width: Get.width * 0.9,
              // color: textLight868686,
            ),
            MidSummaryBottomView(),
          ],
        ),
      ),
    );
  }
}
