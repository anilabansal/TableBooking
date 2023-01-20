import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/network/api_calls.dart';
import 'package:get/get.dart';
import '../../model/book_table_modals/party_size_list_modal.dart';
import '../../model/filter_restaurant_list.dart';
import '../../model/filter_select_time.dart';
import '../../model/types_food_list.dart';
import '../../utils/common/common_strings.dart';

class FilterViewController extends GetxController {
  DateTime initialTime = DateTime.now();

  // var chooseStartTime;
  // var chooseEndTime;
  //var dateController = TextEditingController();
  // var chooseStartTime = TextEditingController();
  // var chooseEndTime = TextEditingController();
  // var chooseTime = TextEditingController();

  // var typesOfFoodController = TextEditingController();
  var isLoading = true.obs;
  var isTypeFoodLoading = true.obs;
  var isSelectedTimeLoading = true.obs;
  var filterMapIsLoading = true.obs;
  var partySizeIsLoading = true.obs;
  ApiCalls apiCall = ApiCalls();
  UserSessionController userSessionController = Get.find();
  var filterRestaurantList = <FilterRestaurant>[].obs;
  var filterRestaurantCount = 0.obs;
  var dateSelected = ''.obs;
/// partySize
  var partySize = <PartySize>[].obs;
  PartySize?selectedPartySize;
  void setSelectedPartySize(value){
    selectedPartySize = value;
    update();
  }

  /// TypesOfFood
  var typesOfFoodFilterData = <TypesOfFood>[].obs;
  TypesOfFood? selectedFoodType;

  void setSelected(value) {
    selectedFoodType = value;
    update();
  }

  /// filter select time
  var selectTime = <FilterSelectTime>[].obs;
  FilterSelectTime? selectedFilterTime;

  void setSelectedFilterTime(value) {
    selectedFilterTime = value;
    update();
  }

  /// update filter restaurant like status
  void updateFilterRestaurantLikes(index) {
    if (filterRestaurantList[index].isFavourite == true) {
      filterRestaurantList[index].isFavourite = false;
    } else if (filterRestaurantList[index].isFavourite == false) {
      filterRestaurantList[index].isFavourite = true;
    }
    update();
  }

  /// Search Results
  Future<bool> filterSearchResults({dynamic body}) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        filterRestaurantEndPoint,
        token: userSessionController.token,
      );
      if (response["response"] == 1) {
        if (response["data"] != null) {
          filterRestaurantList.value = List<FilterRestaurant>.from(
              response["data"].map((e) => FilterRestaurant.fromJson(e)));
        }
        filterRestaurantCount.value = response['count'];
        // isLoading.value = false;
        // update();
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
    //isLoading.value = false;

    return false;
  }

  /// types of food api call
  Future<bool> typesOfFood() async {
    try {
      final response = await apiCall.callPostApi(
        {},
        typesFoodEndPoint,
        token: userSessionController.token,
      );
      if (response["response"] == 1) {
        if (response["data"] != null) {
          typesOfFoodFilterData.value = List<TypesOfFood>.from(
              response["data"].map((x) => TypesOfFood.fromJson(x)));
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
    //  isLoading.value = false;
    return false;
  }

  /// filter select time api call
  Future<bool> getAvailableTime({body}) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        filterSelectTime,
        token: userSessionController.token,
      );
      if (response["response"] == 1) {
        if (response["data"] != null) {
          selectTime.value = List<FilterSelectTime>.from(
              response["data"].map((x) => FilterSelectTime.fromJson(x)));
          update();
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
    //  isLoading.value = false;
    return false;
  }

  ///party size api call
  Future<bool> getPartySize() async {
    try {
      final response = await apiCall.callPostApi(
        {},
        partySizeEndPoint,
        token: userSessionController.token,
      );
      if (response["response"] == 1) {
        if (response["data"] != null) {
          partySize.value = List<PartySize>.from(
            response["data"].map(
              (x) => PartySize.fromJson(x),
            ),
          );
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
    //  isLoading.value = false;
    return false;
  }
}
