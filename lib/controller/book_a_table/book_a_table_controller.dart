import 'package:get/get.dart';
import '../../model/book_table_modals/sevice_summary_modal.dart';
import '../../model/filter_select_time.dart';
import '../../utils/common/common_strings.dart';
import '../../utils/common/toast_message.dart';
import '../../utils/network/api_calls.dart';
import '../user_session/user_session_controller.dart';

class BookATableController extends GetxController {
  ApiCalls apiCall = ApiCalls();
  UserSessionController userSessionController = Get.find();
  final listOfServices = [
    'Full',
    'Mid',
    'No',
    'ToGo',
  ];
  var selectTypeOfService = 0.obs;
  var serviceType = ''.obs;
  var selectTime = <FilterSelectTime>[].obs;
  var isTimeLoading = true.obs;
  var bookTableIsLoading = true.obs;
  ServiceSummary?serviceSummary;


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
          selectTime.value = List<FilterSelectTime>.from(
              response["data"].map((x) => FilterSelectTime.fromJson(x)));
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

// var selectedDate = DateTime.now().obs;
// var bookingDate = TextEditingController();
// var selectedTime = TimeOfDay.now().obs;
// var bookingTime = TextEditingController();
// var partySize = TextEditingController();
//Select Type Of Service
// void selectService(index) {
//   selectTypeOfService.value = index;
//   if (kDebugMode) {
//     print(selectTypeOfService.value);
//   }
// }

// Select Date
// selectDate() async {
//   final DateTime? pickedDate = await showDatePicker(
//     context: Get.context!,
//     initialDate: selectedDate.value,
//     firstDate: DateTime(2020),
//     lastDate: DateTime(3000),
//   );
//   if (pickedDate != null && pickedDate != selectedDate.value) {
//     selectedDate.value = pickedDate;
//     bookingDate.text =
//         DateFormat('dd-MM-y').format(selectedDate.value).toString();
//   } else if (bookingDate.text.isEmpty) {
//     bookingDate.text =
//         DateFormat('dd-MM-y').format(DateTime.now()).toString();
//   }
// } // Select Date

// selectTime() async {
//   final TimeOfDay? pickedTime = await showTimePicker(
//     context: Get.context!,
//     initialTime: selectedTime.value,
//     cancelText: 'Close',
//     confirmText: 'Confirm',
//     errorInvalidText: 'Provide valid time',
//     hourLabelText: 'Select Hour',
//     minuteLabelText: 'Select Minute',
//   );
//   if (pickedTime != null && pickedTime != selectedTime.value) {
//     selectedTime.value = pickedTime;
//     bookingTime.text = selectedTime.value.toString();
//     if (kDebugMode) {
//       print(bookingTime.text.toString());
//     }
//   }
//   // else if (bookingDate.text.isEmpty) {
//   //   bookingDate.text =
//   //       DateFormat('dd-MM-y').format(DateTime.now()).toString();
//   // }
// }

}
