import 'package:booking_table/controller/restaurant_details/restaurant_details_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/no_data_found.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/common/widgets_methods/common_text.dart';

class MenuTab extends StatefulWidget {
  final int? restaurantId;

  const MenuTab({Key? key, this.restaurantId}) : super(key: key);

  @override
  State<MenuTab> createState() => _MenuTabState();
}

class _MenuTabState extends State<MenuTab> {
  RestaurantDetailsController restaurantsController = Get.find();

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    loadAllMenuDetail();
  }

  loadAllMenuDetail() {
    restaurantsController.isLoading.value = true;
    restaurantsController.restaurantDetailsMenu(
        body: {"RestaurantId": widget.restaurantId}).then((value) {
      if (value) {
        restaurantsController.isLoading.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantDetailsController>(
      builder: (controller) {
        return controller.isLoading.value == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: redE2211C,
                ),
              )
            :
            // controller.menuHeaderRestaurantList.isNotEmpty
            //   ?
            Column(
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
                              //Recommended starts from here
                              // CommonText(
                              //   text: controller.menuRestaurantList[0].categoryName
                              //       .toString(),
                              //   // text: "Recommended",
                              //   fontWeight: FontWeight.w700,
                              //   fontSize: 15,
                              //   color: black000000,
                              // ),
                              const SizedBox(
                                height: 12,
                              ),
                              // ListView.builder(
                              //   itemCount: 4,
                              //   shrinkWrap: true,
                              //   physics: const NeverScrollableScrollPhysics(),
                              //   itemBuilder: (context, index) {
                              //     return restaurantItem(context);
                              //   },
                              // ),
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
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      ListView.builder(
                                        itemCount: controller
                                            .menuHeaderRestaurantList[index]
                                            .menu
                                            .length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, i) {
                                          return restaurantItem(
                                            controller
                                                .menuHeaderRestaurantList[index]
                                                .menu[i]
                                                .itemImage
                                                .toString(),
                                            controller
                                                .menuHeaderRestaurantList[index]
                                                .menu[i]
                                                .itemName
                                                .toString(),
                                            controller
                                                .menuHeaderRestaurantList[index]
                                                .menu[i]
                                                .itemPrice
                                                .toString(),
                                            controller
                                                .menuHeaderRestaurantList[index]
                                                .menu[i]
                                                .itemdescription
                                                .toString(),
                                            // "controller.",
                                            // "controller.",
                                            // "controller.",
                                            // "controller.",
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

                              //Main course starts from here
                              // CommonText(
                              //   text: "Main Course",
                              //   fontWeight: FontWeight.w700,
                              //   fontSize: 15,
                              //   color: black000000,
                              // ),
                              // const SizedBox(
                              //   height: 12,
                              // ),
                              // ListView.builder(
                              //   itemCount: 6,
                              //   shrinkWrap: true,
                              //   physics: const NeverScrollableScrollPhysics(),
                              //   itemBuilder: (context, index) {
                              //     return restaurantItem(context);
                              //   },
                              // ),
                              //
                              // //sweets starts from here
                              // CommonText(
                              //   text: "Sweets",
                              //   fontWeight: FontWeight.w700,
                              //   fontSize: 15,
                              //   color: black000000,
                              // ),
                              // const SizedBox(
                              //   height: 12,
                              // ),
                              // ListView.builder(
                              //   itemCount: 2,
                              //   shrinkWrap: true,
                              //   physics: const NeverScrollableScrollPhysics(),
                              //   itemBuilder: (context, index) {
                              //     return restaurantItem(context);
                              //   },
                              // ),
                              // const SizedBox(
                              //   height: 12,
                              // ),
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
                CommonText(
                  text: itemName,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: black000000,
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
                    CommonText(
                      text: "\$ $itemPrice",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: redE2211C,
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
