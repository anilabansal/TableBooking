import 'package:booking_table/routes/route_name.dart';
import 'package:booking_table/view/auth_screens/get_zip_code_view.dart';
import 'package:booking_table/view/auth_screens/otp_screen.dart';
import 'package:booking_table/view/auth_screens/sign_in_view.dart';
import 'package:booking_table/view/book_a_table/book_a_table_main.dart';
import 'package:booking_table/view/favourite/favourite_view.dart';
import 'package:booking_table/view/home_screen/home_view.dart';
import 'package:booking_table/view/notifications/notification_view.dart';
import 'package:booking_table/view/payment/add_card_details.dart';
import 'package:booking_table/view/payment/payment_done.dart';
import 'package:booking_table/view/privacy_policy/privacy_policy.dart';
import 'package:booking_table/view/rate/rate_review.dart';
import 'package:booking_table/view/reservation/reservation_view.dart';
import 'package:booking_table/view/reservation/widgets/previous_reservation.dart';
import 'package:booking_table/view/reservation/widgets/upcoming_reservation.dart';
import 'package:booking_table/view/service_type/pre_order.dart';
import 'package:booking_table/view/service_type/widgets/full_service_summary_details_button_view.dart';
import 'package:booking_table/view/service_type/widgets/mid_service_summary_details_button_view.dart';
import 'package:booking_table/view/splash_screen/splash_view.dart';
import 'package:booking_table/view/support/support_view.dart';
import 'package:booking_table/view/terms_n_conditions/terms_n_conditions.dart';
import 'package:get/get.dart';

appRoutes() => [
      GetPage(name: RouteName.home, page: () => const HomeView()),
      GetPage(name: RouteName.splash, page: () => const SplashView()),
      GetPage(
        name: RouteName.login,
        page: () => SignInView(
          callFrom: 'Login',
        ),
      ),
      GetPage(
          name: RouteName.register,
          page: () => SignInView(callFrom: 'Register')),
      GetPage(
          name: RouteName.loginOTP,
          page: () => OtpScreenView(callFrom: 'Login')),
      GetPage(
          name: RouteName.registerOTP,
          page: () => OtpScreenView(callFrom: 'Register')),
      GetPage(name: RouteName.support, page: () => SupportView()),
      GetPage(name: RouteName.favourite, page: () => FavouriteView()),
      GetPage(name: RouteName.notifications, page: () => NotificationView()),
      GetPage(
          name: RouteName.addCardDetails,
          page: () => AddCreditCardDetailsView()),
      GetPage(name: RouteName.paymentDone, page: () => PaymentDoneView()),
      GetPage(name: RouteName.privacyPolicy, page: () => PrivacyPolicyView()),
      GetPage(
          name: RouteName.termsNConditions, page: () => TermsNConditionsView()),
      GetPage(name: RouteName.reviews, page: () => RateReviewView()),
      GetPage(name: RouteName.paymentDone, page: () => PaymentDoneView()),
      GetPage(name: RouteName.reservation, page: () => ReservationView()),
      GetPage(
          name: RouteName.fullService,
          page: () => FullSummaryBookingDetailsView()),
      GetPage(
          name: RouteName.midService,
          page: () => MidSummaryBookingDetailsView()),
      GetPage(name: RouteName.preOrder, page: () => PreOrderView()),
      GetPage(
          name: RouteName.previousBooking, page: () => PreviousReservations()),
      GetPage(
          name: RouteName.upcomingBooking, page: () => UpComingReservations()),
      GetPage(name: RouteName.bookATable, page: () => BookATableView()),
      GetPage(name: RouteName.zipCodeView, page: () => GetZipCodeView()),
    ];
