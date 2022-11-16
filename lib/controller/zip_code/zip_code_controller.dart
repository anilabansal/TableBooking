import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/network/api_calls.dart';
import 'package:get/get.dart';

class GetZipCodeController extends GetxController {
  var longitude = '76.69060936300099'.obs;
  var latitude = '30.713649330499276'.obs;
  ApiCalls apiCall = ApiCalls();

  /// Get Restaurant Details using Latitude and Longitude.
  Future<dynamic> getRestaurantDetailsUsingLatLon({
    dynamic body,
    required String endPoint,
  }) async {
    try {
      final response = await apiCall.callPostApi(body!, endPoint);
      if (response['response'] == 1) {
        // Get.toNamed('/home', arguments: []);
        return print('Repsonse List=====> ${response['restaurantList']}');
        // return true;
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
