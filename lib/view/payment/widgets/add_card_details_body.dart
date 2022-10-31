import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/view/payment/widgets/add_card_details_body_rows.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCardDetailsBody extends StatelessWidget {
  const AddCardDetailsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 31.0, right: 26, top: 54),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // ROW ONE
              const AddCardDetailsRowOne(),
              // Row TWO
              const AddCardDetailsRowTwo(),
              //   ROW THREE
              AddCardDetailsRowThree(),
              //  PRIVACY POLICY TERMS N CONDITIONS
              const AddCardDetailsPrivacyPolicy(),
              //   Button
              InkWell(
                onTap: () {
                  Get.toNamed('/book-a-table');
                },
                child: CommonButton(
                  text: 'Save Card',
                  bgColor: redE2211C,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
