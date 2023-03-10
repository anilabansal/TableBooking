import 'dart:convert';

import 'package:booking_table/utils/common/widgets_methods/progress_loader.dart';
import 'package:booking_table/utils/extensions/capitalization_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/book_a_table/book_a_table_controller.dart';
import '../../../controller/card_details/add_card_details_controller.dart';
import '../../../controller/restaurant_details/restaurant_details_controller.dart';
import '../../../utils/common/common_strings.dart';
import '../../../utils/common/widgets_methods/common_text.dart';
import '../payment_done_view.dart';

class CardListView extends StatelessWidget {
  CardListView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GetBuilder<AddCardDetailsController>(
          builder: (addCardDetailsController) {
        return Column(
          children: [
            addCardDetailsController.userAllCardList.value.userCardlist!.isEmpty
                ? Center(
                    child: CommonText(
                      text: "No Card Found!!",
                      color: redE2211C,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : ListView.builder(
                    itemCount: addCardDetailsController
                        .userAllCardList.value.userCardlist!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              addCardDetailsController.setSelectedCard(
                                  addCardDetailsController.userAllCardList.value
                                      .userCardlist![index]);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: white,
                                  boxShadow:  [
                                    BoxShadow(
                                        color: addCardDetailsController
                                            .cardSelected ==
                                            addCardDetailsController
                                                .userAllCardList
                                                .value
                                                .userCardlist![index]
                                            ? red4DE2211C:white0F000000,
                                        offset: const Offset(2, 2)),
                                    BoxShadow(
                                        color:addCardDetailsController
                                            .cardSelected ==
                                            addCardDetailsController
                                                .userAllCardList
                                                .value
                                                .userCardlist![index]
                                            ? red4DE2211C: white0F000000,
                                        offset: const Offset(-2, -2),),
                                  ]),
                              child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    children: [
                                      addCardDetailsController.cardSelected ==
                                              addCardDetailsController
                                                  .userAllCardList
                                                  .value
                                                  .userCardlist![index]
                                          ? SvgPicture.asset(
                                              'assets/images/payment/radio_selected.svg')
                                          : SvgPicture.asset(
                                              'assets/images/payment/radio_unselected.svg'),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      Image.asset(
                                        cardImage,
                                        width: 31,
                                        height: 22,
                                      ),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      CommonText(
                                        text: addCardDetailsController
                                            .userAllCardList
                                            .value
                                            .userCardlist![index]
                                            .cardNumber,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: black0D0000,
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          ProgressDialog.showProgressDialog(
                                              context);
                                          addCardDetailsController
                                              .removeCardAPi(body: {
                                            "CardId": addCardDetailsController
                                                .userAllCardList
                                                .value
                                                .userCardlist![index]
                                                .cardId
                                          }).then((value) {
                                            Navigator.pop(context);

                                            if (value) {
                                              addCardDetailsController
                                                  .isUserCardListIsLoading
                                                  .value = true;
                                              addCardDetailsController
                                                  .savedCardListDataApi()
                                                  .then((value) {
                                                if (value) {
                                                  addCardDetailsController
                                                      .isUserCardListIsLoading
                                                      .value = false;
                                                }
                                              });
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: 16,
                                          height: 16,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: red26E2211C),
                                          child: const Icon(
                                            Icons.close,
                                            color: redE2211C,
                                            size: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      );
                    })
          ],
        );
      }),
    );
  }


}
