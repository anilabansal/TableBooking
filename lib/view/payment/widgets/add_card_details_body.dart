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
      children: const <Widget>[
        // ROW ONE
        AddCardDetailsRowOne(),
        // Row TWO
        AddCardDetailsRowTwo(),
        //   ROW THREE
        AddCardDetailsRowThree(),
      ],
    );
  }
}
