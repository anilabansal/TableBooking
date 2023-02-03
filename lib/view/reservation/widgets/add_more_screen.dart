import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/reservation & rating/reservation_controller.dart';
import '../../../utils/common/common_strings.dart';
import '../../../utils/common/widgets_methods/common_sized_box.dart';
import '../../../utils/common/widgets_methods/common_text.dart';

class AddMoreScreen extends StatelessWidget {
   AddMoreScreen({Key? key}) : super(key: key);
   ReservationController reservationController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: "New Order",
            color: black0D0000,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          CommonSizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: greyF8F8F8
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics:
                  const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
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
                                      text: "abcd",
                                      // restaurantsController
                                      //     .cartItemsList[
                                      // index]
                                      //     .itemName,
                                      color:
                                      black0D0000,
                                      fontSize: 15,
                                      fontWeight:
                                      FontWeight
                                          .w500,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    // Visibility(
                                    //   visible: restaurantsController
                                    //       .cartItemsList[index]
                                    //       .isOfferItem ==
                                    //       true
                                    //       ? true
                                    //       : false,
                                    //   child:
                                    //   Container(
                                    //     // width: 80,
                                    //     // height: 50,
                                    //     decoration:
                                    //     BoxDecoration(
                                    //       borderRadius:
                                    //       BorderRadius.circular(
                                    //           10),
                                    //       color:
                                    //       red0FE2211C,
                                    //     ),
                                    //     child: Center(
                                    //       child:
                                    //       Padding(
                                    //         padding:
                                    //         const EdgeInsets.all(
                                    //             8.0),
                                    //         child:
                                    //         CommonText(
                                    //           text: restaurantsController
                                    //               .cartItemsList[index]
                                    //               .offerTitle
                                    //               .toString(),
                                    //           fontWeight:
                                    //           FontWeight.w500,
                                    //           color:
                                    //           black0D0000,
                                    //           fontSize:
                                    //           8,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // )
                                  ],
                                ),
                                Row(
                                  children: [
                                    CommonText(
                                      text:
                                      "Quantity:",
                                      color:
                                      textGrey868686,
                                      fontSize: 12,
                                      fontWeight:
                                      FontWeight
                                          .w500,
                                    ),
                                    CommonText(
                                      text:"2",
                                      // " ${restaurantsController.cartItemsList[index].ItemQuantity}",
                                      color:
                                      black0D0000,
                                      fontSize: 12,
                                      fontWeight:
                                      FontWeight
                                          .w500,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    CommonText(
                                      text: "Price:",
                                      color:
                                      textGrey868686,
                                      fontSize: 12,
                                      fontWeight:
                                      FontWeight
                                          .w500,
                                    ),
                                    // restaurantsController
                                    //     .cartItemsList[
                                    // index]
                                    //     .isOfferItem ==
                                    //     false
                                    //     ?
                                    CommonText(
                                      text:"25",
                                      //" ${restaurantsController.cartItemsList[index].ItemTotalPrice}",
                                      color:
                                      black0D0000,
                                      fontSize:
                                      12,
                                      fontWeight:
                                      FontWeight
                                          .w500,
                                    )
                                    //     : Row(
                                    //   children: [
                                    //     CommonText(
                                    //       text:
                                    //       "\$ ${restaurantsController.cartItemsList[index].offerPrice.toString()}",
                                    //       fontSize:
                                    //       12,
                                    //       fontWeight:
                                    //       FontWeight.w500,
                                    //       color:
                                    //       redE2211C,
                                    //     ),
                                    //     const SizedBox(
                                    //       width:
                                    //       5,
                                    //     ),
                                    //     CommonText(
                                    //       text:
                                    //       "\$ ${restaurantsController.cartItemsList[index].ItemTotalPrice.toString()}",
                                    //       fontSize:
                                    //       12,
                                    //       fontWeight:
                                    //       FontWeight.w500,
                                    //       color:
                                    //       grey868686,
                                    //       decoration:
                                    //       TextDecoration.lineThrough,
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                // restaurantsController
                                //     .removeItemAtIndex(
                                //     restaurantsController
                                //         .cartItemsList[
                                //     index]
                                //         .ItemId,
                                //     index);

                              },
                              child: Container(
                                width: 27,
                                height: 27,
                                decoration:
                                const BoxDecoration(
                                  shape:
                                  BoxShape.circle,
                                  color: white,
                                ),
                                child: const Icon(
                                  Icons.close,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: Get.width,
                          height: 1,
                          color: whiteE5E5E5,
                        ),
                      ],
                    );
                  }),
            ),
          ),
          CommonSizedBox(
            height: 20,
          ),
          Container(
            width: Get.width,
            height: 1,
            color: whiteE5E5E5,
          ).paddingOnly(
            top: 5,
            bottom: 5,
          ),
          CommonSizedBox(
            height: 12,
          ),
          /// Payment Method
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                textAlign: TextAlign.left,
                text: 'Select Payment Mode',
                color: black000000,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              CommonSizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectPaymentContainer(
                    image: Visibility(
                      visible: false,
                      child: Image.asset(
                        venmoLogo,
                        height: 16,
                        width: 16,
                      ),
                    ),
                    'Credit Card',
                    onTap: () {
                      reservationController.selectPaymentMode.value = "Credit Card";
                    },
                    isSelected:
                    reservationController.selectPaymentMode.value == "Credit Card",
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  selectPaymentContainer(
                    image: Image.asset(
                      reservationController.selectPaymentMode.value == "Apple"
                          ? appleIcon
                          : appleBlackLogo,
                      height: 16,
                      width: 16,
                    ),
                    'Apple',
                    onTap: () {
                      reservationController.selectPaymentMode.value = "Apple";
                    },
                    isSelected: reservationController.selectPaymentMode.value == "Apple",
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  selectPaymentContainer(
                      image: Image.asset(
                        googleIcon,
                        height: 16,
                        width: 16,
                      ),
                      'Pay', onTap: () {
                    reservationController.selectPaymentMode.value = "Pay";
                  }, isSelected: reservationController.selectPaymentMode.value == "Pay"),
                ],
              ),
              CommonSizedBox(
                height: 18,
              ),
              // selectPaymentContainer( "Pay At Restaurant")
              InkWell(
                onTap: () {
                  reservationController.selectPaymentMode.value = "Pay At Restaurant";
                },
                child: Container(
                  height: 32,
                  width: 137,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: reservationController.selectPaymentMode.value ==
                        "Pay At Restaurant"
                        ? black0D0000
                        : greyF8F8F8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: CommonText(
                    textAlign: TextAlign.center,
                    text: 'Pay At Restaurant',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: reservationController.selectPaymentMode.value ==
                        "Pay At Restaurant"
                        ? white
                        : greyA2A2A2,
                  ),
                ),
              ),
            ],
          ),
        ],);
    });

  }
  /// payment mode container
  selectPaymentContainer(iconText, {image, onTap, isSelected}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 32,
          width: 82,
          decoration: BoxDecoration(
            color: isSelected ? black0D0000 : greyF8F8F8,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const Icon(
                //   Icons.apple,
                //   color: white,
                // ),
                image,
                CommonSizedBox(
                  width: 8,
                ),
                CommonText(
                  text: iconText,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: isSelected ? white : greyA2A2A2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
