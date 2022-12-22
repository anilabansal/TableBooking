import 'package:booking_table/view/payment/widgets/add_card_details_body_rows.dart';
import 'package:flutter/material.dart';

class AddCardDetailsBody extends StatelessWidget {
  String callFrom;
  AddCardDetailsBody({
    required this.callFrom,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: AddCardDetailsBodySubDetails(
          callFrom: callFrom,
        ),
      ),
    );
  }
}