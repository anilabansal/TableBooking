import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/common/common_strings.dart';
import '../../utils/common/widgets_methods/common_button.dart';
import '../../utils/common/widgets_methods/common_sized_box.dart';
import '../../utils/common/widgets_methods/common_text.dart';
import '../home_screen/home_view.dart';
import '../reservation/reservation_view.dart';

class PaymentDoneView extends StatelessWidget {
  final String? paymentMode;
  final dynamic amountPayed;
   PaymentDoneView({Key? key,this.paymentMode,this.amountPayed}) : super(key: key);
   var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: PaymentDoneBody(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                paymentDoneCircle,
                height: 81,
                width: 81,
              ),
              Image.asset(
                paymentDoneTick,
                height: 24,
                width: 37,
              ),
            ],
          ),
          CommonSizedBox(
            height: 29,
          ),
          CommonText(
            text: 'Payment Done',
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
          CommonSizedBox(
            height: 9,
          ),
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Your payment has been done\n',
                    style: TextStyle(
                      color: textLight868686,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: 'by ',
                    style: const TextStyle(
                        color: textLight868686,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // TODO : TERMS & CONDITIONS
                      },
                  ),
                   TextSpan(
                      // text: data[0]["paymentMode"],
                     text: paymentMode,
                      style: const TextStyle(
                        color: black000000,
                        fontSize: 14,
                      )),
                  TextSpan(
                    text: ' of ',
                    style: const TextStyle(
                      color: textLight868686,
                      fontSize: 14,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // TODO : PRIVACY POLICY
                      },
                  ),
                   TextSpan(
                    // text: '\$${data[0]["amountPayed"]}',
                     text: "\$${amountPayed.toString()}",
                    style: const TextStyle(
                      color: black000000,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CommonSizedBox(
            height: 29,
          ),
          // BUTTON
          SizedBox(
            height: 50,
            width: 205,
            child: CommonButton(
              onTap: () {
                Get.offNamed('/reservation');
             //   Get.offUntil( MaterialPageRoute(builder: (context) => const ReservationView()), (route) => (route as GetPageRoute).routeName == '/home');
              },
              text: 'Continue',
              textColor: Colors.white,
              bgColor: redE2211C,
            ),
          ),
        ],
      ),
    );
  }
}
