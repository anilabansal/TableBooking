import 'package:booking_table/bindings/auth_bindings.dart';
import 'package:booking_table/view/auth_screens/auth_selection_view.dart';
import 'package:booking_table/view/reservation/widgets/booking_details_view.dart';
import 'package:booking_table/view/home_screen/filter_view.dart';
import 'package:booking_table/view/home_screen/restaurant_details_view.dart';
import 'package:booking_table/view/profile_screen/profile_view.dart';
import 'package:booking_table/view/reservation/widgets/order_more_screen.dart';
import 'package:booking_table/view/service_type/full_service_summary_view.dart';
import 'package:get/get.dart';
import '../view/book_a_table/edit_booking.dart';
import '../view/reservation/widgets/to_go_menu_view.dart';
import '/routes/route_name.dart';
import '/view/auth_screens/get_zip_code_view.dart';
import '/view/auth_screens/otp_view.dart';
import '/view/auth_screens/sign_in_view.dart';
import '/view/book_a_table/book_a_table_view.dart';
import '/view/favourite/favourite_view.dart';
import '/view/home_screen/home_view.dart';
import '/view/notifications/notification_view.dart';
import '/view/payment/add_card_details_view.dart';
import '/view/payment/payment_done_view.dart';
import '/view/privacy_policy/privacy_policy_view.dart';
import '/view/rate/rate_review_view.dart';
import '/view/reservation/reservation_view.dart';
import '/view/service_type/pre_order_view.dart';
import '/view/splash_screen/splash_view.dart';
import '/view/support/support_view.dart';
import '/view/terms_n_conditions/terms_n_conditions_view.dart';
import '../view/home_screen/filter_result_view.dart';
import '../view/payment/payment_method_view.dart';

class AppRoutes {
  static final appRoutes = [
    GetPage(
      name: RouteName.splash,
      page: () => const SplashView(),
      // binding: AuthBindings(),
    ),
    GetPage(
      name: RouteName.createProfile,
      page: () => ProfileView(callFrom: 'Create Profile'),
      binding: MainBindings(),
    ),
    GetPage(
      name: RouteName.authSelectionScreen,
      page: () => const AuthSelectionView(),
      binding: MainBindings(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => SignInView(callFrom: 'Login'),
      binding: MainBindings(),
    ),
    GetPage(
      name: RouteName.register,
      page: () => SignInView(callFrom: 'Register'),
      binding: MainBindings(),
    ),
    GetPage(
      name: RouteName.loginOTP,
      page: () => OtpView(callFrom: 'Login'),
      binding: MainBindings(),
    ),
    GetPage(
      name: RouteName.registerOTP,
      page: () => OtpView(callFrom: 'Register'),
      binding: MainBindings(),
    ),
    GetPage(
      name: RouteName.home,
      page: () => HomeView(),
      binding: MainBindings(),
    ),
    GetPage(
      name: RouteName.support, page: () => SupportView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.favourite,
      page: () => const FavouriteView(),
      binding: MainBindings(),
    ),
    GetPage(
      name: RouteName.notifications, page: () => NotificationView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.addCardDetails,
      page: () => AddCreditCardDetailsView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.paymentDone, page: () => PaymentDoneView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.privacyPolicy,
      page: () => const PrivacyPolicyView(),
      binding: MainBindings(),
    ),
    GetPage(
        name: RouteName.termsNConditions,
        page: () => const TermsNConditionsView(),
        binding: MainBindings()
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
      name: RouteName.reservation,
      page: () => const ReservationView(),
      binding: MainBindings(),
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
    // GetPage(
    //   name: RouteName.midService,
    //   page: () => MidServiceSummaryView(),
    //   // binding: ,
    // ),
    GetPage(
      name: RouteName.preOrder, page: () => const PreOrderView(),
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
      name: RouteName.bookingDetailsRunning,
      page: () => BookingDetailsView(callFrom: 'Running'),
      // binding: ,
    ),
    GetPage(
      name: RouteName.bookATable,
      page: () => BookATableView(
        callFrom: 'book',
      ),
      binding: MainBindings(),
    ),
    GetPage(
      name: RouteName.editATable,
      page: () => const EditBooking(
          //callFrom: 'edit',
          ),
      // binding: ,
    ),
    GetPage(
      name: RouteName.zipCodeView,
      page: () => const GetZipCodeView(),
      binding: MainBindings(),
      // binding: AuthBindings()
    ),
    GetPage(
      name: RouteName.editProfile,
      page: () => ProfileView(
        callFrom: 'Edit',
      ),
      binding: MainBindings(),
    ),
    GetPage(
      name: RouteName.filterScreen, page: () => const FilterView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.filterResultScreen,
      page: () => const FilterResultView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.paymentMethod,
      page: () => const PaymentMethodView(callFrom: 'Drawer'),
      binding: MainBindings(),
      // binding: ,
    ),

    GetPage(
      name: RouteName.bookingConfirmPayment,
      page: () => const PaymentMethodView(callFrom: 'ConfirmBooking'),
      binding: MainBindings(),
    ),
    GetPage(name: RouteName.orderMoreConfirmPayment,  page: () => const PaymentMethodView(callFrom: 'OrderMore'),
      binding: MainBindings(),),
    GetPage(
      name: RouteName.restaurantDetails,
      page: () => const RestaurantDetailView(),
      binding: MainBindings(),
    ),
    GetPage(
      name: RouteName.preOrder,
      page: () => const PreOrderView(),
      // binding: ,
    ),
    GetPage(
      name: RouteName.orderMoreFoodReservation,
      page: () => const ReservationOrderMore(),
      binding: MainBindings(),
    ),
    GetPage(name: RouteName.toGoOrderMenu, page: () => ToGoMenuView())
  ];
}
