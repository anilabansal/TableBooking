import 'package:booking_table/controller/service_type/pre_order_controller.dart';
import 'package:booking_table/utils/common/widgets_methods/common_app_bar.dart';
import 'package:booking_table/view/service_type/widgets/add_on_ingredient_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/book_a_table/book_a_table_controller.dart';
import '../../controller/restaurant_details/restaurant_details_controller.dart';
import '../../utils/common/common_strings.dart';
import '../../utils/common/no_data_found.dart';
import '../../utils/common/widgets_methods/common_button.dart';
import '../../utils/common/widgets_methods/common_text.dart';
import '../../utils/common/widgets_methods/restaurant_name_distance.dart';

class PreOrderView extends StatefulWidget {
  const PreOrderView({
    Key? key,
  }) : super(key: key);

  @override
  State<PreOrderView> createState() => _PreOrderViewState();
}

class _PreOrderViewState extends State<PreOrderView> {
  // PreOrderController controller = Get.put(PreOrderController());
  RestaurantDetailsController restaurantsController = Get.find();
  BookATableController bookATableController = Get.find();
  var data = Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCommon(text: 'Pre Order'),
      // body: PreOrderBody(controller: controller),
      body: RefreshIndicator(
        color: redE2211C,
        onRefresh: (){
          return restaurantsController.restaurantDetailsMenu(body: {
           "RestaurantId": data[0]['restaurantId'],
            "isOfferItem": true,
          });
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
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
              GetBuilder<RestaurantDetailsController>(
                builder: (controller) {
                  return controller.menuHeaderRestaurantList.isEmpty
                      ? const CommonNoDataFound()
                      : Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GetBuilder<BookATableController>(
                                  builder: (bookATableController) {
                                return ListView(
                                  primary: false,
                                  controller:
                                      ScrollController(keepScrollOffset: false),
                                  shrinkWrap: true,
                                  children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    ListView.builder(
                                      itemCount: controller
                                          .menuHeaderRestaurantList.length,
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
                                                              child:
                                                                  Image.network(
                                                                controller
                                                                    .menuHeaderRestaurantList[
                                                                        index]
                                                                    .menu![i]
                                                                    .itemImage
                                                                    .toString(),
                                                                // "assets/images/home/restaurant_item.png",
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 4,
                                                            ),
                                                            controller
                                                                        .menuHeaderRestaurantList[
                                                                            index]
                                                                        .menu![i]
                                                                        .quantity ==
                                                                    0
                                                                ? InkWell(
                                                                    onTap: () {
                                                                      if (controller
                                                                              .menuHeaderRestaurantList[index]
                                                                              .menu![i]
                                                                              .isAddOnAdded ==
                                                                          true) {
                                                                        addOnBottomSheet(
                                                                          itemId: controller
                                                                              .menuHeaderRestaurantList[index]
                                                                              .menu![i]
                                                                              .itemId,
                                                                          menuCategoryIndex:
                                                                              index,
                                                                          menuIndex:
                                                                              i,
                                                                        );
                                                                      } else {
                                                                        controller
                                                                            .addQuantity(
                                                                          index,
                                                                          i,
                                                                        );
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: 73,
                                                                      height: 22,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .circular(
                                                                          4,
                                                                        ),
                                                                        color:
                                                                            black0D0000,
                                                                      ),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            CommonText(
                                                                          text:
                                                                              'Add',
                                                                          color:
                                                                              white,
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                : Row(
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          controller
                                                                              .deleteQuantity(
                                                                            index,
                                                                            i,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              24,
                                                                          height:
                                                                              22,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              topLeft:
                                                                                  Radius.circular(
                                                                                4,
                                                                              ),
                                                                              bottomLeft:
                                                                                  Radius.circular(
                                                                                4,
                                                                              ),
                                                                            ),
                                                                            color:
                                                                                black0D0000,
                                                                          ),
                                                                          child:
                                                                              const Center(
                                                                            child:
                                                                                Icon(
                                                                              Icons.remove,
                                                                              color:
                                                                                  white,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width: 24,
                                                                        height:
                                                                            22,
                                                                        color:
                                                                            white0F000000,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              CommonText(
                                                                            // text: controller
                                                                            //     .menuHeaderRestaurantList[index]
                                                                            //     .menu![i]
                                                                            //     .quantity
                                                                            //     .toString(),
                                                                            text: controller
                                                                                .menuHeaderRestaurantList[index]
                                                                                .menu![i]
                                                                                .quantity
                                                                                .toString(),
                                                                            color:
                                                                                black0D0000,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize:
                                                                                12,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          controller
                                                                              .addQuantity(
                                                                            index,
                                                                            i,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              24,
                                                                          height:
                                                                              22,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              topLeft:
                                                                                  Radius.circular(
                                                                                4,
                                                                              ),
                                                                              bottomLeft:
                                                                                  Radius.circular(
                                                                                4,
                                                                              ),
                                                                            ),
                                                                            color:
                                                                                black0D0000,
                                                                          ),
                                                                          child:
                                                                              const Center(
                                                                            child:
                                                                                Icon(
                                                                              Icons.add,
                                                                              color:
                                                                                  white,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
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
                                                                  softWrap: true,
                                                                  text: controller
                                                                              .menuHeaderRestaurantList[
                                                                                  index]
                                                                              .menu![
                                                                                  i]
                                                                              .itemName ==
                                                                          null
                                                                      ? ""
                                                                      : controller
                                                                          .menuHeaderRestaurantList[
                                                                              index]
                                                                          .menu![
                                                                              i]
                                                                          .itemName
                                                                          .toString(),
                                                                  fontSize: 16,
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
                                                                  visible: controller
                                                                              .menuHeaderRestaurantList[index]
                                                                              .menu![i]
                                                                              .isOfferItem ==
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
                                                                          BorderRadius
                                                                              .circular(
                                                                        10,
                                                                      ),
                                                                      color:
                                                                          red0FE2211C,
                                                                    ),
                                                                    child: Center(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(
                                                                                8.0),
                                                                        child:
                                                                            CommonText(
                                                                          text: controller.menuHeaderRestaurantList[index].menu![i].offerTitle ==
                                                                                  null
                                                                              ? ""
                                                                              : controller.menuHeaderRestaurantList[index].menu![i].offerTitle.toString(),
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
                                                                  Get.width - 130,
                                                              child: CommonText(
                                                                softWrap: true,
                                                                text: controller
                                                                            .menuHeaderRestaurantList[
                                                                                index]
                                                                            .menu![
                                                                                i]
                                                                            .itemdescription ==
                                                                        null
                                                                    ? ""
                                                                    : controller
                                                                        .menuHeaderRestaurantList[
                                                                            index]
                                                                        .menu![i]
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
                                                                  text: "Price: ",
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      textDark3F3E3E,
                                                                ),
                                                                controller
                                                                            .menuHeaderRestaurantList[
                                                                                index]
                                                                            .menu![
                                                                                i]
                                                                            .isOfferItem ==
                                                                        false
                                                                    ? CommonText(
                                                                        text:
                                                                            "\$ ${controller.menuHeaderRestaurantList[index].menu![i].itemPrice == null ? "" : controller.menuHeaderRestaurantList[index].menu![i].itemPrice!.toStringAsFixed(2)}",
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color:
                                                                            redE2211C,
                                                                      )
                                                                    : Row(
                                                                        children: [
                                                                          CommonText(
                                                                            text:
                                                                                "\$ ${controller.menuHeaderRestaurantList[index].menu![i].offerPrice == null ? "" : controller.menuHeaderRestaurantList[index].menu![i].offerPrice.toString()}",
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            color:
                                                                                redE2211C,
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                5,
                                                                          ),
                                                                          CommonText(
                                                                            text:
                                                                                "\$ ${controller.menuHeaderRestaurantList[index].menu![i].itemPrice == null ? "" : controller.menuHeaderRestaurantList[index].menu![i].itemPrice.toString()}",
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            color:
                                                                                grey868686,
                                                                            decoration:
                                                                                TextDecoration.lineThrough,
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
                                        bookATableController.updateOrderIsAdded();
                                        Get.back();
                                      },
                                      text: 'Add',
                                      bgColor: redE2211C,
                                      textColor: Colors.white,
                                    ),
                                  ],
                                );
                              })
                            ],
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  addOnBottomSheet({itemId, menuCategoryIndex, menuIndex}) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return Wrap(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.75,
                // padding: const EdgeInsets.only(left: 16, right: 16),
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                child: AddOnIngredientView(
                  itemId: itemId,
                  menuCategoryIndex: menuCategoryIndex,
                  menuIndex: menuIndex,
                ),
              ),
            ],
          );
        });
  }
}
