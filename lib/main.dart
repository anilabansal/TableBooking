import 'package:booking_table/bindings/auth_bindings.dart';
import 'package:booking_table/controller/location/location_controller.dart';
import 'package:booking_table/routes/app_routes.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controller/user_session/user_session_controller.dart';

void main() async {
  await GetStorage.init();
  UserSessionController userSession = Get.put(UserSessionController());
  userSession.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  LocationController locationController = Get.put(LocationController());
  @override
  void initState() {
    super.initState();
    locationController.requestPermission();
    // TODO: implement initState
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Table Booking',
      initialRoute: '/',
      getPages: AppRoutes.appRoutes,
      initialBinding: AuthBindings(),
      theme: ThemeData(fontFamily: mainLaToFont),
      // home: SearchLocation(),
    );
  }
}