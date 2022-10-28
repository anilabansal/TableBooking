import 'package:booking_table/routes/app_routes.dart';
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
      title: 'Flutter Demo',
      getPages: AppRoutes.appRoutes,
      theme: ThemeData(fontFamily: 'LaTo'),
      home: const Material(
        child: SplashView(),
        //      child: CardScanPopUpView(),
      ),
    );
  }
}
