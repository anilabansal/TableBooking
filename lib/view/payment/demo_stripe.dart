// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:http/http.dart' as http;
// class PaymentStripeDemo extends StatefulWidget {
//   const PaymentStripeDemo({Key? key}) : super(key: key);
//   @override
//   State<PaymentStripeDemo> createState() => _PaymentStripeDemoState();
// }
// class _PaymentStripeDemoState extends State<PaymentStripeDemo> {
//   Map<String, dynamic>?paymentIntentData;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           InkWell(
//             onTap: () async{
//               await makePayment();
//             },
//             child: const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text("Pay"),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Future<void> makePayment()async{
//     try{
//       paymentIntentData = await createPaymentIntent("20", "USD");
//       // await Stripe.instance.initGooglePay(params)
//       await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
//         paymentIntentClientSecret: paymentIntentData!['client_secret'],
//         //applePay: true,
//         googlePay: const PaymentSheetGooglePay(merchantCountryCode: 'IN'),
//       ));
//       //displayPaymentSheet();
//     }
//     catch(e){
//       print(e);
//     }
//   }
//
//   createPaymentIntent(String amount, String currency)async{
// try{
//   Map<String,dynamic>body = {
//     "amount":amount,
//     "currency":currency,
//     "payment_method_types[]":"card",
//   };
//   var response = await http.post(Uri.parse('https://api.stripe.com/v1/payment_intents'),
//     body: body,
//     headers: {
//     "Authorization":'Bearer sk_live_Xbc4xLuO9GrPUVcHn3QxUtvq',
//       "Content-Type":"application/x-www-form-urlencoded"
//     }
//   );
//   return jsonDecode(response.body.toString());
//
// }
//
//   catch(e){
//   print(e);
//   }
// }}
//
