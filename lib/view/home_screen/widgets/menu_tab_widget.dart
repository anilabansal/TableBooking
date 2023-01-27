import 'package:booking_table/controller/restaurant_details/restaurant_details_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/no_data_found.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/common/widgets_methods/common_text.dart';
import '../../../utils/common/widgets_methods/shimmers/listing_shimmer_widget.dart';

class MenuTab extends StatefulWidget {
  final int? restaurantId;

  const MenuTab({Key? key, this.restaurantId}) : super(key: key);

  @override
  State<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  RestaurantDetailsController restaurantsController = Get.find();
  final _controller = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    loadAllMenuDetail();
    // _controller.addListener(() {
    //   loadAllMenuDetail(_controller.value);
    // });
  }

  loadAllMenuDetail() {
    restaurantsController.isLoading.value = true;
    restaurantsController.restaurantDetailsMenu(body: {
      "RestaurantId": widget.restaurantId,
      "isOfferItem": true,
    }).then(
      (value) {
        if (value) {
          restaurantsController.isLoading.value = false;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantDetailsController>(
      builder: (controller) {
        return controller.isLoading.value == true
            ? const ShimmerCard()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: controller.menuHeaderRestaurantList.isNotEmpty
                        ? ListView(
                            primary: false,
                            controller:
                                ScrollController(keepScrollOffset: false),
                            shrinkWrap: true,
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              ListView.builder(
                                itemCount:
                                    controller.menuHeaderRestaurantList.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CommonText(
                                            text: controller
                                                .menuHeaderRestaurantList[index]
                                                .categoryName
                                                .toString(),
                                            // text: "Recommended",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: black000000,
                                          ),
                                          // const Spacer(),
                                          // Visibility(
                                          //   visible: index == 0 ? true : false,
                                          //   child: Row(
                                          //     children: [
                                          //       CommonText(
                                          //         text: "Special Offers",
                                          //         color: textDark3F3E3E,
                                          //         fontSize: 14,
                                          //         fontWeight: FontWeight.w500,
                                          //       ),
                                          //       const SizedBox(
                                          //         width: 8,
                                          //       ),
                                          //       AdvancedSwitch(
                                          //         width: 31.0,
                                          //         height: 16.0,
                                          //         borderRadius:
                                          //             BorderRadius.circular(5),
                                          //         inactiveColor:
                                          //             const Color(0xFFD9D9D9),
                                          //         controller: _controller,
                                          //         activeColor: redE2211C,
                                          //         // padding: 8.0,
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      ListView.builder(
                                        itemCount: controller
                                            .menuHeaderRestaurantList[index]
                                            .menu!
                                            .length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, i) {
                                          return restaurantItem(
                                            controller
                                                .menuHeaderRestaurantList[index]
                                                .menu![i]
                                                .itemImage
                                                .toString(),
                                            controller
                                                        .menuHeaderRestaurantList[
                                                            index]
                                                        .menu![i]
                                                        .itemName ==
                                                    null
                                                ? ""
                                                : controller
                                                    .menuHeaderRestaurantList[
                                                        index]
                                                    .menu![i]
                                                    .itemName
                                                    .toString(),
                                            controller
                                                        .menuHeaderRestaurantList[
                                                            index]
                                                        .menu![i]
                                                        .itemPrice ==
                                                    null
                                                ? ""
                                                : controller
                                                    .menuHeaderRestaurantList[
                                                        index]
                                                    .menu![i]
                                                    .itemPrice
                                                    .toString(),
                                            controller
                                                        .menuHeaderRestaurantList[
                                                            index]
                                                        .menu![i]
                                                        .itemdescription ==
                                                    null
                                                ? ""
                                                : controller
                                                    .menuHeaderRestaurantList[
                                                        index]
                                                    .menu![i]
                                                    .itemdescription
                                                    .toString(),
                                            controller
                                                        .menuHeaderRestaurantList[
                                                            index]
                                                        .menu![i]
                                                        .offerTitle ==
                                                    null
                                                ? ""
                                                : controller
                                                    .menuHeaderRestaurantList[
                                                        index]
                                                    .menu![i]
                                                    .offerTitle
                                                    .toString(),
                                            controller
                                                        .menuHeaderRestaurantList[
                                                            index]
                                                        .menu![i]
                                                        .isOfferItem ==
                                                    true
                                                ? true
                                                : false,
                                          controller
                                                    .menuHeaderRestaurantList[
                                                        index]
                                                    .menu![i]
                                                    .isOfferItem  ,
                                            controller
                                                        .menuHeaderRestaurantList[
                                                            index]
                                                        .menu![i]
                                                        .offerPrice ==
                                                    null
                                                ? ""
                                                : controller
                                                    .menuHeaderRestaurantList[
                                                        index]
                                                    .menu![i]
                                                    .offerPrice
                                                    .toString(),
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
                            ],
                          )
                        : const CommonNoDataFound(),
                  ),
                ],
              );
        //  : const CommonNoDataFound();
      },
    );
  }

  restaurantItem(
    itemImage,
    itemName,
    itemPrice,
    itemDescription,
    offerTitle,
    visibility,
    isOfferItem,
    offerPrice,
  ) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 73,
              height: 75,
              child: Image.network(
                itemImage,
                // "assets/images/home/restaurant_item.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CommonText(
                      text: itemName,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: black000000,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Visibility(
                      visible: visibility,
                      child: Container(
                        // width: 80,
                        // height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: red0FE2211C),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CommonText(
                              text: offerTitle,
                              fontWeight: FontWeight.w500,
                              color: black0D0000,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: Get.width - 130,
                  child: CommonText(
                    softWrap: true,
                    text: itemDescription,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: textDark3F3E3E,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CommonText(
                      text: "Price: ",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: textDark3F3E3E,
                    ),
                    isOfferItem == false
                        ? CommonText(
                            text: "\$ $itemPrice",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: redE2211C,
                          )
                        : Row(
                            children: [
                              CommonText(
                                text: "\$ $offerPrice",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: redE2211C,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              CommonText(
                                text: "\$ $itemPrice",
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
  }
}
