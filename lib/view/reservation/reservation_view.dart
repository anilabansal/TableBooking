import 'package:booking_table/controller/reservation/reservation_controller.dart';
import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/view/reservation/widgets/previous_reservation.dart';
import 'package:booking_table/view/reservation/widgets/upcoming_reservation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationView extends StatelessWidget {
  const ReservationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReservationController controller = Get.put(ReservationController());
    return Scaffold(
      appBar: appBarCommon(
          text: 'Reservations',
          bottom: TabBar(
            controller: controller.tabController,
            tabs: controller.myTabs,
            unselectedLabelColor: textLight868686,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            overlayColor: MaterialStateProperty.all(Colors.black),
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: TabBarView(
          controller: controller.tabController,
          children: const [
            UpComingReservations(),
            PreviousReservations(),
          ],
        ),
      ),
    );
  }
}
