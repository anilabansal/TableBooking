import 'package:booking_table/bindings/auth_bindings.dart';
import 'package:booking_table/routes/app_routes.dart';
import 'package:booking_table/utils/common/common_strings.dart';
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
      initialRoute: '/',
      getPages: AppRoutes.appRoutes,
      initialBinding: AuthBindings(),
      theme: ThemeData(fontFamily: mainLaToFont),
    );
  }
}
