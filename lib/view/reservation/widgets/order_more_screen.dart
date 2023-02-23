import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/reservation & rating/reservation_controller.dart';
import '../../../utils/common/common_strings.dart';
import '../../../utils/common/no_data_found.dart';
import '../../../utils/common/widgets_methods/common_app_bar.dart';
import '../../../utils/common/widgets_methods/common_button.dart';
import '../../../utils/common/widgets_methods/common_text.dart';
import '../../../utils/common/widgets_methods/restaurant_name_distance.dart';
import 'order_more_helper.dart';

class ReservationOrderMore extends StatefulWidget {
  const ReservationOrderMore({Key? key}) : super(key: key);

  @override
  State<ReservationOrderMore> createState() => _ReservationOrderMoreState();
}

class _ReservationOrderMoreState extends State<ReservationOrderMore> {
  ReservationController reservationController = Get.find();
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommon(text: 'Pre Order'),
      // body: PreOrderBody(controller: controller),
      body: RefreshIndicator(
        color: redE2211C,
        onRefresh: () {
          return reservationController.orderMoreApiCall(body: {
            "BookingId": data[0]["BookingId"],
            "RestaurantId": data[0]["RestaurantId"],
            "isOfferItem": true,
          });
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonRestaurantNameDistance(
                restaurantName: data[0]['restaurantName'],
                restaurantDistance: data[0]['restaurantDistance'],
                restaurantPic: data[0]['restaurantPic'],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 18.0, top: 26.0),
                height: 1,
                width: Get.width,
                color: textLight868686,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: CommonText(
                  text: 'Menu',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Column(
                children: [
                  GetBuilder<ReservationController>(
                    builder: (controller) {
                      return controller.reservationOrderMoreMenu.isEmpty
                          ? const CommonNoDataFound()
                          : ListView(
                              primary: false,
                              controller: ScrollController(
                                keepScrollOffset: false,
                              ),
                              shrinkWrap: true,
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      ListView.builder(
                                        itemCount: controller
                                            .reservationOrderMoreMenu.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CommonText(
                                                text: controller
                                                    .reservationOrderMoreMenu[
                                                        index]
                                                    .categoryName
                                                    .toString(),
                                                // text: "Recommended",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                color: black000000,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              ListView.builder(
                                                itemCount: controller
                                                    .reservationOrderMoreMenu[
                                                        index]
                                                    .menu!
                                                    .length,
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, i) {
                                                  return Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              SizedBox(
                                                                width: 73,
                                                                height: 75,
                                                                child: controller
                                                                            .reservationOrderMoreMenu[
                                                                                index]
                                                                            .menu![
                                                                                i]
                                                                            .itemImage !=
                                                                        null
                                                                    ? Image
                                                                        .network(
                                                                        controller
                                                                            .reservationOrderMoreMenu[index]
                                                                            .menu![i]
                                                                            .itemImage
                                                                            .toString(),
                                                                        // "assets/images/home/restaurant_item.png",
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      )
                                                                    : Image
                                                                        .asset(
                                                                        "assets/images/home/restaurant_item.png",
                                                                        //restaurantItem,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                              ),
                                                              const SizedBox(
                                                                height: 4,
                                                              ),
                                                              OrderMoreHelperScreen(
                                                                index: index,
                                                                subIndex: i,
                                                                itemId: controller
                                                                    .reservationOrderMoreMenu[
                                                                        index]
                                                                    .menu![i]
                                                                    .itemId,
                                                              )
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  CommonText(
                                                                    softWrap:
                                                                        true,
                                                                    text: controller.reservationOrderMoreMenu[index].menu![i].itemName ==
                                                                            null
                                                                        ? ""
                                                                        : controller
                                                                            .reservationOrderMoreMenu[index]
                                                                            .menu![i]
                                                                            .itemName
                                                                            .toString(),
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color:
                                                                        black000000,
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 8,
                                                                  ),
                                                                  Visibility(
                                                                    visible: controller.reservationOrderMoreMenu[index].menu![i].isOfferItem ==
                                                                            true
                                                                        ? true
                                                                        : false,
                                                                    child:
                                                                        Container(
                                                                      // width: 80,
                                                                      // height: 50,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                          10,
                                                                        ),
                                                                        color:
                                                                            red0FE2211C,
                                                                      ),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child:
                                                                              CommonText(
                                                                            text: controller.reservationOrderMoreMenu[index].menu![i].offerTitle == null
                                                                                ? ""
                                                                                : controller.reservationOrderMoreMenu[index].menu![i].offerTitle.toString(),
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            color:
                                                                                black0D0000,
                                                                            fontSize:
                                                                                8,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    Get.width -
                                                                        130,
                                                                child:
                                                                    CommonText(
                                                                  softWrap:
                                                                      true,
                                                                  text: controller
                                                                              .reservationOrderMoreMenu[
                                                                                  index]
                                                                              .menu![
                                                                                  i]
                                                                              .itemdescription ==
                                                                          null
                                                                      ? ""
                                                                      : controller
                                                                          .reservationOrderMoreMenu[
                                                                              index]
                                                                          .menu![
                                                                              i]
                                                                          .itemdescription
                                                                          .toString(),
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      textDark3F3E3E,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  CommonText(
                                                                    text:
                                                                        "Price: ",
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    color:
                                                                        textDark3F3E3E,
                                                                  ),
                                                                  controller.reservationOrderMoreMenu[index].menu![i]
                                                                              .isOfferItem ==
                                                                          false
                                                                      ? CommonText(
                                                                          text:
                                                                              "\$ ${controller.reservationOrderMoreMenu[index].menu![i].itemPrice == null ? "" : controller.reservationOrderMoreMenu[index].menu![i].itemPrice.toString()}",
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color:
                                                                              redE2211C,
                                                                        )
                                                                      : Row(
                                                                          children: [
                                                                            CommonText(
                                                                              text: "\$ ${controller.reservationOrderMoreMenu[index].menu![i].offerPrice == null ? "" : controller.reservationOrderMoreMenu[index].menu![i].offerPrice.toString()}",
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w500,
                                                                              color: redE2211C,
                                                                            ),
                                                                            const SizedBox(
                                                                              width: 5,
                                                                            ),
                                                                            CommonText(
                                                                              text: "\$ ${controller.reservationOrderMoreMenu[index].menu![i].itemPrice == null ? "" : controller.reservationOrderMoreMenu[index].menu![i].itemPrice.toString()}",
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w500,
                                                                              color: grey868686,
                                                                              decoration: TextDecoration.lineThrough,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      )
                                                    ],
                                                  );
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      CommonButton(
                                        onTap: () {
                                          // bookATableController.updateOrderIsAdded();
                                          Get.back();
                                        },
                                        text: 'Add',
                                        bgColor: redE2211C,
                                        textColor: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
