import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:booking_table/model/restaurant/restaurantlist.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/network/api_calls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /// Initializes the controller.

  static final HomeController homeController = HomeController._internal();

  factory HomeController() {
    return homeController;
  }

  HomeController._internal();
  var homeRestaurantList = [].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getRestaurantDetailsUsingLatLon();
    print(UserSessionController().isLogin);
    super.onInit();
  }

  var selectedIndex = 0.obs;
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  var serviceType = ''.obs;
  var likedRestaurant = false.obs;
  var restaurantFilter = true.obs;
  void updateRestaurantLike() {
    likedRestaurant.value = !likedRestaurant.value;
    update();
  }

  var longitude = '76.69060936300099'.obs;
  var latitude = '30.713649330499276'.obs;
  ApiCalls apiCall = ApiCalls();

  /// Get Restaurant Details using Latitude and Longitude.
  Future<dynamic> getRestaurantDetailsUsingLatLon({
    dynamic body,
    String? endPoint,
  }) async {
    try {
      final response = await apiCall.callPostApi(body!, endPoint!);
      if (response['response'] == 1) {
        homeRestaurantList.value = (response['restaurantlist'])
            ?.map((e) => Restaurantlist.fromMap(e as Map<String, dynamic>))
            .toList();
        print('Repsonse List=====> $homeRestaurantList');
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
