import 'dart:convert';
import 'package:get/get.dart';
import '../../model/reservation/to_go_menu_detail.dart';
import '../../model/restaurant_menu/Cart_model.dart';
import '../../model/restaurant_menu/add_on_ingredient_list.dart';
import '../../utils/common/common_strings.dart';
import '../../utils/common/toast_message.dart';
import '../../utils/network/api_calls.dart';
import '../user_session/user_session_controller.dart';

class ToGoReservationController extends GetxController{
  ApiCalls apiCall = ApiCalls();
  UserSessionController userSessionController = Get.find();
  var toGoMenuIsLoading = true.obs;
  var toGoAddOnIsLoading = true.obs;
  var toGoMenuDetail = <ToGoMenuDetails>[];
  List<Cart> toGoCart = [];
  /// overall prices after adding different itemIds
  dynamic toGoSubTotalPrice = 0.0;
  /// for addOn prices added during confirm booking
  dynamic previousAddedAddOnPrice = 0.0;
  ///previous added addOns in menu
  RxList<AddedAddOns> bookedAddedAddOns = <AddedAddOns>[].obs;
  /// to calculate addOn prices
  double? addOnPrices = 0.0;
  List<AddOns> addOnIngredients = [];
  List<IngredientTypes> selectedIngredient = [];
  var addOnMenuIngredientList = <AddOnIngredientList>[].obs;

  /// toGoSubTotal price calculations
  toGoSubTotalPriceCalculation(itemTotalPrice) {
    toGoSubTotalPrice = toGoSubTotalPrice! + itemTotalPrice;
    update();
  }

  ///subtotal price after removing items
  void toGoSubTotalPriceAfterRemoving(itemSubtractionPrice) {
    toGoSubTotalPrice = toGoSubTotalPrice! - itemSubtractionPrice;
    update();
  }


  /// add quantity in cart
  void addQuantity(int index, int subIndex,) {
    toGoMenuDetail[index].menu![subIndex].quantity =
        toGoMenuDetail[index].menu![subIndex].quantity! + 1;
    toGoMenuDetail[index].menu![subIndex].newAddedQuantity =
        toGoMenuDetail[index].menu![subIndex].newAddedQuantity! + 1;

    /// to check at particular itemId if addOns are added during confirm booking or not

    if(toGoMenuDetail[index].menu![subIndex].addedAddOns!= null){
      bookedAddedAddOns.value = toGoMenuDetail[index].menu![subIndex].addedAddOns!;
      //  bookedAddedAddOnsTemp = reservationOrderMoreMenu[index].menu![subIndex].addedAddOns!;
      if( bookedAddedAddOns.isNotEmpty){
        for(int i = 0; i< bookedAddedAddOns.length; i++){
          previousAddedAddOnPrice = previousAddedAddOnPrice+  bookedAddedAddOns[i].price;
          AddOns newData = AddOns(
            ingredientName: bookedAddedAddOns[i].addOnName,
            ItemAddOnId: bookedAddedAddOns[i].addOnId,

          );
          addOnIngredients.add(newData);
        }
      }
    }

    var list = toGoCart.where((element) =>
    element.ItemId ==
        toGoMenuDetail[index].menu![subIndex].itemId);
    List<AddOns> _listAddOn = [];
    _listAddOn.addAll(addOnIngredients);


    if (list.isEmpty) {

      /// first time when particular itemId is not added in cart ---> to add itemPrice and add on price
      double? addOnItemPrices =
      (toGoMenuDetail[index].menu![subIndex].itemPrice! +
          ( bookedAddedAddOns.isNotEmpty ?  previousAddedAddOnPrice : addOnPrices!)
      );


      /// first time when particular itemId is not added in cart ---> to add offerPrice and add on price
      double? addOfferPrices =
      (toGoMenuDetail[index].menu![subIndex].offerPrice! +
          ( bookedAddedAddOns.isNotEmpty?previousAddedAddOnPrice:addOnPrices!)
      );


      /// created variable of Cart type
      Cart cart = Cart(
        ItemId: toGoMenuDetail[index].menu![subIndex].itemId,
        ItemQuantity:
        toGoMenuDetail[index].menu![subIndex].newAddedQuantity,
        ItemlPriceSingleQuantity:
        (toGoMenuDetail[index].menu![subIndex].itemPrice!),
        itemName: toGoMenuDetail[index].menu![subIndex].itemName,
        categoryId: toGoMenuDetail[index].categoryId,
        isOfferItem:
        toGoMenuDetail[index].menu![subIndex].isOfferItem,
        offerPrice:
        (toGoMenuDetail[index].menu![subIndex].offerPrice!),
        offerTitle: toGoMenuDetail[index].menu![subIndex].offerTitle,
        ItemTotalPrice:
        toGoMenuDetail[index].menu![subIndex].isOfferItem == true
            ? toGoMenuDetail[index].menu![subIndex].offerPrice! *
            toGoMenuDetail[index]
                .menu![subIndex]
                .newAddedQuantity!
            : toGoMenuDetail[index].menu![subIndex].itemPrice! *
            toGoMenuDetail[index]
                .menu![subIndex]
                .newAddedQuantity!,
        addOnPrice: addOnItemPrices,
        addOns: _listAddOn,
        addOnPriceQuantity: addOnItemPrices,
        addOnOfferPrice: addOfferPrices,
        addOnOfferQuantity: addOfferPrices,
      );

      /// in cartItemList list added the cart
      toGoCart.add(cart);

      /// once particular AddOns price  is added first time after that addOn price is zero so, that when at another itemId , addOns  are added firstly addOnPrice is not included
      addOnPrices = 0.0;
      // newAddedPrice = 0.0;

    } else {
      /// in else case at same itemId we have updated firstly added cart
      Cart cart = list.first;
      cart.ItemQuantity =
      toGoMenuDetail[index].menu![subIndex].newAddedQuantity!;
      cart.ItemTotalPrice = toGoMenuDetail[index]
          .menu![subIndex]
          .isOfferItem ==
          true
          ? toGoMenuDetail[index].menu![subIndex].offerPrice! *
          toGoMenuDetail[index].menu![subIndex].newAddedQuantity!
          : toGoMenuDetail[index].menu![subIndex].itemPrice! *
          toGoMenuDetail[index].menu![subIndex].newAddedQuantity!;

      /// first we will check if addon list in cart is empty or not at particular ItemId which is already in cart then we will multiply addOnPriceQuantity with quantity
      if (cart.addOns!.isNotEmpty) {
        /// if addon list in cart is not empty, therefore addOnPriceQuality is updated , if quantity is increased
        cart.addOnPriceQuantity = cart.addOnPrice! *
            toGoMenuDetail[index].menu![subIndex].newAddedQuantity!;

        /// if addon list in cart is not empty, therefore addOnOfferQuality is updated , if quantity is increased
        cart.addOnOfferQuantity = cart.addOnOfferPrice! *
            toGoMenuDetail[index].menu![subIndex].newAddedQuantity!;
      } else {
        double? addOnItemPrices = (toGoMenuDetail[index]
            .menu![subIndex]
            .itemPrice! +  ( bookedAddedAddOns.isNotEmpty ? previousAddedAddOnPrice : addOnPrices!)
        ) *
            toGoMenuDetail[index].menu![subIndex].newAddedQuantity!;
        double? addOfferPrices = (toGoMenuDetail[index]
            .menu![subIndex]
            .offerPrice! +  ( bookedAddedAddOns.isNotEmpty ? previousAddedAddOnPrice : addOnPrices!)
        ) *
            toGoMenuDetail[index].menu![subIndex].newAddedQuantity!;
        cart.addOnPriceQuantity = addOnItemPrices;
        cart.addOnOfferQuantity = addOfferPrices;
      }

      /// updating cart at same itemId
      toGoCart[toGoCart.indexWhere((element) =>
      element.ItemId ==
          toGoMenuDetail[index].menu![subIndex].itemId)] = cart;
    }

    /// after adding items in cart and updating cart at same itemId we will overall calculate subTotalPrice
    Cart cartParticularItem = toGoCart.firstWhere((element) =>
    element.ItemId ==
        toGoMenuDetail[index].menu![subIndex].itemId);
    cartParticularItem.isOfferItem == true
        ? toGoSubTotalPriceCalculation(cartParticularItem.addOnOfferPrice)
        : toGoSubTotalPriceCalculation(cartParticularItem.addOnPrice);
    print('toGoSubTotalPrice--->$toGoSubTotalPrice');

    print('toGoQuantity --->${toGoMenuDetail[index].menu![subIndex].quantity}');
    print('toGoNewQuantity --->${toGoMenuDetail[index].menu![subIndex].newAddedQuantity}');
    print('toGoEncodeCart${jsonDecode(jsonEncode(toGoCart))}');
    addOnIngredients.clear();
    previousAddedAddOnPrice = 0.0;
    print("bookedAddedADonMenu1${toGoMenuDetail[index].menu![subIndex].addedAddOns!.length}");
    print("bookedAddedADon1${bookedAddedAddOns.length}");
    bookedAddedAddOns.clear();
    print("bookedAddedADonMenu12${toGoMenuDetail[index].menu![subIndex].addedAddOns!.length}");
    print("bookedAddedADon12${bookedAddedAddOns.length}");
    update();
  }

  /// delete quantity in cart
  void deleteQuantity(int index, int subIndex) {

    print("newAddedPrice${previousAddedAddOnPrice}");
    toGoMenuDetail[index].menu![subIndex].newAddedQuantity = toGoMenuDetail[index].menu![subIndex].newAddedQuantity! - 1;
    toGoMenuDetail[index].menu![subIndex].quantity = toGoMenuDetail[index].menu![subIndex].quantity! - 1;

    /// if at particular itemId in cart is having quantity 1 , if its quantity is decreased then that quantity will be zero , so that itemId can be deleted from cart
    if (toGoMenuDetail[index].menu![subIndex].newAddedQuantity! < 0) {
      toGoMenuDetail[index].menu![subIndex].newAddedQuantity = 0;
    } else {
      /// first time check itemId in cart
      var list = toGoCart.where((element) =>
      element.ItemId ==
          toGoMenuDetail[index].menu![subIndex].itemId);

      /// to check at particular itemId if addOns are added during confirm booking or not
      if(toGoMenuDetail[index].menu![subIndex].addedAddOns!= null){
        bookedAddedAddOns.value = toGoMenuDetail[index].menu![subIndex].addedAddOns!;
        if(bookedAddedAddOns.isNotEmpty){
          for(int i = 0; i<bookedAddedAddOns.length; i++){
            previousAddedAddOnPrice = previousAddedAddOnPrice + bookedAddedAddOns[i].price;
          }
        }
      }
      double? addOnItemPrices =
      (toGoMenuDetail[index].menu![subIndex].itemPrice! +
          (bookedAddedAddOns.isNotEmpty?previousAddedAddOnPrice:addOnPrices!));
      double? addOfferPrices =
      (toGoMenuDetail[index].menu![subIndex].offerPrice! +
          (bookedAddedAddOns.isNotEmpty?previousAddedAddOnPrice:addOnPrices!));
      if (list.isEmpty) {

        /// created Cart type variable
        Cart cart = Cart(
          ItemId: toGoMenuDetail[index].menu![subIndex].itemId,
          ItemQuantity:
          toGoMenuDetail[index].menu![subIndex].newAddedQuantity,
          ItemlPriceSingleQuantity:
          toGoMenuDetail[index].menu![subIndex].itemPrice!,
          itemName: toGoMenuDetail[index].menu![subIndex].itemName,
          categoryId: toGoMenuDetail[index].categoryId,
          isOfferItem:
          toGoMenuDetail[index].menu![subIndex].isOfferItem,
          offerPrice:
          toGoMenuDetail[index].menu![subIndex].offerPrice!,
          offerTitle:
          toGoMenuDetail[index].menu![subIndex].offerTitle,
          addOnPrice: addOnItemPrices,
          addOnPriceQuantity: addOnItemPrices,
          addOnOfferPrice: addOfferPrices,
          addOnOfferQuantity: addOfferPrices,
          ItemTotalPrice: toGoMenuDetail[index]
              .menu![subIndex]
              .isOfferItem ==
              true
              ? toGoMenuDetail[index].menu![subIndex].offerPrice! *
              toGoMenuDetail[index]
                  .menu![subIndex]
                  .newAddedQuantity!
              : toGoMenuDetail[index].menu![subIndex].itemPrice! *
              toGoMenuDetail[index]
                  .menu![subIndex]
                  .newAddedQuantity!,
        );
        toGoCart.remove(cart);
      } else {
        /// in else case if itemId already existed , to update quantity and price on decrease of quantity
        Cart cart = list.first;

        cart.ItemQuantity =
        toGoMenuDetail[index].menu![subIndex].newAddedQuantity!;
        cart.ItemTotalPrice =
        toGoMenuDetail[index].menu![subIndex].isOfferItem == true
            ? toGoMenuDetail[index].menu![subIndex].offerPrice! *
            toGoMenuDetail[index]
                .menu![subIndex]
                .newAddedQuantity!
            : toGoMenuDetail[index].menu![subIndex].itemPrice! *
            toGoMenuDetail[index]
                .menu![subIndex]
                .newAddedQuantity!;

        /// according to addOn list is empty or not in cart, prices are updated according to quantity
        if (cart.addOns!.isNotEmpty) {
          cart.addOnPriceQuantity = cart.addOnPrice! *
              toGoMenuDetail[index].menu![subIndex].newAddedQuantity!;
          cart.addOnOfferQuantity = cart.addOnOfferPrice! *
              toGoMenuDetail[index].menu![subIndex].newAddedQuantity!;
        } else {
          double? addOnItemPrices = (toGoMenuDetail[index]
              .menu![subIndex]
              .itemPrice! +  (bookedAddedAddOns.isNotEmpty?previousAddedAddOnPrice:addOnPrices!)
          ) *
              toGoMenuDetail[index].menu![subIndex].newAddedQuantity!;


          double? addOfferPrices = (toGoMenuDetail[index]
              .menu![subIndex]
              .offerPrice! +  (bookedAddedAddOns.isNotEmpty?previousAddedAddOnPrice:addOnPrices!)
          ) *
              toGoMenuDetail[index].menu![subIndex].newAddedQuantity!;

          cart.addOnPriceQuantity = addOnItemPrices;
          cart.addOnOfferQuantity = addOfferPrices;
        }

        /// updated cart on already added itemId in cart
        toGoCart[toGoCart.indexWhere((element) =>
        element.ItemId ==
            toGoMenuDetail[index].menu![subIndex].itemId)] = cart;

        /// In cart if particular itemQuantity is zero , to remove itemId from cart
        if (cart.ItemQuantity == 0) {
          print("zero");
          toGoCart.removeWhere((element) => element.ItemQuantity == 0);

          /// if quantity of particular item is 1 and on one deduction item will be removed from cart and subTotalPrice will be updated
          cart.isOfferItem == true
              ? toGoSubTotalPriceAfterRemoving(cart.addOnOfferPrice)
              : toGoSubTotalPriceAfterRemoving(cart.addOnPrice);
          print('toGoSubTotalPrice--->$toGoSubTotalPrice');
        }
      }

      /// after adding items in cart and updating cart at same itemId we will overall calculate subTotalPrice
      var cartItem = toGoCart.where((element) =>
      element.ItemId ==
          toGoMenuDetail[index].menu![subIndex].itemId);
      if (cartItem.isNotEmpty) {
        Cart cartParticularItem = toGoCart.firstWhere((element) =>
        element.ItemId ==
            toGoMenuDetail[index].menu![subIndex].itemId);
        cartParticularItem.isOfferItem == true
            ? toGoSubTotalPriceAfterRemoving(cartParticularItem.addOnOfferPrice)
            : toGoSubTotalPriceAfterRemoving(cartParticularItem.addOnPrice);
        print('toGoSubTotalPrice--->$toGoSubTotalPrice');
      }

      print('encodeCart${jsonEncode(toGoCart)}');
    }
    previousAddedAddOnPrice=0.0;
    update();
  }


  /// remove cartItem at particular index
  void removeItemAtIndex(value, index) {
    ///find the object at particular itemId
    Cart cartParticularItem =
    toGoCart.firstWhere((element) => element.ItemId == value);

    cartParticularItem.isOfferItem == true
        ? toGoSubTotalPriceAfterRemoving(cartParticularItem.addOnOfferQuantity)
        : toGoSubTotalPriceAfterRemoving(cartParticularItem.addOnPriceQuantity);
    print('toGoSubTotalPrice--->$toGoSubTotalPrice');

    /// matched the menuCategoryId with the CartCategoryId
    Iterable data = toGoMenuDetail.where(
          (element) => element.categoryId == cartParticularItem.categoryId,
    );

    if (data.isNotEmpty) {
      ToGoMenuDetails dataMenu = data.first;

      /// from dataMenu object if itemId matches with itemId of remove itemId , then at particularItemId quantity is zero
      Menu menu =
      dataMenu.menu!.firstWhere((element) => element.itemId == value);
      print("menuName${menu.itemName}");

      menu.quantity = menu.quantity!-menu.newAddedQuantity!;
      menu.newAddedQuantity = 0;


      /// now update Restaurant menu list
      toGoMenuDetail[toGoMenuDetail.indexWhere((element) =>
      element.categoryId == cartParticularItem.categoryId)] ==
          menu;
    }
    toGoCart.removeAt(index);
    update();
    print('encodeCart${jsonEncode(toGoCart)}');
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
    // addOnIngredients.remove(AddOns(
    //     ingredientName: value.name!,
    //     addOnPrice: value.amount!,
    //     ItemAddOnId: value.addOnId));
    AddOns data = AddOns(
        ingredientName: value.name!,
        addOnPrice: value.amount!,
        ItemAddOnId: value.addOnId);
    addOnIngredients.remove(data);
    if (addOnIngredients.contains(data)) {
      addOnPrices = addOnPrices! - value.amount!;
    }
    print('removeItemId ---> ${value.addOnId}');
    selectedIngredient.removeWhere((element) => element.addOnId==value.addOnId);
   // selectedIngredient.remove(value);
    // addOnPrices = addOnPrices! - value.amount!;
    print('removeIngredientItem${jsonDecode(jsonEncode(addOnIngredients))}');
    update();
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

    /// to go order menu api call
  Future<dynamic> toGoMenuApiCall({
    dynamic body,
  }) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        toGoMenuEndPoint,
        token: userSessionController.token,
      );
      if (response['response'] == 1) {
        if (response['data'] != null) {
          toGoMenuDetail =List<ToGoMenuDetails>.from(response['data'].map((x)=>ToGoMenuDetails.fromJson(x))) ;
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