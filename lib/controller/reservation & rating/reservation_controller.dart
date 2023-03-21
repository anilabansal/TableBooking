import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../model/reservation/add_more_cart_modal.dart';
import '../../model/reservation/book_restaurant_detail_modal.dart';
import '../../model/reservation/reservation_order_more_menu.dart';
import '../../model/reservation/restaurant_booking_list_modal.dart';
import '../../model/restaurant_menu/Cart_model.dart';
import '../../model/restaurant_menu/add_on_ingredient_list.dart';
import '../../utils/common/common_strings.dart';
import '../../utils/common/toast_message.dart';
import '../../utils/network/api_calls.dart';
import '../user_session/user_session_controller.dart';

class ReservationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ApiCalls apiCall = ApiCalls();
  UserSessionController userSessionController = Get.find();
  var bookRestaurantIsLoading = true.obs;
  var bookedRestaurantDetailsLoading = true.obs;
  var isReviewSubmittedLoader = true.obs;
  var orderMoreItemIsLoading = true.obs;
  var orderMoreConfirmationIsLoading = true.obs;
  var addOnIsLoading = true.obs;
  // var selectPaymentMode = "".obs;
  var addOnMenuIngredientList = <AddOnIngredientList>[].obs;
  List<Cart> cartNewItemsList = [];
  List<IngredientTypes> selectedIngredient = [];
  List<AddOns> addOnIngredients = [];
  RxDouble  tipAddedOrderMore = 0.0.obs ;
 RxDouble taxAddedOrderMore = 0.0.obs;
 ///totalAmountOrderMore i.e items subTotal price + tax
  RxDouble totalAmountOrderMore = 0.0.obs;

  double? addOnPrices = 0.0;
 dynamic subTotalPrice = 0.0;
  // dynamic newAddedPrice = 0.0;
  /// for addOn prices added during confirm booking
  dynamic previousAddedAddOnPrice = 0.0;
  ///previous added addOns in menu
  RxList<AddedAddOns> bookedAddedAddOns = <AddedAddOns>[].obs;


  /// upcoming, running, previous restaurant list
  var bookingRestaurantList = RestaurantBookingList().obs;

  /// book restaurant details
  BookRestaurantDetails? bookRestaurantDetails;

  /// order more items
  var reservationOrderMoreMenu = <ReservationOrderMoreMenu>[].obs;

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
  List<AddMoreCart> addMoreItemCart = [];

  /// subTotal price calculations
  subTotalPriceCalculation(itemTotalPrice) {
    subTotalPrice = subTotalPrice! + itemTotalPrice;
    calTaxAddedOrderMore();
    callTotalAmountItemsAndTax();
    update();
  }

  ///subtotal price after removing items
  void subTotalPriceAfterRemoving(itemSubtractionPrice) {
    subTotalPrice = subTotalPrice! - itemSubtractionPrice;
    calTaxAddedOrderMore();
    callTotalAmountItemsAndTax();
    update();
  }

  /// add quantity in cart
  void addQuantity(int index, int subIndex,) {
    reservationOrderMoreMenu[index].menu![subIndex].quantity =
        reservationOrderMoreMenu[index].menu![subIndex].quantity! + 1;
    reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity =
        reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity! + 1;

    /// to check at particular itemId if addOns are added during confirm booking or not
    ///
   // var bookedAddedAddOnsTemp = <AddedAddOns>[];
    if(reservationOrderMoreMenu[index].menu![subIndex].addedAddOns!= null){
      bookedAddedAddOns.value = reservationOrderMoreMenu[index].menu![subIndex].addedAddOns!;
      if( bookedAddedAddOns.value.isNotEmpty){
        for(int i = 0; i< bookedAddedAddOns.length; i++){
          previousAddedAddOnPrice = previousAddedAddOnPrice +  bookedAddedAddOns[i].price;
          AddOns newData = AddOns(
            ingredientName: bookedAddedAddOns[i].addOnName,
              ItemAddOnId: bookedAddedAddOns[i].addOnId,

          );
          addOnIngredients.add(newData);
        }
      }
    }
    print("bookedAddedADonMenu${reservationOrderMoreMenu[index].menu![subIndex].addedAddOns!.length}");
    print("bookedAddedADon${bookedAddedAddOns.length}");
    var list = cartNewItemsList.where((element) =>
        element.ItemId ==
        reservationOrderMoreMenu[index].menu![subIndex].itemId);
    List<AddOns> _listAddOn = [];
       _listAddOn.addAll(addOnIngredients);


    if (list.isEmpty) {

      /// first time when particular itemId is not added in cart ---> to add itemPrice and add on price
      double? addOnItemPrices =
          (reservationOrderMoreMenu[index].menu![subIndex].itemPrice! +
              ( bookedAddedAddOns.isNotEmpty ?  previousAddedAddOnPrice : addOnPrices!)
             );

      /// first time when particular itemId is not added in cart ---> to add offerPrice and add on price
      double? addOfferPrices =
          (reservationOrderMoreMenu[index].menu![subIndex].offerPrice! +
              ( bookedAddedAddOns.value.isNotEmpty?previousAddedAddOnPrice:addOnPrices!)
              );

      /// created variable of Cart type
      Cart cart = Cart(
        ItemId: reservationOrderMoreMenu[index].menu![subIndex].itemId,
        ItemQuantity:
            reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity,
        ItemlPriceSingleQuantity:
            (reservationOrderMoreMenu[index].menu![subIndex].itemPrice!),
        itemName: reservationOrderMoreMenu[index].menu![subIndex].itemName,
        categoryId: reservationOrderMoreMenu[index].categoryId,
        isOfferItem:
            reservationOrderMoreMenu[index].menu![subIndex].isOfferItem,
        offerPrice:
            (reservationOrderMoreMenu[index].menu![subIndex].offerPrice!),
        offerTitle: reservationOrderMoreMenu[index].menu![subIndex].offerTitle,
        ItemTotalPrice:
            reservationOrderMoreMenu[index].menu![subIndex].isOfferItem == true
                ? reservationOrderMoreMenu[index].menu![subIndex].offerPrice! *
                    reservationOrderMoreMenu[index]
                        .menu![subIndex]
                        .newAddedQuantity!
                : reservationOrderMoreMenu[index].menu![subIndex].itemPrice! *
                    reservationOrderMoreMenu[index]
                        .menu![subIndex]
                        .newAddedQuantity!,
        addOnPrice: addOnItemPrices,
        addOns: _listAddOn,
        addOnPriceQuantity: addOnItemPrices,
        addOnOfferPrice: addOfferPrices,
        addOnOfferQuantity: addOfferPrices,

      );

      /// in cartItemList list added the cart
      cartNewItemsList.add(cart);

      /// once particular AddOns price  is added first time after that addOn price is zero so, that when at another itemId , addOns  are added firstly addOnPrice is not included
      addOnPrices = 0.0;
      // newAddedPrice = 0.0;

    } else {
      /// in else case at same itemId we have updated firstly added cart
      Cart cart = list.first;
      cart.ItemQuantity =
          reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity!;
      cart.ItemTotalPrice = reservationOrderMoreMenu[index]
                  .menu![subIndex]
                  .isOfferItem ==
              true
          ? reservationOrderMoreMenu[index].menu![subIndex].offerPrice! *
              reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity!
          : reservationOrderMoreMenu[index].menu![subIndex].itemPrice! *
              reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity!;

      /// first we will check if addon list in cart is empty or not at particular ItemId which is already in cart then we will multiply addOnPriceQuantity with quantity
      if (cart.addOns!.isNotEmpty) {
        /// if addon list in cart is not empty, therefore addOnPriceQuality is updated , if quantity is increased
        cart.addOnPriceQuantity = cart.addOnPrice! *
            reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity!;

        /// if addon list in cart is not empty, therefore addOnOfferQuality is updated , if quantity is increased
        cart.addOnOfferQuantity = cart.addOnOfferPrice! *
            reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity!;
      } else {
        double? addOnItemPrices = (reservationOrderMoreMenu[index]
                    .menu![subIndex]
                    .itemPrice! +  ( bookedAddedAddOns.value.isNotEmpty ? previousAddedAddOnPrice : addOnPrices!)
                ) *
            reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity!;
        double? addOfferPrices = (reservationOrderMoreMenu[index]
                    .menu![subIndex]
                    .offerPrice! +  ( bookedAddedAddOns.value.isNotEmpty ? previousAddedAddOnPrice : addOnPrices!)
               ) *
            reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity!;
        cart.addOnPriceQuantity = addOnItemPrices;
        cart.addOnOfferQuantity = addOfferPrices;
      }

      /// updating cart at same itemId
      cartNewItemsList[cartNewItemsList.indexWhere((element) =>
          element.ItemId ==
          reservationOrderMoreMenu[index].menu![subIndex].itemId)] = cart;
    }

    /// after adding items in cart and updating cart at same itemId we will overall calculate subTotalPrice
    Cart cartParticularItem = cartNewItemsList.firstWhere((element) =>
        element.ItemId ==
        reservationOrderMoreMenu[index].menu![subIndex].itemId);
    cartParticularItem.isOfferItem == true
        ? subTotalPriceCalculation(cartParticularItem.addOnOfferPrice)
        : subTotalPriceCalculation(cartParticularItem.addOnPrice);
    print('subTotal11--->$subTotalPrice');

    print('encodeCart${jsonDecode(jsonEncode(cartNewItemsList))}');
    addOnIngredients.clear();
    previousAddedAddOnPrice = 0.0;
    // bookedAddOnIngredientNameList.clear();
    print("bookedAddedADonMenu1${reservationOrderMoreMenu[index].menu![subIndex].addedAddOns!.length}");
    print("bookedAddedADon1${bookedAddedAddOns.value.length}");
   // bookedAddedAddOns.value.clear();
    print("bookedAddedADonMenu12${reservationOrderMoreMenu[index].menu![subIndex].addedAddOns!.length}");
    print("bookedAddedADon12${bookedAddedAddOns.value.length}");
    update();
  }

  /// delete quantity in cart
  void deleteQuantity(int index, int subIndex) {

    print("newAddedPrice${previousAddedAddOnPrice}");
    reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity = reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity! - 1;
    reservationOrderMoreMenu[index].menu![subIndex].quantity = reservationOrderMoreMenu[index].menu![subIndex].quantity! - 1;

    /// if at particular itemId in cart is having quantity 1 , if its quantity is decreased then that quantity will be zero , so that itemId can be deleted from cart
    if (reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity! < 0) {
      reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity = 0;
    } else {
      /// first time check itemId in cart
      var list = cartNewItemsList.where((element) =>
      element.ItemId ==
          reservationOrderMoreMenu[index].menu![subIndex].itemId);

      /// to check at particular itemId if addOns are added during confirm booking or not
      if(reservationOrderMoreMenu[index].menu![subIndex].addedAddOns!= null){
        bookedAddedAddOns.value = reservationOrderMoreMenu[index].menu![subIndex].addedAddOns!;
        if(bookedAddedAddOns.isNotEmpty){
          for(int i = 0; i<bookedAddedAddOns.length; i++){
            previousAddedAddOnPrice = previousAddedAddOnPrice + bookedAddedAddOns[i].price;
          }
        }
      }
      double? addOnItemPrices =
      (reservationOrderMoreMenu[index].menu![subIndex].itemPrice! +
          (bookedAddedAddOns.isNotEmpty?previousAddedAddOnPrice:addOnPrices!));
      double? addOfferPrices =
      (reservationOrderMoreMenu[index].menu![subIndex].offerPrice! +
          (bookedAddedAddOns.isNotEmpty?previousAddedAddOnPrice:addOnPrices!));
      if (list.isEmpty) {

        /// created Cart type variable
        Cart cart = Cart(
          ItemId: reservationOrderMoreMenu[index].menu![subIndex].itemId,
          ItemQuantity:
          reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity,
          ItemlPriceSingleQuantity:
          reservationOrderMoreMenu[index].menu![subIndex].itemPrice!,
          itemName: reservationOrderMoreMenu[index].menu![subIndex].itemName,
          categoryId: reservationOrderMoreMenu[index].categoryId,
          isOfferItem:
          reservationOrderMoreMenu[index].menu![subIndex].isOfferItem,
          offerPrice:
          reservationOrderMoreMenu[index].menu![subIndex].offerPrice!,
          offerTitle:
          reservationOrderMoreMenu[index].menu![subIndex].offerTitle,
          addOnPrice: addOnItemPrices,
          addOnPriceQuantity: addOnItemPrices,
          addOnOfferPrice: addOfferPrices,
          addOnOfferQuantity: addOfferPrices,
          ItemTotalPrice: reservationOrderMoreMenu[index]
              .menu![subIndex]
              .isOfferItem ==
              true
              ? reservationOrderMoreMenu[index].menu![subIndex].offerPrice! *
              reservationOrderMoreMenu[index]
                  .menu![subIndex]
                  .newAddedQuantity!
              : reservationOrderMoreMenu[index].menu![subIndex].itemPrice! *
              reservationOrderMoreMenu[index]
                  .menu![subIndex]
                  .newAddedQuantity!,
        );
        cartNewItemsList.remove(cart);
      } else {
        /// in else case if itemId already existed , to update quantity and price on decrease of quantity
        Cart cart = list.first;

        cart.ItemQuantity =
        reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity!;
        cart.ItemTotalPrice =
        reservationOrderMoreMenu[index].menu![subIndex].isOfferItem == true
            ? reservationOrderMoreMenu[index].menu![subIndex].offerPrice! *
            reservationOrderMoreMenu[index]
                .menu![subIndex]
                .newAddedQuantity!
            : reservationOrderMoreMenu[index].menu![subIndex].itemPrice! *
            reservationOrderMoreMenu[index]
                .menu![subIndex]
                .newAddedQuantity!;

        /// according to addOn list is empty or not in cart, prices are updated according to quantity
        if (cart.addOns!.isNotEmpty) {
          cart.addOnPriceQuantity = cart.addOnPrice! *
              reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity!;
          cart.addOnOfferQuantity = cart.addOnOfferPrice! *
              reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity!;
        } else {
          double? addOnItemPrices = (reservationOrderMoreMenu[index]
              .menu![subIndex]
              .itemPrice! +  (bookedAddedAddOns.isNotEmpty?previousAddedAddOnPrice:addOnPrices!)
          ) *
              reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity!;


          double? addOfferPrices = (reservationOrderMoreMenu[index]
              .menu![subIndex]
              .offerPrice! +  (bookedAddedAddOns.isNotEmpty?previousAddedAddOnPrice:addOnPrices!)
          ) *
              reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity!;

          cart.addOnPriceQuantity = addOnItemPrices;
          cart.addOnOfferQuantity = addOfferPrices;
          // cart.addOnOfferQuantity = cart.addOnOfferPrice! *
          //     reservationOrderMoreMenu[index].menu![subIndex].newAddedQuantity!;
        }

        /// updated cart on already added itemId in cart
        cartNewItemsList[cartNewItemsList.indexWhere((element) =>
        element.ItemId ==
            reservationOrderMoreMenu[index].menu![subIndex].itemId)] = cart;

        /// In cart if particular itemQuantity is zero , to remove itemId from cart
        if (cart.ItemQuantity == 0) {
          print("zero");
          cartNewItemsList.removeWhere((element) => element.ItemQuantity == 0);

          /// if quantity of particular item is 1 and on one deduction item will be removed from cart and subTotalPrice will be updated
          cart.isOfferItem == true
              ? subTotalPriceAfterRemoving(cart.addOnOfferPrice)
              : subTotalPriceAfterRemoving(cart.addOnPrice);
          print('subTotal--->$subTotalPrice');
        }
      }

      /// after adding items in cart and updating cart at same itemId we will overall calculate subTotalPrice
      var cartItem = cartNewItemsList.where((element) =>
      element.ItemId ==
          reservationOrderMoreMenu[index].menu![subIndex].itemId);
      if (cartItem.isNotEmpty) {
        Cart cartParticularItem = cartNewItemsList.firstWhere((element) =>
        element.ItemId ==
            reservationOrderMoreMenu[index].menu![subIndex].itemId);
        cartParticularItem.isOfferItem == true
            ? subTotalPriceAfterRemoving(cartParticularItem.addOnOfferPrice)
            : subTotalPriceAfterRemoving(cartParticularItem.addOnPrice);
        print('subTotal--->$subTotalPrice');
      }

      print('encodeCart${jsonEncode(cartNewItemsList)}');
    }
    previousAddedAddOnPrice=0.0;
    update();
  }

  /// remove cartItem at particular index
  void removeItemAtIndex(value, index) {
    ///find the object at particular itemId
    Cart cartParticularItem =
        cartNewItemsList.firstWhere((element) => element.ItemId == value);

    cartParticularItem.isOfferItem == true
        ? subTotalPriceAfterRemoving(cartParticularItem.addOnOfferQuantity)
        : subTotalPriceAfterRemoving(cartParticularItem.addOnPriceQuantity);
    print('subTotal--->$subTotalPrice');

    /// matched the menuCategoryId with the CartCategoryId
    Iterable data = reservationOrderMoreMenu.where(
      (element) => element.categoryId == cartParticularItem.categoryId,
    );

    if (data.isNotEmpty) {
      ReservationOrderMoreMenu dataMenu = data.first;

      /// from dataMenu object if itemId matches with itemId of remove itemId , then at particularItemId quantity is zero
      Menu menu =
          dataMenu.menu!.firstWhere((element) => element.itemId == value);
      print("menuName${menu.itemName}");
      menu.quantity = menu.quantity!-menu.newAddedQuantity!;
      menu.newAddedQuantity = 0;


      /// now update Restaurant menu list
      reservationOrderMoreMenu[reservationOrderMoreMenu.indexWhere((element) =>
              element.categoryId == cartParticularItem.categoryId)] ==
          menu;
    }
    cartNewItemsList.removeAt(index);
    update();
    print('encodeCart${jsonEncode(cartNewItemsList)}');
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



  /// calculation of tax added in order more
  calTaxAddedOrderMore(){
   taxAddedOrderMore.value =
    ((subTotalPrice!.toDouble() *
        bookRestaurantDetails!.bookinglistresponse.tax!
            .toDouble()) /
        100);
  }
  /// calTotal Amount i.e tax added and total item price
  callTotalAmountItemsAndTax(){
    totalAmountOrderMore.value =
       subTotalPrice +
           taxAddedOrderMore.value;
  tipAddedOrderMore.value = bookRestaurantDetails!.bookinglistresponse.tip!
        .endsWith('%')
        ? ((totalAmountOrderMore.value *
        double.parse(bookRestaurantDetails!.bookinglistresponse.tip!
            .replaceAll('%', ''))) /
        100)
        : 0.0;
  }

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

  /// order more food api call
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
        if (response['data'] != null) {
          reservationOrderMoreMenu.value = List<ReservationOrderMoreMenu>.from(
              response["data"]
                  .map((x) => ReservationOrderMoreMenu.fromJson(x)));
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
        return false;
      }
    } catch (e) {
      print('Error --------> $e');
    }
    return false;
  }

  /// order more confirmation api

  Future<dynamic> orderMoreConfirmationApiCall({
    dynamic body,
  }) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        orderMoreConfirmationEndPoint,
        token: userSessionController.token,
      );
      if (response['response'] == 1) {
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
