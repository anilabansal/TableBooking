import 'package:booking_table/controller/reservation/reservation_controller.dart';
import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/images_string.dart';
import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
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
        )
        // SafeArea(
        //   child: Column(
        //     children: const [
        //       UpComingReservations(),
        //       PreviousReservations(),
        //     ],
        //   ),
        // ),
        );
  }
}

class UpComingReservations extends StatelessWidget {
  const UpComingReservations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 138,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                Container(
                  height: 118,
                  width: 98,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    image: DecorationImage(
                      image: AssetImage(bookATableImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                  ),
                  height: 18,
                  width: 98,
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  height: 138,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CommonText(
                        text: 'Venisa’s Kitchen',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      // CommonSizedBox(
                      //   height: 10,
                      // ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.place),
                          Expanded(
                            child: CommonText(
                              color: textDark3F3E3E,
                              text:
                                  '6363 Montana Ave, El Paso, Texas, Montgo- mery, 35004',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      CommonSizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              const Icon(Icons.calendar_month),
                              CommonText(
                                text: '24 July, 2022',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const Icon(Icons.watch_later),
                              CommonText(
                                text: '09:30 PM',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PreviousReservations extends StatelessWidget {
  const PreviousReservations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 138,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: [
                          Container(
                            height: 118,
                            width: 98,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5)),
                              image: DecorationImage(
                                image: AssetImage(bookATableImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                            ),
                            height: 18,
                            width: 98,
                            alignment: Alignment.center,
                            child: CommonText(
                              text: 'Full Service',
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CommonText(
                                text: 'Venisa’s Kitchen',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                              // CommonSizedBox(
                              //   height: 10,
                              // ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.place),
                                  Expanded(
                                    child: CommonText(
                                      color: textDark3F3E3E,
                                      text:
                                          '6363 Montana Ave, El Paso, Texas, Montgo- mery, 35004',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              CommonSizedBox(
                                height: 18,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: <Widget>[
                                      const Icon(Icons.calendar_month),
                                      CommonText(
                                        text: '24 July, 2022',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      const Icon(Icons.watch_later),
                                      CommonText(
                                        text: '09:30 PM',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 40,
                    width: 110,
                    margin: const EdgeInsets.only(top: 23, bottom: 25),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: redE2211C,
                    ),
                    child: CommonText(
                      color: Colors.white,
                      text: 'Give Review',
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          );
        });
  }
}
