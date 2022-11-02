import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/view/service_type/widgets/full_service_summary_bottom_view.dart';
import 'package:booking_table/view/service_type/widgets/full_service_summary_details_button_view.dart';
import 'package:booking_table/view/service_type/widgets/full_service_summary_top_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullServiceSummaryBody extends StatelessWidget {
  const FullServiceSummaryBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
