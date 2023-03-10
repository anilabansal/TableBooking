import 'dart:convert';
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
import '../../model/restaurant_menu/add_on_ingredient_list.dart';
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
  var addOnMenuIngredientList = <AddOnIngredientList>[].obs;
  var addOnIsLoading = true.obs;
  var totalReviews = "".obs;
  var isLoading = true.obs;
  var selectedIndex = 0.obs;
  var index = 0.obs;
  var placeOrderIsLoading = true.obs;
  // double? totalAmountToPay = 0.00;
  LocationController locationController = Get.find();
  List<Cart> cartItemsList = [];
  double? subTotalPrice = 0.0;
  List<IngredientTypes> selectedIngredient = [];
  List<AddOns> addOnIngredients = [];

  double? addOnPrices = 0.0;

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
    List<AddOns> _listAddOn = [];
    _listAddOn.addAll(addOnIngredients);

    if (list.isEmpty) {
      /// first time when particular itemId is not added in cart ---> to add itemPrice and add on price
      double? addOnItemPrices =
          (menuHeaderRestaurantList[index].menu![subIndex].itemPrice! +
              addOnPrices!);

      /// first time when particular itemId is not added in cart ---> to add offerPrice and add on price
      double? addOfferPrices =
          (menuHeaderRestaurantList[index].menu![subIndex].offerPrice! +
              addOnPrices!);

      /// created variable of Cart type
      Cart cart = Cart(
        ItemId: menuHeaderRestaurantList[index].menu![subIndex].itemId,
        ItemQuantity: menuHeaderRestaurantList[index].menu![subIndex].quantity!,
        ItemlPriceSingleQuantity:
            (menuHeaderRestaurantList[index].menu![subIndex].itemPrice!),
        itemName: menuHeaderRestaurantList[index].menu![subIndex].itemName,
        categoryId: menuHeaderRestaurantList[index].categoryId,
        isOfferItem:
            menuHeaderRestaurantList[index].menu![subIndex].isOfferItem,
        offerPrice:
            (menuHeaderRestaurantList[index].menu![subIndex].offerPrice!),
        offerTitle: menuHeaderRestaurantList[index].menu![subIndex].offerTitle,
        ItemTotalPrice:
            menuHeaderRestaurantList[index].menu![subIndex].isOfferItem == true
                ? menuHeaderRestaurantList[index].menu![subIndex].offerPrice! *
                    menuHeaderRestaurantList[index].menu![subIndex].quantity!
                : menuHeaderRestaurantList[index].menu![subIndex].itemPrice! *
                    menuHeaderRestaurantList[index].menu![subIndex].quantity!,
        addOnPrice: addOnItemPrices,
        addOns: _listAddOn,
        addOnPriceQuantity: addOnItemPrices,
        addOnOfferPrice: addOfferPrices,
        addOnOfferQuantity: addOfferPrices,
      );

      /// in cartItemList list added the cart
      cartItemsList.add(cart);

      /// once particular AddOns price  is added first time after that addOn price is zero so, that when at another itemId , addOns  are added firstly addOnPrice is not included
      addOnPrices = 0.0;
    } else {
      /// in else case at same itemId we have updated firstly added cart
      Cart cart = list.first;
      cart.ItemQuantity =
          menuHeaderRestaurantList[index].menu![subIndex].quantity!;
      cart.ItemTotalPrice =
          menuHeaderRestaurantList[index].menu![subIndex].isOfferItem == true
              ? menuHeaderRestaurantList[index].menu![subIndex].offerPrice! *
                  menuHeaderRestaurantList[index].menu![subIndex].quantity!
              : menuHeaderRestaurantList[index].menu![subIndex].itemPrice! *
                  menuHeaderRestaurantList[index].menu![subIndex].quantity!;

      /// first we will check if addon list in cart is empty or not at particular ItemId which is already in cart then we will multiply addOnPriceQuantity with quantity
      if (cart.addOns!.isNotEmpty) {
        /// if addon list in cart is not empty, therefore addOnPriceQuality is updated , if quantity is increased
        cart.addOnPriceQuantity = cart.addOnPrice! *
            menuHeaderRestaurantList[index].menu![subIndex].quantity!;

        /// if addon list in cart is not empty, therefore addOnOfferQuality is updated , if quantity is increased
        cart.addOnOfferQuantity = cart.addOnOfferPrice! *
            menuHeaderRestaurantList[index].menu![subIndex].quantity!;
      } else {
        double? addOnItemPrices =
            (menuHeaderRestaurantList[index].menu![subIndex].itemPrice! +
                    addOnPrices!) *
                menuHeaderRestaurantList[index].menu![subIndex].quantity!;
        double? addOfferPrices =
            (menuHeaderRestaurantList[index].menu![subIndex].offerPrice! +
                    addOnPrices!) *
                menuHeaderRestaurantList[index].menu![subIndex].quantity!;
        cart.addOnPriceQuantity = addOnItemPrices;
        cart.addOnOfferQuantity = addOfferPrices;
      }

      /// updating cart at same itemId
      cartItemsList[cartItemsList.indexWhere((element) =>
          element.ItemId ==
          menuHeaderRestaurantList[index].menu![subIndex].itemId)] = cart;
    }

    /// after adding items in cart and updating cart at same itemId we will overall calculate subTotalPrice
    Cart cartParticularItem = cartItemsList.firstWhere((element) =>
        element.ItemId ==
        menuHeaderRestaurantList[index].menu![subIndex].itemId);
    cartParticularItem.isOfferItem == true
        ? subTotalPriceCalculation(cartParticularItem.addOnOfferPrice)
        : subTotalPriceCalculation(cartParticularItem.addOnPrice);
    print('subTotal--->$subTotalPrice');

    print('encodeCart${jsonDecode(jsonEncode(cartItemsList))}');
    addOnIngredients.clear();

    update();
  }

  /// delete quantity in cart
  void deleteQuantity(int index, int subIndex) {
    final currentQuantity =
        menuHeaderRestaurantList[index].menu![subIndex].quantity;
    menuHeaderRestaurantList[index].menu![subIndex].quantity =
        currentQuantity! - 1;

    /// if at particular itemId in cart is having quantity 1 , if its quantity is decreased then that quantity will be zero , so that itemId can be deleted from cart
    if (menuHeaderRestaurantList[index].menu![subIndex].quantity! < 0) {
      menuHeaderRestaurantList[index].menu![subIndex].quantity = 0;
    } else {
      /// first time check itemId in cart
      var list = cartItemsList.where((element) =>
          element.ItemId ==
          menuHeaderRestaurantList[index].menu![subIndex].itemId);
      double? addOnItemPrices =
          (menuHeaderRestaurantList[index].menu![subIndex].itemPrice! +
              addOnPrices!);
      double? addOfferPrices =
          (menuHeaderRestaurantList[index].menu![subIndex].offerPrice! +
              addOnPrices!);
      if (list.isEmpty) {
        /// created Cart type variable
        Cart cart = Cart(
          ItemId: menuHeaderRestaurantList[index].menu![subIndex].itemId,
          ItemQuantity:
              menuHeaderRestaurantList[index].menu![subIndex].quantity!,
          ItemlPriceSingleQuantity:
              menuHeaderRestaurantList[index].menu![subIndex].itemPrice!,
          itemName: menuHeaderRestaurantList[index].menu![subIndex].itemName,
          categoryId: menuHeaderRestaurantList[index].categoryId,
          isOfferItem:
              menuHeaderRestaurantList[index].menu![subIndex].isOfferItem,
          offerPrice:
              menuHeaderRestaurantList[index].menu![subIndex].offerPrice!,
          offerTitle:
              menuHeaderRestaurantList[index].menu![subIndex].offerTitle,
          addOnPrice: addOnItemPrices,
          addOnPriceQuantity: addOnItemPrices,
          addOnOfferPrice: addOfferPrices,
          addOnOfferQuantity: addOfferPrices,
          ItemTotalPrice: menuHeaderRestaurantList[index]
                      .menu![subIndex]
                      .isOfferItem ==
                  true
              ? menuHeaderRestaurantList[index].menu![subIndex].offerPrice! *
                  menuHeaderRestaurantList[index].menu![subIndex].quantity!
              : menuHeaderRestaurantList[index].menu![subIndex].itemPrice! *
                  menuHeaderRestaurantList[index].menu![subIndex].quantity!,
        );
        cartItemsList.remove(cart);
      } else {
        /// in else case if itemId already existed , to update quantity and price on decrease of quantity
        Cart cart = list.first;
        cart.ItemQuantity =
            menuHeaderRestaurantList[index].menu![subIndex].quantity!;
        cart.ItemTotalPrice =
            menuHeaderRestaurantList[index].menu![subIndex].isOfferItem == true
                ? menuHeaderRestaurantList[index].menu![subIndex].offerPrice! *
                    menuHeaderRestaurantList[index].menu![subIndex].quantity!
                : menuHeaderRestaurantList[index].menu![subIndex].itemPrice! *
                    menuHeaderRestaurantList[index].menu![subIndex].quantity!;
        /// according to addOn list is empty or not in cart, prices are updated according to quantity
        if (cart.addOns!.isNotEmpty) {
          cart.addOnPriceQuantity = cart.addOnPrice! *
              menuHeaderRestaurantList[index].menu![subIndex].quantity!;
          cart.addOnOfferQuantity = cart.addOnOfferPrice! *
              menuHeaderRestaurantList[index].menu![subIndex].quantity!;
        } else {
          double? addOnItemPrices =
              (menuHeaderRestaurantList[index].menu![subIndex].itemPrice! +
                      addOnPrices!) *
                  menuHeaderRestaurantList[index].menu![subIndex].quantity!;
          double? addOfferPrices =
              (menuHeaderRestaurantList[index].menu![subIndex].offerPrice! +
                      addOnPrices!) *
                  menuHeaderRestaurantList[index].menu![subIndex].quantity!;
          //     cart.addOnPrice= addOnItemPrices;
          cart.addOnPriceQuantity = addOnItemPrices;
          cart.addOnOfferQuantity = cart.addOnOfferPrice! *
              menuHeaderRestaurantList[index].menu![subIndex].quantity!;
        }
        /// updated cart on already added itemId in cart
        cartItemsList[cartItemsList.indexWhere((element) =>
            element.ItemId ==
            menuHeaderRestaurantList[index].menu![subIndex].itemId)] = cart;
        /// In cart if particular itemQuantity is zero , to remove itemId from cart
        if (cart.ItemQuantity == 0) {
          print("zero");
          cartItemsList.removeWhere((element) => element.ItemQuantity == 0);

          /// if quantity of particular item is 1 and on one deduction item will be removed from cart and subTotalPrice will be updated
          cart.isOfferItem == true
              ? subTotalPriceAfterRemoving(cart.addOnOfferPrice)
              : subTotalPriceAfterRemoving(cart.addOnPrice);
          print('subTotal--->$subTotalPrice');
        }
      }

      /// after adding items in cart and updating cart at same itemId we will overall calculate subTotalPrice
      var cartItem = cartItemsList.where((element) =>
          element.ItemId ==
          menuHeaderRestaurantList[index].menu![subIndex].itemId);
      if (cartItem.isNotEmpty) {
        Cart cartParticularItem = cartItemsList.firstWhere((element) =>
            element.ItemId ==
            menuHeaderRestaurantList[index].menu![subIndex].itemId);
        cartParticularItem.isOfferItem == true
            ? subTotalPriceAfterRemoving(cartParticularItem.addOnOfferPrice)
            : subTotalPriceAfterRemoving(cartParticularItem.addOnPrice);
        print('subTotal--->$subTotalPrice');
      }

      print('encodeCart${jsonEncode(cartItemsList)}');
    }
    update();
  }

  /// remove cartItem at particular index
  void removeItemAtIndex(value, index) {
    ///find the object at particular itemId
    Cart cartParticularItem =
        cartItemsList.firstWhere((element) => element.ItemId == value);
    // cartParticularItem.isOfferItem == true
    //     ? subTotalPriceAfterRemoving(cartParticularItem.offerPrice)
    //     : subTotalPriceAfterRemoving(cartParticularItem.ItemTotalPrice);
    cartParticularItem.isOfferItem == true
        ? subTotalPriceAfterRemoving(cartParticularItem.addOnOfferQuantity)
        : subTotalPriceAfterRemoving(cartParticularItem.addOnPriceQuantity);
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

  /// setSelected ingredient of particular item
  setSelectedIngredient(IngredientTypes value, itemId, index, subIndex) {
    AddOns data = AddOns(
        ingredientName: value.name!,
        addOnPrice: value.amount!,
        ItemAddOnId: value.addOnId);
    addOnIngredients.add(data);
    if (addOnIngredients.contains(data)) {
      addOnPrices = addOnPrices! + value.amount!;
    }
    selectedIngredient.add(value);
    // ingredientNames =  selectedIngredient.map((e) => e.name).toString();
    update();
  }

  /// check selected Ingredient Is added to List or not
  checkIngredientContains(IngredientTypes value) {
    return selectedIngredient.contains(value);
  }

  /// if selected ingredient is already in list then remove it on tap
  removeSelectedIngredient(IngredientTypes value) {
    addOnIngredients.remove(AddOns(
        ingredientName: value.name!,
        addOnPrice: value.amount!,
        ItemAddOnId: value.addOnId));
    selectedIngredient.remove(value);
    addOnPrices = addOnPrices! - value.amount!;
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

  /// add - on- ingredients menu api call
  Future<dynamic> addOnIngredientMenuApiCall({
    dynamic body,
  }) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        addOnListEndPoint,
        token: userSessionController.token,
      );
      if (response['response'] == 1) {
        // menuHeaderRestaurantList.value = (response['data'])
        //     ?.map((e) => RestaurantMenuData.fromMap(e as Map<String, dynamic>))
        //     .toList();
        if (response['data'] != null) {
          addOnMenuIngredientList.value = List<AddOnIngredientList>.from(
              response['data'].map((x) => AddOnIngredientList.fromJson(x)));
        }

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
      print('Error --------> $e');
    }

    return false;
  }
}
