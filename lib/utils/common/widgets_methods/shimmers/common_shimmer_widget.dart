import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Restaurant Details
class CommonShimmerRestaurantCardWidget extends StatelessWidget {
  const CommonShimmerRestaurantCardWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        // physics: const ??(),
        itemCount: 10,
        itemBuilder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              margin: const EdgeInsets.only(bottom: 15),
              width: Get.width,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.06),
                    blurRadius: 4.0,
                    offset: Offset(0.0, 10),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 11.0, right: 11.0, top: 11.0),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: Get.width,
                          height: 150,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 133,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black.withOpacity(0.04),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 20,
                          child: Container(
                            alignment: Alignment.center,
                            width: 33,
                            height: 33,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: greyF2F2F2),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Icon(
                                  Icons.favorite,
                                  color: redE2211C.withOpacity(0.2),
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(11.0, 5, 11.0, 11.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: Get.width * 00.2,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black.withOpacity(0.04),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: Get.width * 00.4,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black.withOpacity(0.04),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

/// Card Or Payment Method Screen
class CommonShimmerPaymentMethodWidget extends StatelessWidget {
  const CommonShimmerPaymentMethodWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, snapshot) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                width: Get.width,
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.06),
                      blurRadius: 4.0,
                      offset: Offset(0.0, 10),
                    ),
                  ],
                ),
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(03),
                            color: Colors.black.withOpacity(0.04),
                          ),
                          width: 31,
                          height: 22,
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.black.withOpacity(0.04),
                              ),
                              width: Get.width * 0.5,
                              height: 10,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.black.withOpacity(0.04),
                              ),
                              width: Get.width * 0.2,
                              height: 10,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: red26E2211C.withOpacity(0.1)),
                          child: Icon(
                            Icons.close,
                            color: redE2211C.withOpacity(0.18),
                            size: 10,
                          ),
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          );
        });
  }
}

/// Reservation --- Previous
class ShimmerPreviousReservationWidget extends StatelessWidget {
  const ShimmerPreviousReservationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, snapshot) {
          return Padding(
            //  padding: const EdgeInsets.symmetric(horizontal: 16.0),
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Container(
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 4),
                        color: Color.fromRGBO(0, 0, 0, 0.06),
                        blurRadius: 10)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      // height: 138,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: [
                              Container(
                                height: 118,
                                width: 98,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      topRight: Radius.circular(6)),
                                  color: Colors.black.withOpacity(0.04),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.04),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(6),
                                    bottomRight: Radius.circular(6),
                                  ),
                                ),
                                height: 18,
                                width: 98,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.04),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    height: 30,
                                    width: Get.width * 0.45,
                                    alignment: Alignment.center,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.place,
                                        color: Colors.black.withOpacity(0.1),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black
                                                  .withOpacity(0.04),
                                              borderRadius:
                                              BorderRadius.circular(6),
                                            ),
                                            height: 10,
                                            width: Get.width * 0.4,
                                            alignment: Alignment.center,
                                          ),
                                          CommonSizedBox(height: 5),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black
                                                  .withOpacity(0.04),
                                              borderRadius:
                                              BorderRadius.circular(6),
                                            ),
                                            height: 10,
                                            width: Get.width * 0.4,
                                            alignment: Alignment.center,
                                          ),
                                          CommonSizedBox(height: 5),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black
                                                  .withOpacity(0.04),
                                              borderRadius:
                                              BorderRadius.circular(6),
                                            ),
                                            height: 10,
                                            width: Get.width * 0.4,
                                            alignment: Alignment.center,
                                          ),
                                        ],
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
                                          Icon(
                                            Icons.calendar_month,
                                            color: redE2211C.withOpacity(0.2),
                                            size: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black
                                                  .withOpacity(0.04),
                                              borderRadius:
                                              BorderRadius.circular(6),
                                            ),
                                            height: 10,
                                            width: Get.width * 0.2,
                                            alignment: Alignment.center,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.watch_later,
                                            color: redE2211C.withOpacity(0.2),
                                            size: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black
                                                  .withOpacity(0.04),
                                              borderRadius:
                                              BorderRadius.circular(6),
                                            ),
                                            height: 10,
                                            width: Get.width * 0.2,
                                            alignment: Alignment.center,
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
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 1,
                      width: Get.width,
                      color: whiteE5E5E5,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed('/reviews');
                        },
                        child: Container(
                          height: 40,
                          width: 110,
                          margin: const EdgeInsets.only(
                            top: 8,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: redE2211C.withOpacity(0.1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class ShimmerReservationDetailsWidget extends StatelessWidget {
  const ShimmerReservationDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: 8,
        itemBuilder: (context, snapshot) {
          return Padding(
            //  padding: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 4),
                          color: Color.fromRGBO(0, 0, 0, 0.06),
                          blurRadius: 10)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.06),
                                offset: Offset(0, 4),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 57,
                                width: 57,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(03),
                                  color: Colors.black.withOpacity(0.04),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 10,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(03),
                                      color: Colors.black.withOpacity(0.04),
                                    ),
                                  ),
                                  CommonSizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 10,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(03),
                                      color: Colors.black.withOpacity(0.04),
                                    ),
                                  ),
                                  CommonSizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 10,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(03),
                                      color: Colors.black.withOpacity(0.04),
                                    ),
                                  ),
                                ],
                              ).paddingOnly(left: 11.0),
                            ],
                          ).paddingOnly(
                              left: 11, right: 11, top: 12, bottom: 12),
                        ),
                      ),
                      CommonSizedBox(
                        height: 24,
                      ),
                      // SizedBox(
                      //   height: Get.height * 0.6,
                      //   child: Center(
                      //     child: CircularProgressIndicator(
                      //       color: redE2211C.withOpacity(0.4),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),);
        });
  }
}

class ShimmerRestaurantDetailMenuWidget extends StatelessWidget {
  const ShimmerRestaurantDetailMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, snapshot) {
          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            width: Get.width,
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.06),
                  blurRadius: 4.0,
                  offset: Offset(0.0, 10),
                ),
              ],
            ),
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(03),
                        color: Colors.black.withOpacity(0.04),
                      ),
                      width: 31,
                      height: 22,
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black.withOpacity(0.04),
                          ),
                          width: Get.width * 0.5,
                          height: 10,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black.withOpacity(0.04),
                          ),
                          width: Get.width * 0.2,
                          height: 10,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: red26E2211C.withOpacity(0.1)),
                      child: Icon(
                        Icons.close,
                        color: redE2211C.withOpacity(0.18),
                        size: 10,
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}