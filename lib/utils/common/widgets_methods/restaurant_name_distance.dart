import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonRestaurantNameDistance extends StatelessWidget {
  final String? restaurantName;
  final String? restaurantPic;
  final double? restaurantDistance;

  const CommonRestaurantNameDistance(
      {Key? key,
      this.restaurantName,
      this.restaurantPic,
      this.restaurantDistance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.06),
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 57,
              width: 57,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: restaurantPic == null
                    ? const DecorationImage(
                        image: AssetImage(bookATableImage),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: NetworkImage(restaurantPic.toString()),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: restaurantName,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                CommonSizedBox(
                  height: 5,
                ),
                CommonText(
                  // text: restaurantDistance==null?"":"${restaurantDistance.toString()} miles away",
                  text: restaurantDistance==null?"":"${restaurantDistance.toString()} miles away",
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: textLight868686,
                ),
              ],
            ).paddingOnly(left: 11.0),
          ],
        ).paddingOnly(left: 11, right: 11, top: 12, bottom: 12),
      ),
    );
  }
}
