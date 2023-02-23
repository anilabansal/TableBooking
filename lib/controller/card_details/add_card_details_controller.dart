import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:booking_table/utils/common/common_strings.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/network/api_calls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../model/saved_card_details/saved_card_details.dart';
import '../../model/saved_card_details/user_cardlist.dart';

class AddCardDetailsController extends GetxController {


  var selectedCardDate = DateTime.now().obs;

  var isLoading = true.obs;
  var isChecked = false.obs;
  var isUserCardListIsLoading = true.obs;

  void updateCheckbox() {
    isChecked.value = !isChecked.value;
  }

  //
  // var savedCardList = [].obs;
  ApiCalls apiCall = ApiCalls();
  UserSessionController userSessionController = Get.find();
  var userAllCardList = CardList().obs;

  UserCardlist ? cardSelected;

  ///set Selected Card for payment
  void setSelectedCard(UserCardlist value){
    cardSelected = value;
    update();
  }

  /// Saved Card Detail api
  Future<dynamic> savedCardData({
    dynamic body,
    // endPoint,
  }) async {
    try {
      final response = await apiCall.callPostApi(
        body,

        addCardDetailString,
        token: userSessionController.token,
      );
      if (response['response'] == 1) {
        ShowToast.show(
          msg: 'Card Added SuccessFully!!'
          // msg: response['errorMessage'],
        );
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

  /// card list
  Future<dynamic> savedCardListDataApi() async {
    try {
      final response = await apiCall.callPostApi(
        {},
        // endPoint ?? savedCardDetailString,
        savedCardListString,
        token: userSessionController.token,
      );


      if (response['response'] == 1) {
        userAllCardList.value = CardList.fromJson(response);
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
    isLoading.value = false;

    return false;
  }


  /// remove of card
  Future<dynamic> removeCardAPi({
     body,
    // endPoint,
  }) async {
    try {
      final response = await apiCall.callPostApi(
        body,

        removeCardFromListString,
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
    isLoading.value = false;

    return false;
  }
}
