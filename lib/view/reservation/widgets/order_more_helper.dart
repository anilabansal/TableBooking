import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/reservation & rating/reservation_controller.dart';
import '../../../utils/common/common_strings.dart';
import '../../../utils/common/widgets_methods/common_text.dart';
import 'order_more_addOn_ingredient_view.dart';

class OrderMoreHelperScreen extends StatelessWidget {
  final int? index;
  final int? subIndex;
  final int? itemId;
  final double?addedAddOnPrices;

  OrderMoreHelperScreen({Key? key, this.index, this.subIndex, this.itemId,this.addedAddOnPrices})
      : super(key: key);

  // ReservationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReservationController>(builder: (controller) {
      return SizedBox(
        child:
        controller.reservationOrderMoreMenu[index!].menu![subIndex!]
                    .newAddedQuantity!=
                0
            ? Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller
                          .deleteQuantity(
                        index!,
                        subIndex!,
                      );
                    },
                    child: Container(
                      width: 24,
                      height: 22,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            4,
                          ),
                          bottomLeft: Radius.circular(
                            4,
                          ),
                        ),
                        color: black0D0000,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.remove,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 24,
                    height: 22,
                    color: white0F000000,
                    child: Center(
                      child: CommonText(
                        text: controller.reservationOrderMoreMenu[index!]
                            .menu![subIndex!].quantity.toString(),
                        color: black0D0000,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.addQuantity(
                        index!,
                        subIndex!,
                      );
                    },
                    child: Container(
                      width: 24,
                      height: 22,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            4,
                          ),
                          bottomLeft: Radius.circular(
                            4,
                          ),
                        ),
                        color: black0D0000,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            :
        controller.reservationOrderMoreMenu[index!].menu![subIndex!]
                        .quantity ==
                    0
                ? InkWell(
                    onTap: () {
                      if (controller.reservationOrderMoreMenu[index!]
                              .menu![subIndex!].isAddOnAdded ==
                          true) {
                        addOnBottomSheet(
                          itemId: itemId,
                          context: context,
                          menuCategoryIndex: index!,
                          menuIndex: subIndex!,
                        );
                      }
                      else{
                        controller.addQuantity(
                          index!,
                          subIndex!,
                        );
                      }
                    },
                    child: Container(
                      width: 73,
                      height: 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          4,
                        ),
                        color: black0D0000,
                      ),
                      child: Center(
                        child: CommonText(
                          text: 'Add',
                          color: white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      controller.addQuantity(
                        index!,
                        subIndex!,
                      );
                    },
                    child: Container(
                      width: 73,
                      height: 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          4,
                        ),
                        color: black0D0000,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CommonText(
                            text: controller.reservationOrderMoreMenu[index!]
                                .menu![subIndex!].quantity
                                .toString(),
                            color: white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          // const Spacer(),
                          // const SizedBox(width: 12,),
                          const Icon(
                            Icons.add,
                            color: white,
                          ),
                        ],
                      ),
                    ),
                  ),
      );
    });
  }

  addOnBottomSheet({itemId, menuCategoryIndex, menuIndex, context}) {
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
                child: OrderMoreAddOnIngredientView(
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
