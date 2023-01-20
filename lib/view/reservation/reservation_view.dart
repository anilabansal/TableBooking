import 'package:booking_table/controller/reservation/reservation_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';

import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/view/reservation/widgets/previous_reservation.dart';
import 'package:booking_table/view/reservation/widgets/reservation_body.dart';
import 'package:booking_table/view/reservation/widgets/running_reservation.dart';
import 'package:booking_table/view/reservation/widgets/upcoming_reservation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationView extends StatelessWidget {
  const ReservationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReservationController controller = Get.put(ReservationController());
    return Scaffold(
      backgroundColor: white,
      appBar: appBarCommon(
        text: 'Reservations',
      ),
     // body: ReservationViewBody(controller: controller),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: greyEAEAEA),
              ),
              padding: const EdgeInsets.all(3),
              child: TabBar(
                controller: controller.tabController,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(6), color: black0D0000),
                tabs: controller.myTabs,
                labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                unselectedLabelColor: textLight868686,
              ),
            ),
          ),
          //  const SizedBox(height: 20,),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: const [
                UpComingReservations(),
                RunningReservations(),
                PreviousReservations(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
