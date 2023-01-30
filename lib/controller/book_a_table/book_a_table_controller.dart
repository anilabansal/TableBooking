import 'package:get/get.dart';
import '../../model/book_table_modals/edit_booking.dart';
import '../../model/book_table_modals/party_size_list_modal.dart';
import '../../model/book_table_modals/sevice_summary_modal.dart';
import '../../model/filter_select_time.dart';
import '../../utils/common/common_strings.dart';
import '../../utils/common/toast_message.dart';
import '../../utils/network/api_calls.dart';
import '../user_session/user_session_controller.dart';

class BookATableController extends GetxController {
  ApiCalls apiCall = ApiCalls();
  UserSessionController userSessionController = Get.find();
  // final listOfServices = [
  //   'Full',
  //   'Mid',
  //   'No',
  //   'ToGo',
  // ];
  var selectTypeOfService = 0.obs;
  var serviceType = ''.obs;
  var selectTimeList = <FilterSelectTime>[].obs;
  var isTimeLoading = true.obs;
  var bookTableIsLoading = true.obs;
  var editTableIsLoading = true.obs;
  var updateTableBookIsLoading = true.obs;
  var addTip = "".obs;
  var selectPaymentMode = "".obs;
  var confirmBookIsLoading = true.obs;
   var bookTablePartySizeIsLoading = true.obs;
  dynamic tipAmount;
  ServiceSummary?serviceSummary;
  BookingResponse?editBookingResponse;
  var bookTablePartySize = <PartySize>[].obs;
  PartySize?selectedBookTablePartySize;
  void setBookTableSelectedPartySize(value){
    selectedBookTablePartySize = value;
    update();
  }

  /// update Order is added or not
   updateOrderIsAdded(){
     if(serviceSummary!.isOrderAdded==false){
       serviceSummary!.isOrderAdded = true;
     }
     update();
   }

  /// set selected book time
  FilterSelectTime? selectedBookTableTime;
  void setSelectedBookTime(value) {
    selectedBookTableTime = value;
    update();
  }

  /// book table select time api call
  Future<bool> getAvailableBookingTime({body}) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        bookTableAvailableTime,
        token: userSessionController.token,
      );
      if (response["response"] == 1) {
        if (response["data"] != null) {
          selectTimeList.value = List<FilterSelectTime>.from(
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

  /// book table api call
  Future<bool> bookTableApiCall({body}) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        bookTableEndPoint,
        token: userSessionController.token,
      );
      if (response["response"] == 1) {
       if(response["data"]!= null){
         serviceSummary = ServiceSummary.fromJson(response["data"]);
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

  /// edit book table api call
  Future<bool> editBookTableApiCall({body}) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        editBookTableEndPoint,
        token: userSessionController.token,
      );
      if (response["response"] == 1) {
        if(response["bookingresponse"]!= null){
          editBookingResponse = BookingResponse.fromJson(response["bookingresponse"]);
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
/// update book table api call
  Future<bool> updateBookTableApiCall({body}) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        updateBookingEndPoint,
        token: userSessionController.token,
      );
      if (response["response"] == 1) {
        if(response["data"]!= null){
          serviceSummary = ServiceSummary.fromJson(response["data"]);
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
/// confirm booking
  Future<bool> confirmBookingApiCall({Map<String,dynamic>? body}) async {
    try {
      final response = await apiCall.callPostApi(
        body,
        confirmBookingEndPoint,
        token: userSessionController.token,
      );
      if (response["response"] == 1) {
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
  Future<bool> getBookTablePartySize() async {
    try {
      final response = await apiCall.callPostApi(
        {},
        partySizeEndPoint,
        token: userSessionController.token,
      );
      if (response["response"] == 1) {
        if (response["data"] != null) {
          bookTablePartySize.value = List<PartySize>.from(
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
