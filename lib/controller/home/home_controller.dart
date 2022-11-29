import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:booking_table/model/restaurant/restaurant_list_model.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/network/api_calls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  /// Initializes the controller.
  @override
  void onInit() {
    // ProfileController().getProfileDetails();
    super.onInit();
  }

  static final HomeController homeController = HomeController._internal();

  factory HomeController() {
    return homeController;
  }

  HomeController._internal();
  UserSessionController userSessionController = Get.find();

  // var selectedIndex = 0.obs;
  var longitude = '76.69060936300099'.obs;
  var latitude = '30.713649330499276'.obs;
  ApiCalls apiCall = ApiCalls();
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  var serviceType = ''.obs;
  var likedRestaurant = false.obs;
  var restaurantFilter = true.obs;
  var homeRestaurantList = [].obs;
  var favRestaurantList = [].obs;
  var homeRestaurantCount = 0.obs;
  var isLoading = false.obs;

  void updateRestaurantLikeHome({index, restaurantId}) async {
    await favRestaurantUpdate(body: {"restaurantId": restaurantId})
        .then((value) {
      if (value) {
        homeRestaurantList[index].isFavourite =
            !homeRestaurantList[index].isFavourite;
      } else {
        return;
      }
    });

    update();
  }

  void updateRestaurantLikeFav({index, restaurantId}) async {
    await favRestaurantUpdate(body: {"restaurantId": restaurantId})
        .then((value) {
      if (value) {
        favRestaurantList[index].isFavourite =
            !favRestaurantList[index].isFavourite;
        favRestaurantList.removeAt(index);
        getRestaurantDetailsUsingLatLon();
      } else {
        return;
      }
    });

    update();
  }

  /// Get Restaurant Details using Latitude and Longitude.
  Future<bool> getRestaurantDetailsUsingLatLon({
    dynamic body,
  }) async {
    try {
      final response = await apiCall.callPostApi(
        {
          "longitude": '76.69060936300099',
          "latitude": '30.713649330499276',
        },
        zipCode,
        token: userSessionController.token,
      );
      if (response['response'] == 1) {
        homeRestaurantList.value = (response['restaurantlist'])
            ?.map((e) => RestaurantList.fromMap(e as Map<String, dynamic>))
            .toList();
        homeRestaurantCount.value = response['totalCount'];
        print('Repsonse List=====> $homeRestaurantList');
        print('Total Restaurant List=====> $homeRestaurantCount');
        isLoading.value = false;
        update();
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

  /// Favourite Restaurants List
  Future<bool> favRestaurantDetailList() async {
    try {
      final response = await apiCall.callPostApi(
        {
          'latitude': "76.69060936300099",
          'longitude': "30.713649330499276",
        },
        favRestaurantDetails,
        token: userSessionController.token,
      );
      if (response['response'] == 1) {
        favRestaurantList.value = (response['restaurantlist'])
            ?.map((e) => RestaurantList.fromMap(e as Map<String, dynamic>))
            .toList();
        print('Repsonse List=====> ${favRestaurantList.value}');
        print('Total Restaurant List=====> $favRestaurantList');
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

  Future<bool> favRestaurantUpdate({dynamic body}) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        favRestaurantUpdateString,
        token: userSessionController.token,
      );
      if (response['response'] == 1) {
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
