import 'package:get/get.dart';
import '/routes/route_name.dart';
import '/view/auth_screens/get_zip_code_view.dart';
import '/view/auth_screens/otp_screen.dart';
import '/view/auth_screens/sign_in_view.dart';
import '/view/book_a_table/book_a_table_main.dart';
import '/view/favourite/favourite_view.dart';
import '/view/home_screen/home_view.dart';
import '/view/notifications/notification_view.dart';
import '/view/payment/add_card_details.dart';
import '/view/payment/payment_done.dart';
import '/view/privacy_policy/privacy_policy.dart';
import '/view/rate/rate_review.dart';
import '/view/reservation/reservation_view.dart';
import '/view/reservation/widgets/previous_reservation.dart';
import '/view/reservation/widgets/upcoming_reservation.dart';
import '/view/service_type/pre_order.dart';
import '/view/service_type/widgets/full_service_summary_details_button_view.dart';
import '/view/service_type/widgets/mid_service_summary_details_button_view.dart';
import '/view/splash_screen/splash_view.dart';
import '/view/support/support_view.dart';
import '/view/terms_n_conditions/terms_n_conditions.dart';

appRoutes() => [
      GetPage(
        name: RouteName.home, page: () => HomeView(),
        // binding: ,
      ),
      GetPage(
        name: RouteName.splash, page: () => const SplashView(),
        // binding: ,
      ),
      GetPage(
        name: RouteName.login, page: () => SignInView(callFrom: 'Login'),
        // binding: ,
      ),
      GetPage(
        name: RouteName.register, page: () => SignInView(callFrom: 'Register'),
        // binding: ,
      ),
      GetPage(
        name: RouteName.loginOTP, page: () => OtpScreenView(callFrom: 'Login'),
        // binding: ,
      ),
      GetPage(
        name: RouteName.registerOTP,
        page: () => OtpScreenView(callFrom: 'Register'),
        // binding: ,
      ),
      GetPage(
        name: RouteName.support, page: () => SupportView(),
        // binding: ,
      ),
      GetPage(
        name: RouteName.favourite, page: () => FavouriteView(),
        // binding: ,
      ),
      GetPage(
        name: RouteName.notifications, page: () => NotificationView(),
        // binding: ,
      ),
      GetPage(
        name: RouteName.addCardDetails, page: () => AddCreditCardDetailsView(),
        // binding: ,
      ),
      GetPage(
        name: RouteName.paymentDone, page: () => PaymentDoneView(),
        // binding: ,
      ),
      GetPage(
        name: RouteName.privacyPolicy, page: () => PrivacyPolicyView(),
        // binding: ,
      ),
      GetPage(
        name: RouteName.termsNConditions, page: () => TermsNConditionsView(),
        // binding: ,
      ),
      GetPage(
        name: RouteName.reviews, page: () => RateReviewView(),
        // binding: ,
      ),
      GetPage(
        name: RouteName.paymentDone, page: () => PaymentDoneView(),
        // binding: ,
      ),
      GetPage(
        name: RouteName.reservation, page: () => ReservationView(),
        // binding: ,
      ),
      GetPage(
        name: RouteName.fullService,
        page: () => FullSummaryBookingDetailsView(),
        // binding: ,
      ),
      GetPage(
        name: RouteName.midService, page: () => MidSummaryBookingDetailsView(),
        // binding: ,
      ),
      GetPage(
        name: RouteName.preOrder, page: () => PreOrderView(),
        // binding: ,
      ),
      GetPage(
        name: RouteName.previousBooking, page: () => PreviousReservations(),
        // binding: ,
      ),
      GetPage(
        name: RouteName.upcomingBooking, page: () => UpComingReservations(),
        // binding: ,
      ),
      GetPage(
        name: RouteName.bookATable, page: () => BookATableView(),
        // binding: ,
      ),
      GetPage(
        name: RouteName.zipCodeView, page: () => GetZipCodeView(),
        // binding: ,
      ),
    ];
