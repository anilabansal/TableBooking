import 'package:booking_table/model/restaurant/restaurantlist.dart';
import 'package:booking_table/utils/common/common_strings.dart';
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

  var selectedIndex = 0.obs;
  var longitude = '76.69060936300099'.obs;
  var latitude = '30.713649330499276'.obs;
  ApiCalls apiCall = ApiCalls();
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  var serviceType = ''.obs;
  var likedRestaurant = false.obs;
  var restaurantFilter = true.obs;
  var homeRestaurantList = [].obs;
  var homeRestaurantCount = 0.obs;
  var isLoading = false.obs;

  void updateRestaurantLike() {
    likedRestaurant.value = !likedRestaurant.value;
    update();
  }

  /// Get Restaurant Details using Latitude and Longitude.
  Future<bool> getRestaurantDetailsUsingLatLon({
    dynamic body,
  }) async {
    try {
      final response = await apiCall.callPostApi(body, zipCode);
      if (response['response'] == 1) {
        homeRestaurantList.value = (response['restaurantlist'])
            ?.map((e) => Restaurantlist.fromMap(e as Map<String, dynamic>))
            .toList();
        homeRestaurantCount.value = response['totalCount'];
        print('Repsonse List=====> $homeRestaurantList');
        print('Total Restaurant List=====> $homeRestaurantCount');
        isLoading.value = false;
        return true;
      } else {
        isLoading.value = false;
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );
        return false;
      }
    } catch (e) {
      print('Error --------> $e');
    }
    isLoading.value = false;

    return false;
  }
}
