import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/view/payment/widgets/add_card-details_body_rows.dart';
import 'package:flutter/material.dart';

class AddCardDetailsMain extends StatelessWidget {
  const AddCardDetailsMain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // ROW ONE
        AddCardDetailsRowOne(),
        // Row TWO
        AddCardDetailsRowTwo(),
        //   ROW THREE
        AddCardDetailsRowThree(),
        //  PRIVACY POLICY TERMS N CONDITIONS
        AddCardDetailsPrivacyPolicy(),
        //   Button
        CommonButton(
          text: 'Save Card',
          bgColor: redE2211C,
          textColor: Colors.white,
        ),
      ],
    );
  }
}
