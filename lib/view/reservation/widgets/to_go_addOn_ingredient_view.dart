import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/reservation & rating/to_go_reservation_controller.dart';
import '../../../utils/common/common_strings.dart';
import '../../../utils/common/widgets_methods/common_button.dart';
import '../../../utils/common/widgets_methods/common_sized_box.dart';
import '../../../utils/common/widgets_methods/common_text.dart';
class ToGoAddOnIngredientView extends StatefulWidget {
  final int? itemId;
  final int? menuCategoryIndex;
  final int? menuIndex;
  const ToGoAddOnIngredientView({Key? key,this.itemId,this.menuCategoryIndex,this.menuIndex}) : super(key: key);

  @override
  State<ToGoAddOnIngredientView> createState() => _ToGoAddOnIngredientViewState();
}

class _ToGoAddOnIngredientViewState extends State<ToGoAddOnIngredientView> {
  ToGoReservationController toGoReservationController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    // restaurantsController.addOnIngredients.clear();
    //restaurantsController.selectedIngredient.clear();
    loadIngredients();
    super.initState();
  }
  loadIngredients() {
    toGoReservationController.toGoAddOnIsLoading.value = true;
    toGoReservationController.addOnIngredientMenuApiCall(body: {
      "ItemId": widget.itemId,
    }).then((value) {
      if (value) {
        toGoReservationController.toGoAddOnIsLoading.value = false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
      child: Obx(() {
        return toGoReservationController.toGoAddOnIsLoading.value
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
              GetBuilder<ToGoReservationController>(
                  builder: (toGoReservationDetailController) {
                    return ListView(
                      primary: false,
                      controller: ScrollController(keepScrollOffset: false),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ListView.builder(
                            itemCount: toGoReservationDetailController
                                .addOnMenuIngredientList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: toGoReservationDetailController
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
                                      itemCount: toGoReservationDetailController
                                          .addOnMenuIngredientList[index]
                                          .ingredientTypes!
                                          .length,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, i) {
                                        return InkWell(
                                          onTap: () {
                                            if (toGoReservationDetailController
                                                .checkIngredientContains(
                                                toGoReservationDetailController
                                                    .addOnMenuIngredientList[
                                                index]
                                                    .ingredientTypes![i]
                                            )) {
                                              print('Remove');

                                              toGoReservationDetailController
                                                  .removeSelectedIngredient(
                                                  toGoReservationDetailController
                                                      .addOnMenuIngredientList[
                                                  index]
                                                      .ingredientTypes![i]
                                              );
                                            } else {
                                              print('add');
                                              toGoReservationDetailController
                                                  .setSelectedIngredient(
                                                toGoReservationDetailController
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
                                              text: toGoReservationDetailController
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
                                                    text: toGoReservationDetailController
                                                        .addOnMenuIngredientList[
                                                    index]
                                                        .ingredientTypes![
                                                    i]
                                                        .amount ==
                                                        0.0
                                                        ? "    "
                                                        : "\$${toGoReservationDetailController.addOnMenuIngredientList[index].ingredientTypes![i].amount}",
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    fontSize: 16,
                                                    color: black000000,
                                                  ),
                                                  CommonSizedBox(
                                                    width: 20,
                                                  ),
                                                  toGoReservationDetailController
                                                      .checkIngredientContains(
                                                      toGoReservationDetailController
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
                  toGoReservationController.addQuantity(
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
