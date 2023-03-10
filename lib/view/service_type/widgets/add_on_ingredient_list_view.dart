import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/restaurant_details/restaurant_details_controller.dart';
import '../../../utils/common/widgets_methods/common_button.dart';
import '../../../utils/common/widgets_methods/common_text.dart';

class AddOnIngredientView extends StatefulWidget {
  final int? itemId;
  int? menuCategoryIndex;
  int? menuIndex;

  AddOnIngredientView(
      {Key? key, this.itemId, this.menuCategoryIndex, this.menuIndex})
      : super(key: key);

  @override
  State<AddOnIngredientView> createState() => _AddOnIngredientViewState();
}

class _AddOnIngredientViewState extends State<AddOnIngredientView> {
  RestaurantDetailsController restaurantsController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    // restaurantsController.addOnIngredients.clear();
    //restaurantsController.selectedIngredient.clear();
    loadIngredients();
    super.initState();
  }

  loadIngredients() {
    restaurantsController.addOnIsLoading.value = true;
    restaurantsController.addOnIngredientMenuApiCall(body: {
      "ItemId": widget.itemId,
    }).then((value) {
      if (value) {
        restaurantsController.addOnIsLoading.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
      child: Obx(() {
        return restaurantsController.addOnIsLoading.value
            ? const Center(
          child: CircularProgressIndicator(
            color: redE2211C,
          ),
        )
            : Column(
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
            GetBuilder<RestaurantDetailsController>(
                builder: (restaurantDetailController) {
                  return Expanded(
                    child: ListView(
                      primary: false,
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      children: [
                        ListView.builder(
                            itemCount: restaurantDetailController
                                .addOnMenuIngredientList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: restaurantDetailController
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
                                      itemCount: restaurantDetailController
                                          .addOnMenuIngredientList[index]
                                          .ingredientTypes!
                                          .length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, i) {
                                        return InkWell(
                                          onTap: () {
                                            if (restaurantsController
                                                .checkIngredientContains(
                                              restaurantDetailController
                                                  .addOnMenuIngredientList[
                                              index]
                                                  .ingredientTypes![i],
                                            )) {
                                              print('Remove');
                                              restaurantsController
                                                  .removeSelectedIngredient(
                                                restaurantDetailController
                                                    .addOnMenuIngredientList[
                                                index]
                                                    .ingredientTypes![i],
                                              );
                                            } else {
                                              print('add');
                                              restaurantsController
                                                  .setSelectedIngredient(
                                                restaurantDetailController
                                                    .addOnMenuIngredientList[
                                                index]
                                                    .ingredientTypes![i],
                                                widget.itemId,
                                                widget.menuCategoryIndex!,
                                                widget.menuIndex!,
                                              );
                                            }
                                          },
                                          child: ListTile(
                                            leading: CommonText(
                                              text: restaurantDetailController
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
                                                    text: restaurantDetailController
                                                        .addOnMenuIngredientList[
                                                    index]
                                                        .ingredientTypes![
                                                    i]
                                                        .amount ==
                                                        0.00
                                                        ? "    "
                                                        : "\$${restaurantDetailController
                                                        .addOnMenuIngredientList[index]
                                                        .ingredientTypes![i]
                                                        .amount!
                                                        .toStringAsFixed(2)}",
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    fontSize: 16,
                                                    color: black000000,
                                                  ),
                                                  CommonSizedBox(
                                                    width: 20,
                                                  ),
                                                  restaurantsController
                                                      .checkIngredientContains(
                                                      restaurantDetailController
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
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: CommonButton(
                onTap: () {
                  restaurantsController.addQuantity(
                    widget.menuCategoryIndex!,
                    widget.menuIndex!,
                  );
                  Get.back();
                },
                text: 'Add',
                bgColor: redE2211C,
                textColor: Colors.white,
              ),
            ),
          ],
        );
      }),
    );
  }
}
