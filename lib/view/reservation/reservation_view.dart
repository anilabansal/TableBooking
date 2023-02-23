
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/view/reservation/widgets/upcoming_previous_running_reservation_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/reservation & rating/reservation_controller.dart';
import '../../utils/common/widgets_methods/shimmers/common_shimmer_widget.dart';

class ReservationView extends StatefulWidget {
  const ReservationView({Key? key}) : super(key: key);
  @override
  State<ReservationView> createState() => _ReservationViewState();
}
class _ReservationViewState extends State<ReservationView> {
  ReservationController reservationController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    uploadReservationRestaurantList();
    super.initState();
  }
  uploadReservationRestaurantList() {
    reservationController.bookRestaurantIsLoading.value = true;
    reservationController.reservationBookingRestaurantsApiCall().then((value) {
      if (value) {
        reservationController.bookRestaurantIsLoading.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ReservationController controller = Get.put(ReservationController());
    return Scaffold(
      backgroundColor: white,
      appBar: appBarCommon(
        text: 'Reservations',
      ),
      // body: ReservationViewBody(controller: controller),
      body: Obx(
        () {
          return reservationController.bookRestaurantIsLoading.value
              ?
          const ShimmerReservationDetailsWidget()
          // const Center(
          //         child: CircularProgressIndicator(
          //           color: redE2211C,
          //         ),
          //       )
              : Column(
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
                              borderRadius: BorderRadius.circular(6),
                              color: black0D0000,),
                          tabs: controller.myTabs,
                          labelStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                          unselectedLabelColor: textLight868686,
                        ),
                      ),
                    ),
                    //  const SizedBox(height: 20,),
                    Expanded(
                      child: TabBarView(
                        controller: controller.tabController,
                        children: [
                          UpComingPreviousRunningReservations(
                            bookRestaurantList: reservationController
                                .bookingRestaurantList.value.upcominglist,
                            callFrom: "upComing",
                          ),
                          UpComingPreviousRunningReservations(
                            bookRestaurantList: reservationController
                                .bookingRestaurantList.value.runninglist,
                            callFrom: 'running',
                          ),
                          UpComingPreviousRunningReservations(
                            bookRestaurantList: reservationController
                                .bookingRestaurantList.value.previouslist,
                            callFrom: 'previous',
                          ),
                          // RunningReservations(),
                          // RunningReservations(),
                          // PreviousReservations(),
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
