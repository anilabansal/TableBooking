// import 'dart:convert';
// import 'package:booking_table/utils/common/widgets_methods/progress_loader.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:get/get.dart';
// import '../../view/payment/payment_done_view.dart';
// import '../book_a_table/book_a_table_controller.dart';
// import '../reservation & rating/reservation_controller.dart';
// import '../reservation & rating/to_go_reservation_controller.dart';
// import '../restaurant_details/restaurant_details_controller.dart';
//
// class CreditCardController extends GetxController {
//   BookATableController bookATableController = Get.put(BookATableController());
//   RestaurantDetailsController restaurantDetailsController =
//       Get.put(RestaurantDetailsController());
//   ToGoReservationController toGoReservationController =
//       Get.put(ToGoReservationController());
//   ReservationController reservationController =
//       Get.put(ReservationController());
//   Map<String, dynamic>? paymentIntent;
//
//   Future<void> makePayment(
//     context, {
//     required amount,
//     required String currency,
//     specialEvent,
//     tipAmount,
//     restaurantId,
//     bookingDate,
//     partySize,
//     serviceType,
//     bookingTime,
//     specialRequest,
//     slotId,
//     callFrom,
//     bookingId,
//     // amountToBeDisplayed,
//   }) async {
//     try {
//       paymentIntent = await createPaymentIntent(amount, currency);
//       Navigator.pop(context);
//       // print('paymentIntent --->$paymentIntent');
//
//       //STEP 2: Initialize Payment Sheet
//       await Stripe.instance
//           .initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret:
//               paymentIntent!['client_secret'], //Gotten from payment intent
//           style: ThemeMode.dark,
//           merchantDisplayName: 'SERVREST, LLC',
//         ),
//       )
//           .then((value) {
//         print('status --->${paymentIntent!['status']}');
//         print('id --->${paymentIntent!['id']}');
//       });
//       //STEP 3: Display Payment sheet
//       displayPaymentSheet(
//         context,
//         specialEvent,
//         tipAmount,
//         restaurantId,
//         bookingDate,
//         partySize,
//         serviceType,
//         bookingTime,
//         specialRequest,
//         slotId,
//         amount,
//         callFrom,
//         bookingId: bookingId,
//       );
//     } catch (err) {
//       throw Exception(err);
//     }
//   }
//
//   displayPaymentSheet(
//       context,
//       specialEvent,
//       tipAmount,
//       restaurantId,
//       bookingDate,
//       partySize,
//       serviceType,
//       bookingTime,
//       specialRequest,
//       slotId,
//       amount,
//       callFrom,
//       {bookingId}) async {
//     try {
//       await Stripe.instance.presentPaymentSheet().then((value) {
//         /// if payment is done then to hit confirm booking api
//         if (callFrom == 'confirm Booking') {
//           bookATableController.confirmBookIsLoading.value = true;
//           ProgressDialog.showProgressDialog(context);
//           bookATableController.confirmBookingApiCall(body: {
//             "BookingId": 0,
//             "Items": jsonDecode(
//                 jsonEncode(restaurantDetailsController.cartItemsList)),
//             "SpecialEvent": specialEvent,
//             "PaymentTypeId": 1,
//             "Tip": tipAmount,
//             "RestaurantId": restaurantId,
//             "BookingDate": bookingDate,
//             "PartySize": partySize,
//             "ServiceType": serviceType,
//             "BookingTime": bookingTime,
//             "SpecialRequest": specialRequest,
//             "SlotId": slotId,
//           }).then((value) {
//             bookATableController.confirmBookIsLoading.value = false;
//             Navigator.pop(context);
//             if (value) {
//               // Get.off('/payment-done');
//               //   Get.offNamed('/payment-done');
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                     builder: (BuildContext context) => PaymentDoneView(
//                       paymentMode: "Credit Card",
//                       amountPayed: double.parse(amount),
//                     ),
//                   ),
//                   (Route<dynamic> route) => route.isFirst);
//             }
//           });
//         }
//
//         /// if call From order - more
//         else if (callFrom == 'order More') {
//           reservationController.orderMoreConfirmationIsLoading.value = true;
//           ProgressDialog.showProgressDialog(context);
//           reservationController.orderMoreConfirmationApiCall(body: {
//             "BookingId": bookingId,
//             "Items":
//                 jsonDecode(jsonEncode(reservationController.cartNewItemsList)),
//             "ToGoItems":
//                 jsonDecode(jsonEncode(toGoReservationController.toGoCart)),
//             "PaymentTypeId": 1,
//             "TipAmount": reservationController
//                     .bookRestaurantDetails!.bookinglistresponse.tip!
//                     .endsWith('%')
//                 ? reservationController.tipAddedOrderMore
//                 : 0.0,
//           }).then((value) {
//             reservationController.orderMoreConfirmationIsLoading.value = false;
//             Navigator.pop(context);
//             if (value) {
//               reservationController.cartNewItemsList.clear();
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                     builder: (BuildContext context) => PaymentDoneView(
//                       paymentMode: "Credit Card",
//                       amountPayed: double.parse(amount),
//                     ),
//                   ),
//                   (Route<dynamic> route) => route.isFirst);
//             }
//           });
//         }
//       }).onError((error, stackTrace) {
//         throw Exception(error);
//       });
//     } on StripeException catch (e) {
//       print('Error is:---> $e');
//       AlertDialog(
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               children: const [
//                 Icon(
//                   Icons.cancel,
//                   color: Colors.red,
//                 ),
//                 Text("Payment Failed"),
//               ],
//             ),
//           ],
//         ),
//       );
//     } catch (e) {
//       print('$e');
//     }
//   }
//
//   createPaymentIntent(String amount, String currency) async {
//     try {
//       //Request body
//       Map<String, dynamic> body = {
//         'amount': calculateAmount(amount),
//         'currency': currency,
//         "payment_method_types[]": "card",
//       };
//
//       //Make post request to Stripe
//       var response = await http.post(
//         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         headers: {
//           'Authorization': 'Bearer sk_test_2RbpFNKPWSAk0a1xP9w081pT',
//           'Content-Type': 'application/x-www-form-urlencoded'
//         },
//         body: body,
//       );
//
//       if (response.statusCode == 200) {
//         print("response-->${response.statusCode}");
//         return json.decode(response.body);
//       }
//     } catch (err) {
//       throw Exception(err.toString());
//     }
//   }
//
//   calculateAmount(String amount) {
//     final calculatedAmount = (int.parse(amount)) * 100;
//     return calculatedAmount.toString();
//   }
//
//   void popUntilRoot(context) {
//     if (Navigator.of(context).canPop()) {
//       Navigator.pop(context);
//       popUntilRoot(context);
//     }
//   }
// }
