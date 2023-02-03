import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/reservation/add_more_cart_modal.dart';
import '../../model/reservation/book_restaurant_detail_modal.dart';
import '../../model/reservation/reservation_order_more_menu.dart';
import '../../model/reservation/restaurant_booking_list_modal.dart';
import '../../utils/common/common_strings.dart';
import '../../utils/common/toast_message.dart';
import '../../utils/network/api_calls.dart';
import '../user_session/user_session_controller.dart';

class ReservationController extends GetxController
    with  GetSingleTickerProviderStateMixin{
  ApiCalls apiCall = ApiCalls();
  UserSessionController userSessionController = Get.find();
  var bookRestaurantIsLoading = true.obs;
   var bookedRestaurantDetailsLoading = true.obs;
   var isReviewSubmittedLoader = true.obs;
   var orderMoreItemIsLoading = true.obs;
  var selectPaymentMode = "".obs;
  late TabController tabController;
  final myTabs = [
    const Tab(
      text: 'Upcoming',
    ),
    const Tab(text: 'Current'),
    const Tab(text: 'Previous'),
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }
  /// order more items in cart
 List<AddMoreCart>addMoreItemCart = [];


/// upcoming, running, previous restaurant list
  var bookingRestaurantList = RestaurantBookingList().obs;

  /// book restaurant details
  BookRestaurantDetails?bookRestaurantDetails;
  /// order more items
  var  reservationOrderMoreMenu = <ReservationOrderMoreMenu>[].obs;

  /// reservation & rating booking restaurant api call
  Future<dynamic> reservationBookingRestaurantsApiCall({
    dynamic body,
  }) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        restaurantBookingListEndPoint,
        token: userSessionController.token,
      );
      if (response['response'] == 1) {
       // bookingRestaurantList.value =  List<RestaurantBookingList>.from(response["response"]).map((x) =>RestaurantBookingList.fromJson(x));
       bookingRestaurantList.value = RestaurantBookingList.fromJson(response);

        return true;
      } else {
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );


        return false;
      }
    } catch (e) {
      print('Error --------> $e');
    }

    return false;
  }



  /// api call for bookRestaurantDetails api
  Future<dynamic> bookRestaurantDetailsApiCall({
    dynamic body,
  }) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        restaurantBookingDetailEndPoint,
        token: userSessionController.token,
      );
      if (response['response'] == 1) {
        bookRestaurantDetails = BookRestaurantDetails.fromJson(response);

        return true;
      } else {
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );


        return false;
      }
    } catch (e) {
      print('Error --------> $e');
    }

    return false;
  }

  /// submit review api call
  Future<dynamic> submitReviewApiCall({
    dynamic body,
  }) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        submitReviewEndPoint,
        token: userSessionController.token,
      );
      if (response['response'] == 1) {
        ShowToast.show(
          msg: response['errorMessage'],
        );
        return true;
      } else {
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );
        return false;
      }
    } catch (e) {
      print('Error --------> $e');
    }
    return false;
  }

  /// order more food api cll
  Future<dynamic> orderMoreApiCall({
    dynamic body,
  }) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        addMoreReservationMenuEndPoint,
        token: userSessionController.token,
      );
      if (response['response'] == 1) {
          if(response['data']!=null){
            reservationOrderMoreMenu.value = List<ReservationOrderMoreMenu>.from(response["data"].map((x)=>ReservationOrderMoreMenu.fromJson(x)));
          }

        return true;
      } else {
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );


        return false;
      }
    } catch (e) {
      print('Error --------> $e');
    }

    return false;
  }
}
