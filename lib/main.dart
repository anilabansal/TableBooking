import 'package:booking_table/routes/app_routes.dart';
import 'package:booking_table/utils/common/common_font.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Table Booking',
      getPages: AppRoutes.appRoutes,
      theme: ThemeData(fontFamily: mainLaToFont),
      home: const Material(
        child: SplashView(),
        //      child: CardScanPopUpView(),
      ),
    );
  }
}
