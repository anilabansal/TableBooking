import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/reservation & rating/reservation_controller.dart';
import '../../../utils/common/widgets_methods/common_button.dart';
import '../../../utils/common/widgets_methods/common_text.dart';

class OrderMoreAddOnIngredientView extends StatefulWidget {
  final int? itemId;
  int? menuCategoryIndex;
  int? menuIndex;

  OrderMoreAddOnIngredientView(
      {Key? key, this.itemId, this.menuCategoryIndex, this.menuIndex,})
      : super(key: key);
  @override
  State<OrderMoreAddOnIngredientView> createState() => _OrderMoreAddOnIngredientViewState();
}
class _OrderMoreAddOnIngredientViewState extends State<OrderMoreAddOnIngredientView> {
  // RestaurantDetailsController restaurantsController = Get.find();
  ReservationController reservationController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    // restaurantsController.addOnIngredients.clear();
    //restaurantsController.selectedIngredient.clear();
    loadIngredients();
    super.initState();
  }
  loadIngredients() {
    reservationController.addOnIsLoading.value = true;
    reservationController.addOnIngredientMenuApiCall(body: {
      "ItemId": widget.itemId,
    }).then((value) {
      if (value) {
        reservationController.addOnIsLoading.value = false;
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
      child: Obx(() {
        return reservationController.addOnIsLoading.value
            ? const Center(
          child: CircularProgressIndicator(
            color: redE2211C,
          ),
        )
            : SingleChildScrollView(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              Row(
                children: [
                  CommonText(
                    text: "Ingredients",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: black000000,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: black0D0000,
                      size: 20,
                    ),
                  )
                ],
              ),
              CommonSizedBox(
                height: 25,
              ),
              GetBuilder<ReservationController>(
                  builder: (reservationDetailController) {
                    return ListView(
                      primary: false,
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ListView.builder(
                            itemCount: reservationDetailController
                                .addOnMenuIngredientList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: reservationDetailController
                                        .addOnMenuIngredientList[index]
                                        .ingredientType,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: black000000,
                                  ),
                                  CommonSizedBox(
                                    height: 11,
                                  ),
                                  ListView.builder(
                                      itemCount: reservationDetailController
                                          .addOnMenuIngredientList[index]
                                          .ingredientTypes!
                                          .length,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, i) {
                                        return InkWell(
                                          onTap: () {
                                            if (reservationDetailController
                                                .checkIngredientContains(
                                                reservationDetailController
                                                    .addOnMenuIngredientList[
                                                index]
                                                    .ingredientTypes![i]
                                            )) {
                                              print('Remove');
                                              reservationDetailController
                                                  .removeSelectedIngredient(
                                                  reservationDetailController
                                                      .addOnMenuIngredientList[
                                                  index]
                                                      .ingredientTypes![i]
                                              );
                                            } else {
                                              print('add');
                                              reservationDetailController
                                                  .setSelectedIngredient(
                                                reservationDetailController
                                                    .addOnMenuIngredientList[
                                                index]
                                                    .ingredientTypes![i],
                                                widget.itemId, widget.menuCategoryIndex!,
                                                widget.menuIndex!,
                                              );
                                            }
                                          },
                                          child: ListTile(
                                            leading: CommonText(
                                              text: reservationDetailController
                                                  .addOnMenuIngredientList[
                                              index]
                                                  .ingredientTypes![i]
                                                  .name,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: textDark3F3E3E,
                                            ),
                                            trailing: SizedBox(
                                              width: Get.width * 0.2,
                                              child: Row(
                                                children: [
                                                  CommonText(
                                                    text: reservationDetailController
                                                        .addOnMenuIngredientList[
                                                    index]
                                                        .ingredientTypes![
                                                    i]
                                                        .amount ==
                                                        0.0
                                                        ? "    "
                                                        : "\$${reservationDetailController.addOnMenuIngredientList[index].ingredientTypes![i].amount}",
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    fontSize: 16,
                                                    color: black000000,
                                                  ),
                                                  CommonSizedBox(
                                                    width: 20,
                                                  ),
                                                  reservationDetailController
                                                      .checkIngredientContains(
                                                      reservationDetailController
                                                          .addOnMenuIngredientList[
                                                      index]
                                                          .ingredientTypes![
                                                      i]
                                                  )
                                                      ? SvgPicture.asset(
                                                      "assets/images/home/selected_check.svg")
                                                      : SvgPicture.asset(
                                                      "assets/images/home/unselected_check.svg"),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                  CommonSizedBox(
                                    height: 20,
                                  ),

                                ],
                              );
                            }),
                      ],
                    );
                  }),
              CommonButton(
                onTap: () {
                  reservationController.addQuantity(
                    widget.menuCategoryIndex!,
                    widget.menuIndex!,
                  );
                  Get.back();
                },
                text: 'Add',
                bgColor: redE2211C,
                textColor: Colors.white,
              ),
          ],
        ),
            );
      }),
    );
  }
}
