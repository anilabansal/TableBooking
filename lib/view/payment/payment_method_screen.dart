import 'package:booking_table/utils/common/common_colors.dart';
import 'package:booking_table/view/payment/widgets/payment_method_body.dart';
import 'package:flutter/material.dart';

import '../../utils/common/widgets_methods/common_app_bar.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: appBarCommon(text: "Payment Method"),
      body: const PaymentMethodBody(),
    );
  }
}
