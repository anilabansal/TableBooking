import 'package:booking_table/bindings/auth_bindings.dart';
import 'package:booking_table/controller/location/location_controller.dart';
import 'package:booking_table/routes/app_routes.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'controller/user_session/user_session_controller.dart';
//
// Future<void> _messageHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('background message ==========> ${message.notification!.body}');
// }
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey = "pk_live_STu7MEuLIwnKoCjJ4acieuAw";
  await GetStorage.init();
  UserSessionController userSession = Get.put(UserSessionController());
  userSession.init();
  // await Firebase.initializeApp();
  // FCMService().init();
  // FirebaseMessaging.onBackgroundMessage(_messageHandler);
  // await LocalNotificationService().init();
  // Stripe.publishableKey =
  // "pk_test_v6mQmgIwxFEq26Byof5rsyIQ";
  // Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  // await Stripe.instance.applySettings();
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
    // FCMService().getFCMToken();
    // FCMService().showForGroundMessage();
    // TODO: implement initState
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Table Booking',
      initialRoute: '/',
      getPages: AppRoutes.appRoutes,
      initialBinding: MainBindings(),
      theme: ThemeData(fontFamily: mainLaToFont,),
      // home: CardScanPopUpBody(),
    );
  }
}
