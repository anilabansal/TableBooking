import 'package:booking_table/utils/common/common_font.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/common/common_colors.dart';
import '../../../utils/common/images_string.dart';

class SearchBoxScreen extends StatelessWidget {
  const SearchBoxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: greyB3F5F5F5),
                  child: Center(
                    child: CommonText(
                      text: "Search",
                      color: black4D000000,
                      fontSize: 18,
                      fontFamily: interFont,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed('/filter-screen');
                },
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: redE2211C),
                  child: Image.asset(filterImage),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
