import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  late TabController tabController;
  final myTabs = [
    const Tab(
      // child: Container(
      //   height: 56,
      //   width: 156,
      //   color: Colors.black,
      // ),
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

// var bookingRestaurantList = <RestaurantBookingList>[].obs;
  RestaurantBookingList?bookingRestaurantList;
  /// reservation booking restaurant api call
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
       bookingRestaurantList = RestaurantBookingList.fromJson(response);

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
