import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/images_string.dart';
import 'package:booking_table/utils/common/widgets_methods/common_sized_box.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonRestaurantNameDistance extends StatelessWidget {
  const CommonRestaurantNameDistance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          bookATableImage,
          height: 57,
          width: 57,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: 'Venisa’s Kitchen',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            CommonSizedBox(
              height: 5,
            ),
            CommonText(
              text: '5 miles away',
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: textLight868686,
            ),
          ],
        ).paddingOnly(left: 11.0),
      ],
    ).paddingOnly(left: 28, top: 20);
  }
}
