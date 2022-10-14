import 'package:booking_table/routes/route_name.dart';
import 'package:booking_table/view/auth_screens/otp_screen.dart';
import 'package:booking_table/view/auth_screens/sign_in_view.dart';
import 'package:booking_table/view/home_screen/home_view.dart';
import 'package:booking_table/view/splash_screen/splash_view.dart';
import 'package:get/get.dart';

appRoutes() => [
      GetPage(name: RouteName.home, page: () => const HomeView()),
      GetPage(name: RouteName.splash, page: () => const SplashView()),
      GetPage(
          name: RouteName.login,
          page: () => SignInView(
                callFrom: 'Login',
              )),
      GetPage(
          name: RouteName.register,
          page: () => SignInView(callFrom: 'Register')),
      GetPage(
          name: RouteName.loginOTP,
          page: () => OtpScreenView(callFrom: 'Login')),
      GetPage(
          name: RouteName.registerOTP,
          page: () => OtpScreenView(callFrom: 'Register')),
    ];
