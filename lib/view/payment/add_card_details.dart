import 'package:booking_table/view/payment/widgets/add_card_details_appbar.dart';
import 'package:booking_table/view/payment/widgets/add_card_details_body.dart';
import 'package:flutter/material.dart';

class AddCreditCardDetailsView extends StatelessWidget {
  const AddCreditCardDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 31.0, right: 26, top: 54),
          child: AddCardDetailsBody(),
        ),
      ),
    );
  }
}
