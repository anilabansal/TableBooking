import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/view/reservation/widgets/to_go_added_item_list.dart';
import 'package:booking_table/view/reservation/widgets/to_go_pre_order_item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/reservation & rating/reservation_controller.dart';
import '../../../utils/common/widgets_methods/common_text.dart';

class ToGoView extends StatelessWidget {
  final int? restaurantId;
  final String? restaurantName;
  final String? restaurantPic;
  final dynamic restaurantDistance;

  ToGoView(
      {Key? key,
      this.restaurantId,
      this.restaurantName,
      this.restaurantPic,
      this.restaurantDistance})
      : super(key: key);
  ReservationController reservationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonSizedBox(
          height: 20,
        ),
        Container(
          height: 1,
          width: Get.width,
          color: whiteE5E5E5,
        ),
        CommonSizedBox(
          height: 20,
        ),
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "To Go",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: black000000,
                ),
                CommonSizedBox(
                  height: 12,
                ),
                CommonText(
                  text: "You can take away as well",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: textGrey868686,
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Get.toNamed(
                  '/to-go-order-menu',
                  arguments: [
                    {
                      "restaurantId": restaurantId,
                      "restaurantName": restaurantName,
                      "restaurantPic": restaurantPic,
                      "restaurantDistance": restaurantDistance
                    },
                  ],
                );
              },
              child: Visibility(
                visible: reservationController.bookRestaurantDetails!
                        .bookinglistresponse.gotoorderlistdetail!.isEmpty
                    ? true
                    : false,
                child: Container(
                  width: 93,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: black0D0000),
                  child: Center(
                    child: CommonText(
                      text: "Order Now",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        ToGoBookedItemsView(),
        ToGoAddedItemView()
      ],
    );
  }
}
