import 'package:booking_table/view/auth_screens/auth_selection_view.dart';
import 'package:booking_table/view/book_a_table/booking_details.dart';
import 'package:booking_table/view/home_screen/filter_screen.dart';
import 'package:booking_table/view/home_screen/restaurant_details_screen.dart';
import 'package:booking_table/view/profile_screen/profile_screen.dart';
import 'package:booking_table/view/service_type/full_service_summary.dart';
import 'package:booking_table/view/service_type/mid_service_summary.dart';
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
import '/view/service_type/pre_order.dart';
import '/view/splash_screen/splash_view.dart';
import '/view/support/support_view.dart';
import '/view/terms_n_conditions/terms_n_conditions.dart';
import '../view/home_screen/filter_result_screen.dart';
import '../view/payment/payment_method_screen.dart';

class AppRoutes {
  static final appRoutes = [
    GetPage(
      name: RouteName.home, page: () => HomeView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.splash, page: () => const SplashView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.createProfile,
      page: () => EditProfileScreen(callFrom: 'Create Profile'),
      // binding: ,
    ),
    GetPage(
      name: RouteName.authSelectionScreen,
      page: () => const AuthSelectionView(),
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
      name: RouteName.loginOTP,
      page: () => const OtpScreenView(callFrom: 'Login'),
      // binding: ,
    ),
    GetPage(
      name: RouteName.registerOTP,
      page: () => const OtpScreenView(callFrom: 'Register'),
      // binding: ,
    ),
    GetPage(
      name: RouteName.support, page: () => const SupportView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.favourite, page: () => const FavouriteView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.notifications, page: () => NotificationView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.addCardDetails,
      page: () => const AddCreditCardDetailsView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.paymentDone, page: () => const PaymentDoneView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.privacyPolicy, page: () => const PrivacyPolicyView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.termsNConditions,
      page: () => const TermsNConditionsView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.reviews, page: () => const RateReviewView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.paymentDone, page: () => const PaymentDoneView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.reservation, page: () => const ReservationView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.fullService,
      page: () => FullServiceSummaryView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.fullServicePreOrder,
      page: () => FullServiceSummaryView(callFrom: 'Pre Order'),
      // binding: ,
    ),
    GetPage(
      name: RouteName.midService,
      page: () => MidServiceSummaryView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.preOrder, page: () => PreOrderView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.bookingDetailsUpcoming,
      page: () => BookingDetailsView(callFrom: 'Upcoming'),
      // binding: ,
    ),
    GetPage(
      name: RouteName.bookingDetailsPrevious,
      page: () => BookingDetailsView(callFrom: 'Previous'),
      // binding: ,
    ),
    GetPage(
      name: RouteName.bookATable,
      page: () => BookATableView(
        callFrom: 'book',
      ),
      // binding: ,
    ),
    GetPage(
      name: RouteName.editATable,
      page: () => BookATableView(
        callFrom: 'edit',
      ),
      // binding: ,
    ),
    GetPage(
      name: RouteName.zipCodeView, page: () => const GetZipCodeView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.editProfile,
      page: () => EditProfileScreen(
        callFrom: 'Edit',
      ),
      // binding: ,
    ),
    GetPage(
      name: RouteName.filterScreen, page: () => FilterScreen(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.filterResultScreen,
      page: () => const FilterResultScreen(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.paymentMethod, page: () => const PaymentMethodScreen(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.restaurantDetails,
      page: () => const RestaurantDetailScreen(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.preOrder,
      page: () => PreOrderView(),
      // binding: ,
    ),
  ];
}
