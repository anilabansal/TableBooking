import 'package:booking_table/view/auth_screens/sign_in_view.dart';
import 'package:booking_table/view/home_screen/filter_result_screen.dart';
import 'package:booking_table/view/home_screen/filter_screen.dart';
import 'package:booking_table/view/home_screen/home_view.dart';
import 'package:booking_table/view/home_screen/restaurant_details_screen.dart';
import 'package:booking_table/view/payments/card_scan_pop_up.dart';
import 'package:booking_table/view/payments/payment_method_screen.dart';
import 'package:booking_table/view/payments/scan_cards_screen.dart';
import 'package:booking_table/view/profile_screen/create_profile_screen.dart';
import 'package:booking_table/view/profile_screen/edit_profile_screen.dart';
import 'package:booking_table/view/splash_screen/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'LaTo'),
      home:   Material(
     child: HomeView(),
   //      child: CardScanPopUpView(),
      ),
    );
  }
}
