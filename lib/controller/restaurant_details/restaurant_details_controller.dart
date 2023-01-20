import 'dart:convert';
import 'dart:ffi';

import 'package:booking_table/controller/home/home_controller.dart';
import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:booking_table/model/gallery_images/restaurant_image.dart';
import 'package:booking_table/model/rate_and_review/rating_and_review_list.dart';
import 'package:booking_table/model/restaurant_details/data.dart';
import 'package:booking_table/model/restaurant_menu/menu.dart';
import 'package:booking_table/model/restaurant_menu/restaurant_menu_data.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/network/api_calls.dart';
import 'package:get/get.dart';

import '../../model/restaurant_about_us/restaurant_about_us_model.dart';
import '../../model/restaurant_menu/Cart_model.dart';
import '../location/location_controller.dart';

class RestaurantDetailsController extends GetxController {
  HomeController homeController = Get.find();
  UserSessionController userSessionController = Get.find();
  ApiCalls apiCall = ApiCalls();
  var detailsRestaurantList = RestaurantDetailsData().obs;
  var aboutUsRestaurantList = [].obs;
  var galleryImagesRestaurantList = [].obs;
  var menuHeaderRestaurantList = <RestaurantMenuData>[].obs;
  var rateReviewsRestaurantList = [].obs;
  var totalReviews = "".obs;
  var isLoading = true.obs;
  var selectedIndex = 0.obs;
  var index = 0.obs;
  var placeOrderIsLoading = true.obs;
  LocationController locationController = Get.find();
  List<Cart> cartItemsList = [];
  double? subTotalPrice = 0.0;

  /// update likes and unlike of restaurants on restaurant details screen
  void updateRestaurantLikes() {
    if (detailsRestaurantList.value.isFavourite == true) {
      detailsRestaurantList.value.isFavourite = false;
    } else if (detailsRestaurantList.value.isFavourite == false) {
      detailsRestaurantList.value.isFavourite = true;
    }
    update();
  }

  /// subTotal price calculations
  subTotalPriceCalculation(itemTotalPrice) {
    subTotalPrice = subTotalPrice! + itemTotalPrice;
    update();
  }

  ///subtotal price after removing items
  void subTotalPriceAfterRemoving(itemSubtractionPrice) {
    subTotalPrice = subTotalPrice! - itemSubtractionPrice;
    update();
  }

  /// add quantity in cart
  void addQuantity(int index, int subIndex) {
    menuHeaderRestaurantList[index].menu![subIndex].quantity =
        menuHeaderRestaurantList[index].menu![subIndex].quantity! + 1;
    var list = cartItemsList.where((element) =>
        element.ItemId ==
        menuHeaderRestaurantList[index].menu![subIndex].itemId);
    if (list.isEmpty) {
      cartItemsList.add(
        Cart(
          ItemId: menuHeaderRestaurantList[index].menu![subIndex].itemId,
          ItemQuantity:
              menuHeaderRestaurantList[index].menu![subIndex].quantity!,
          ItemTotalPrice:
              menuHeaderRestaurantList[index].menu![subIndex].itemPrice! *
                  menuHeaderRestaurantList[index].menu![subIndex].quantity!,
          itemName: menuHeaderRestaurantList[index].menu![subIndex].itemName,
          categoryId: menuHeaderRestaurantList[index].categoryId,
          isOfferItem:
              menuHeaderRestaurantList[index].menu![subIndex].isOfferItem,
          offerPrice:
              menuHeaderRestaurantList[index].menu![subIndex].offerPrice! *
                  menuHeaderRestaurantList[index].menu![subIndex].quantity!,
          offerTitle:
              menuHeaderRestaurantList[index].menu![subIndex].offerTitle,
        ),
      );
    } else {
      cartItemsList[cartItemsList.indexWhere((element) =>
          element.ItemId ==
          menuHeaderRestaurantList[index].menu![subIndex].itemId)] = Cart(
        ItemId: menuHeaderRestaurantList[index].menu![subIndex].itemId,
        ItemQuantity: menuHeaderRestaurantList[index].menu![subIndex].quantity!,
        ItemTotalPrice:
            menuHeaderRestaurantList[index].menu![subIndex].itemPrice! *
                menuHeaderRestaurantList[index].menu![subIndex].quantity!,
        itemName: menuHeaderRestaurantList[index].menu![subIndex].itemName,
        categoryId: menuHeaderRestaurantList[index].categoryId,
        isOfferItem:
            menuHeaderRestaurantList[index].menu![subIndex].isOfferItem,
        offerPrice:
            menuHeaderRestaurantList[index].menu![subIndex].offerPrice! *
                menuHeaderRestaurantList[index].menu![subIndex].quantity!,
        offerTitle: menuHeaderRestaurantList[index].menu![subIndex].offerTitle,
      );
    }
    menuHeaderRestaurantList[index].menu![subIndex].isOfferItem == false
        ? subTotalPriceCalculation(
            menuHeaderRestaurantList[index].menu![subIndex].itemPrice)
        : subTotalPriceCalculation(
            menuHeaderRestaurantList[index].menu![subIndex].offerPrice);
    print('subTotal--->$subTotalPrice');
    print(
        'cartList---->${cartItemsList.length},${cartItemsList[cartItemsList.length - 1].ItemId},${cartItemsList[cartItemsList.length - 1].ItemQuantity},${cartItemsList[cartItemsList.length - 1].ItemTotalPrice}');
    print('encodeCart${jsonEncode(cartItemsList)}');
    update();
  }

  /// delete quantity in cart
  void deleteQuantity(int index, int subIndex) {
    final currentQuantity =
        menuHeaderRestaurantList[index].menu![subIndex].quantity;
    if (currentQuantity == 0) {
      currentQuantity == 0;
      // cartItemsList[index].quantity =
      //     menuHeaderRestaurantList[index].menu![subIndex].quantity;
    } else {
      menuHeaderRestaurantList[index].menu![subIndex].quantity =
          currentQuantity! - 1;
      var list = cartItemsList.where((element) =>
          element.ItemId ==
          menuHeaderRestaurantList[index].menu![subIndex].itemId);
      if (list.isEmpty) {
        cartItemsList.remove(
          Cart(
            ItemId: menuHeaderRestaurantList[index].menu![subIndex].itemId,
            ItemQuantity:
                menuHeaderRestaurantList[index].menu![subIndex].quantity!,
            ItemTotalPrice:
                menuHeaderRestaurantList[index].menu![subIndex].itemPrice! *
                    menuHeaderRestaurantList[index].menu![subIndex].quantity!,
            itemName: menuHeaderRestaurantList[index].menu![subIndex].itemName,
            categoryId: menuHeaderRestaurantList[index].categoryId,
            isOfferItem:
                menuHeaderRestaurantList[index].menu![subIndex].isOfferItem,
            offerPrice:
                menuHeaderRestaurantList[index].menu![subIndex].offerPrice! *
                    menuHeaderRestaurantList[index].menu![subIndex].quantity!,
            offerTitle:
                menuHeaderRestaurantList[index].menu![subIndex].offerTitle,
          ),
        );
      } else {
        cartItemsList[cartItemsList.indexWhere((element) =>
            element.ItemId ==
            menuHeaderRestaurantList[index].menu![subIndex].itemId)] = Cart(
          ItemId: menuHeaderRestaurantList[index].menu![subIndex].itemId,
          ItemQuantity:
              menuHeaderRestaurantList[index].menu![subIndex].quantity!,
          ItemTotalPrice:
              menuHeaderRestaurantList[index].menu![subIndex].itemPrice! *
                  menuHeaderRestaurantList[index].menu![subIndex].quantity!,
          itemName: menuHeaderRestaurantList[index].menu![subIndex].itemName,
          categoryId: menuHeaderRestaurantList[index].categoryId,
          isOfferItem:
              menuHeaderRestaurantList[index].menu![subIndex].isOfferItem,
          offerPrice:
              menuHeaderRestaurantList[index].menu![subIndex].offerPrice! *
                  menuHeaderRestaurantList[index].menu![subIndex].quantity!,
          offerTitle:
              menuHeaderRestaurantList[index].menu![subIndex].offerTitle,
        );
      }
      menuHeaderRestaurantList[index].menu![subIndex].isOfferItem == false
          ? subTotalPriceAfterRemoving(
              menuHeaderRestaurantList[index].menu![subIndex].itemPrice)
          : subTotalPriceAfterRemoving(
              menuHeaderRestaurantList[index].menu![subIndex].offerPrice);
      print('subTotal--->$subTotalPrice');
      print(
          'cartList---->${cartItemsList.length},${cartItemsList[cartItemsList.length - 1].ItemId},${cartItemsList[cartItemsList.length - 1].ItemQuantity},${cartItemsList[cartItemsList.length - 1].ItemTotalPrice}');
      print('encodeCart${jsonEncode(cartItemsList)}');
    }
    update();
  }

  /// remove cartItem at particular index
  void removeItemAtIndex(value, index) {
    ///find the object at particular itemId
    Cart cartParticularItem =
        cartItemsList.firstWhere((element) => element.ItemId == value);
    cartParticularItem.isOfferItem == true
        ? subTotalPriceAfterRemoving(cartParticularItem.offerPrice)
        : subTotalPriceAfterRemoving(cartParticularItem.ItemTotalPrice);
    print('subTotal--->$subTotalPrice');

    /// matched the menuCategoryId with the CartCategoryId
    Iterable data = menuHeaderRestaurantList.where(
      (element) => element.categoryId == cartParticularItem.categoryId,
    );

    if (data.isNotEmpty) {
      RestaurantMenuData dataMenu = data.first;

      /// from dataMenu object if itemId matches with itemId of remove itemId , then at particularItemId quantity is zero
      Menu menu =
          dataMenu.menu!.firstWhere((element) => element.itemId == value);
      print("menuName${menu.itemName}");
      menu.quantity = 0;

      // menu.isOfferItem==true?subTotalPriceAfterRemoving(menu.offerPrice):subTotalPriceAfterRemoving(menu.itemPrice);

      /// now update Restaurant menu list
      menuHeaderRestaurantList[menuHeaderRestaurantList.indexWhere((element) =>
              element.categoryId == cartParticularItem.categoryId)] ==
          menu;
    }
    cartItemsList.removeAt(index);
    update();
    print('encodeCart${jsonEncode(cartItemsList)}');
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

      RestaurantAboutUsModel restaurantAboutUs =
          RestaurantAboutUsModel.fromMap(response);
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
      final response = await apiCall.callPostApi(
        body,
        menu,
        token: userSessionController.token,
      );
      if (response['response'] == 1) {
        // menuHeaderRestaurantList.value = (response['data'])
        //     ?.map((e) => RestaurantMenuData.fromMap(e as Map<String, dynamic>))
        //     .toList();
        if (response['data'] != null) {
          menuHeaderRestaurantList.value = <RestaurantMenuData>[];
          response['data'].forEach((v) {
            menuHeaderRestaurantList.value.add(RestaurantMenuData.fromMap(v));
          });
        }
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

  /// place order api call
  Future<dynamic> placeOrderApiCall({
    dynamic body,
  }) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        placeOrderEndPoint,
        token: userSessionController.token,
      );
      if (response['response'] == 1) {
        update();
        return true;
      } else {
        ShowToast.show(
          msg: response['errorMessage'] ?? 'Please try again!',
          isError: true,
        );
        update();
        return false;
      }
    } catch (e) {
      print('Error --------> $e');
    }

    return false;
  }
}
