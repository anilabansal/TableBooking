import 'package:booking_table/controller/home/home_controller.dart';
import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:booking_table/model/gallery_images/restaurant_image.dart';
import 'package:booking_table/model/rate_and_review/rating_and_review_list.dart';
import 'package:booking_table/model/restaurant_details/data.dart';
import 'package:booking_table/model/restaurant_menu/restaurant_menu_data.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/network/api_calls.dart';
import 'package:get/get.dart';

import '../../model/restaurant_about_us/restaurant_about_us_model.dart';
import '../location/location_controller.dart';

class RestaurantDetailsController extends GetxController {
  HomeController homeController = Get.find();
  UserSessionController userSessionController = Get.find();
  ApiCalls apiCall = ApiCalls();
  var detailsRestaurantList = RestaurantDetailsData().obs;
  var aboutUsRestaurantList = [].obs;
  var galleryImagesRestaurantList = [].obs;
  var menuHeaderRestaurantList = [].obs;
  var rateReviewsRestaurantList = [].obs;
  var totalReviews = "".obs;
  var isLoading = true.obs;
  var selectedIndex = 0.obs;
  var index = 0.obs;
  LocationController locationController = Get.find();
  /// update likes and unlike of restaurants on restaurant details screen
  void updateRestaurantLikes(){
    if(detailsRestaurantList.value.isFavourite == true){
      detailsRestaurantList.value.isFavourite = false;
    }
    else if(detailsRestaurantList.value.isFavourite == false){
      detailsRestaurantList.value.isFavourite = true;
    }
    update();
  }

  /// Favourite i.e like and dislike api call
  void updateRestaurantLikeRestaurantDetails({index, restaurantId}) async {
    await homeController.favRestaurantUpdate(
        body: {"restaurantId": restaurantId}).then((value) {
      if (value) {
        homeController.getRestaurantDetailsUsingLatLon(body: {
          'latitude': locationController.latLng.value.latitude.toString(),
          'longitude': locationController.latLng.value.longitude.toString(),
        });
      } else {
        return;
      }
    });
    update();
  }

  /// Restaurant Details
  Future<dynamic> restaurantDetails({
    dynamic body,
  }) async {
    try {
      final response = await apiCall.callPostApi(body, restaurantDetail,
          token: userSessionController.token);
      if (response['response'] == 1) {
        detailsRestaurantList.value = RestaurantDetailsData.fromMap(
            response['data'] as Map<String, dynamic>);

       //  / About Us
       // await restaurantDetailsAboutUs(body: {"restaurantId": index.value});

        // /// Gallery Images
        // await restaurantDetailsGalleryImages(
        //   body: {"restaurantId": index.value},
        // );

       //  / Menu
       // await restaurantDetailsMenu(body: {"restaurantId": index.value});

        // /// Ratings
        // await restaurantDetailsRatings(body: {"restaurantId": index.value});
        isLoading.value = false;
        update();
        return true;
      } else {
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );
        isLoading.value = false;
        return false;
      }
    } catch (e) {
      print('Error <--------> $e');
    }
    return false;
  }

  /// About Us
  Future<dynamic> restaurantDetailsAboutUs({
    dynamic body,
  }) async {
    try {
      final response = await apiCall.callPostApi(body, aboutUs,
          token: userSessionController.token);

      RestaurantAboutUs restaurantAboutUs = RestaurantAboutUs.fromMap(response);
      if (restaurantAboutUs.response == 1) {
        // aboutUsRestaurantList.value = (response['data'])?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
        //     .toList();
        //
        // print(index.value);
        // print(aboutUsRestaurantList.value);

        aboutUsRestaurantList.value = restaurantAboutUs.data!;
        isLoading.value = false;
        update();
        return true;
      } else {
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );
        isLoading.value = false;
        update();
        return false;
      }
    } catch (e) {
      print('Error --------> $e');
    }

    return false;
  }

  /// Gallery ImagesRestaurantList
  Future<dynamic> restaurantDetailsGalleryImages({
    dynamic body,
  }) async {
    try {
      final response = await apiCall.callPostApi(body, gallery,
          token: userSessionController.token);
      if (response['response'] == 1) {
        galleryImagesRestaurantList.value = (response['restaurantImages'])
            ?.map((e) => RestaurantImage.fromMap(e as Map<String, dynamic>))
            .toList();
        isLoading.value = false;
        update();
        return true;
      } else {
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );
        isLoading.value = false;
        update();
        return false;
      }
    } catch (e) {
      print('Error --------> $e');
    }

    return false;
  }

  /// Menu API
  Future<dynamic> restaurantDetailsMenu({
    dynamic body,
  }) async {
    try {
      final response = await apiCall.callPostApi(body, menu,
          token: userSessionController.token,);
      if (response['response'] == 1) {
        menuHeaderRestaurantList.value = (response['data'])
            ?.map((e) => RestaurantMenuData.fromMap(e as Map<String, dynamic>))
            .toList();
        isLoading.value = false;
        update();
        return true;
      } else {
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );
        isLoading.value = false;
        update();
        return false;
      }
    } catch (e) {
      print('Error --------> $e');
    }

    return false;
  }

  /// Rate and Reviews
  Future<dynamic> restaurantDetailsRatings({
    dynamic body,
  }) async {
    try {
      final response = await apiCall.callPostApi(body, ratings,
          token: userSessionController.token);
      if (response['response'] == 1) {
        rateReviewsRestaurantList.value = (response['ratingAndReviewLists'])
            ?.map((e) => RatingAndReviewList.fromMap(e as Map<String, dynamic>))
            .toList();
        totalReviews.value = response['totalReview'].toString();
        isLoading.value = false;
        update();
        return true;
      } else {
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );
        isLoading.value = false;
        update();
        return false;
      }
    } catch (e) {
      print('Error --------> $e');
    }

    return false;
  }
}
