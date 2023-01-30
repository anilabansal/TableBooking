import 'dart:convert';
import 'package:booking_table/utils/common/widgets_methods/progress_loader.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import '../../view/home_screen/restaurant_details_view.dart';
import '../../view/payment/payment_done_view.dart';
import '../book_a_table/book_a_table_controller.dart';
import '../restaurant_details/restaurant_details_controller.dart';

class CreditCardController extends GetxController {
  BookATableController bookATableController = Get.find();
  RestaurantDetailsController restaurantDetailsController = Get.find();
  Map<String, dynamic>? paymentIntent;

  Future<void> makePayment(context,
      {required amount,
      required String currency,
      specialEvent,
      tipAmount,
      restaurantId,
      bookingDate,
      partySize,
      serviceType,
      bookingTime,
      specialRequest,
      slotId}) async {
    try {
      paymentIntent = await createPaymentIntent(amount, currency);
      Navigator.pop(context);
      print('paymentIntent --->$paymentIntent');

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret:
                  paymentIntent!['client_secret'], //Gotten from payment intent
              style: ThemeMode.dark,
              merchantDisplayName: 'SERVREST, LLC',
            ),
          )
          .then((value) {});
      //STEP 3: Display Payment sheet
      displayPaymentSheet(
        context,
        specialEvent,
        tipAmount,
        restaurantId,
        bookingDate,
        partySize,
        serviceType,
        bookingTime,
        specialRequest,
        slotId,
        amount,
      );
    } catch (err) {
      throw Exception(err);
    }
  }

  displayPaymentSheet(
      context,
      specialEvent,
      tipAmount,
      restaurantId,
      bookingDate,
      partySize,
      serviceType,
      bookingTime,
      specialRequest,
      slotId,
      amount) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        /// if payment is done then to hit confirm booking api
        bookATableController.confirmBookIsLoading.value = true;
        ProgressDialog.showProgressDialog(context);
        bookATableController.confirmBookingApiCall(body: {
          "BookingId": 0,
          "Items": jsonDecode(jsonEncode(restaurantDetailsController.cartItemsList)),
          "SpecialEvent": specialEvent,
          "PaymentTypeId": 1,
          "Tip": tipAmount,
          "RestaurantId": restaurantId,
          "BookingDate": bookingDate,
          "PartySize": partySize,
          "ServiceType": serviceType,
          "BookingTime": bookingTime,
          "SpecialRequest": specialRequest,
          "SlotId": slotId,
        }).then((value) {
          bookATableController.confirmBookIsLoading.value = false;
          Navigator.pop(context);
          if (value) {
            // Get.off('/payment-done');
            //   Get.offNamed('/payment-done');
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (BuildContext context) => PaymentDoneView(
                  paymentMode: "Credit Card",
                  amountPayed: amount,
                ),),
                    (Route<dynamic> route) => route.isFirst
            );
            // popUntilRoot(context);
            // Get.offUntil(
            //     MaterialPageRoute(builder: (context) => PaymentDoneView()),
            //     (route) =>
            //         (route as GetPageRoute).routeName == '/restaurant-details');
            //   Get.offAllNamed('/payment-done',
            //   arguments: [
            //     {
            //       "paymentMode":"Credit Card",
            //       "amountPayed":amount
            //     }
            //   ]);
          }
        });
        //   Get.toNamed('/payment-done');
        // showDialog(
        //   context: context,
        //   builder: (_) => AlertDialog(
        //     content: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       children: const [
        //         Icon(
        //           Icons.check_circle,
        //           color: Colors.green,
        //           size: 100.0,
        //         ),
        //         SizedBox(height: 10.0),
        //         Text("Payment Successful!"),
        //       ],
        //     ),
        //   ),
        // );
        // paymentIntent = null;
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed"),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        // 'payment_method_types[]': 'card'
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer sk_test_2RbpFNKPWSAk0a1xP9w081pT',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );

      if (response.statusCode == 200) {
        print("response-->${response.statusCode}");
        return json.decode(response.body);
      }
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount)) * 100;
    return calculatedAmount.toString();
  }

  void popUntilRoot(context) {
    if (Navigator.of(context).canPop()) {
     Navigator.pop(context);
      popUntilRoot(context);

    }
  }
  }

