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

import '../../model/restaurant_about_us/restaurant_about_us.dart';

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

  var index = 0.obs;

  /// Favourite
  var likedRestaurant = false.obs;
  void updateRestaurantLike() {
    likedRestaurant.value = !likedRestaurant.value;
    update();
  }

  // @override
  // void onInit() async {
  //   // TODO: implement onInit
  //   // var data = Get.arguments;
  //   // index.value = data[0]['restaurantId'].toInt();
  //   print("About US Index ====>  ${index.value}");
  //   // print(data);
  //
  //   /// Restaurant Details
  //   // await restaurantDetails(body: {"restaurantId": index.value});
  //   // print("Restaurant Detais Data ====>  ${detailsRestaurantList.value}");
  //
  //   // /// About Us
  //   // await restaurantDetailsAboutUs(body: {"restaurantId": index.value});
  //   // print(
  //   //     "Restaurant About US Data ====>  ${aboutUsRestaurantList[0].aboutUs}");
  //   //
  //   // /// Gallery Images
  //   // await restaurantDetailsGalleryImages(body: {"restaurantId": index.value});
  //   // print(
  //   //     "Restaurant Gallery Data ====>  ${galleryImagesRestaurantList.value}");
  //   //
  //   // /// Menu
  //   // await restaurantDetailsMenu(body: {"restaurantId": index.value});
  //   // print("Restaurant Menu Data ====>  ${menuHeaderRestaurantList.value}");
  //   // // print(
  //   // //     "Restaurant Menu Details Data ====>  ${menuDescriptionRestaurantList.value}");
  //   // /// Ratings
  //   // await restaurantDetailsRatings(body: {"restaurantId": index.value});
  //   // print("Restaurant Rating Data ====>  ${rateReviewsRestaurantList.value}");
  //   // print("Restaurant Total Review Data ====>  ${totalReviews.value}");
  //
  //   // print(
  //   //     "Restaurant Menu Details Data ====>  ${menuDescriptionRestaurantList.value}");
  //   super.onInit();
  // }

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

        // print("INDEX VALUE =====>>>>  ${index.value}");

        /// About Us
        await restaurantDetailsAboutUs(body: {"restaurantId": index.value});
        // print(
        //     "Restaurant About US Data ====>  ${aboutUsRestaurantList[0].aboutUs}");

        /// Gallery Images
        await restaurantDetailsGalleryImages(
            body: {"restaurantId": index.value});
        // print(
        //     "Restaurant Gallery Data ====>  ${galleryImagesRestaurantList.value}");

        /// Menu
        await restaurantDetailsMenu(body: {"restaurantId": index.value});
        // print("Restaurant Menu Data ====>  ${menuHeaderRestaurantList.value}");

        /// Ratings
        await restaurantDetailsRatings(body: {"restaurantId": index.value});
        // print(
        //     "Restaurant Rating Data ====>  ${rateReviewsRestaurantList.value}");
        //
        // print("Restaurant Total Review Data ====>  ${totalReviews.value}");

        return true;
      } else {
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );
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
        // print(index.value);
        // print(galleryImagesRestaurantList.value);
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

  /// Menu API
  Future<dynamic> restaurantDetailsMenu({
    dynamic body,
  }) async {
    try {
      final response = await apiCall.callPostApi(body, menu,
          token: userSessionController.token);
      if (response['response'] == 1) {
        menuHeaderRestaurantList.value = (response['data'])
            ?.map((e) => RestaurantMenuData.fromMap(e as Map<String, dynamic>))
            .toList();
        // menuDescriptionRestaurantList.value = (response['data']['menu'])
        //     ?.map((e) => Menu.fromMap(e as Map<String, dynamic>))
        //     .toList();
        // print(index.value);
        // print(
        //     "Item Name====>   ${menuHeaderRestaurantList[1].menu[1].itemName}");

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
        // print(index.value);
        // print("Ratings <====>   ${rateReviewsRestaurantList.value}");

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
