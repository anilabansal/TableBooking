import 'dart:convert';

import 'package:get/get.dart';

import '../common/common_strings.dart';

///This method is for post request

class ApiCalls extends GetConnect {
//   Post API
  Future<dynamic> callPostApi(Map<String, dynamic> body, String endPoint,
      {bool isToken = false,
      String token = '',
      // bool isFullUrl = false,
      // String baseUrl,
      isPayment = false,
      bool isString = false}) async {
    Map<String, String> withToken;

    withToken = {
      "Content-Type": "application/json",
      "AuthToken": token,
    };
    print(
        'API Request Header ------------------------------->\n ${jsonEncode(withToken)}');
    String url = '$baseURL/$endPoint';
    print('URL Request ------------------------------->\n $url');
    try {
      var response = await post(
        url,
        body,
        headers: withToken,
      );
      print(
          'API response ------------------------------->\n ${response.statusCode}');

      print('API response ------------------------------->\n ${response.body}');

      print(
          'API final body ------------------------------->\n ${response.body.toString()}');

      print(
          'API request Header ------------------------------->\n ${response.headers}');
      print('Run Successfully!!!!!');
      return response;
    } catch (e) {
      print("========> Responses ${e.toString()}");
    }
    return;
  }

  Future<dynamic> callGetApi(String endPoint, {String token = ''}) async {
    try {
      print('token ------------------>\n $token');
      var response = await get(
        '$baseURL/$endPoint',
        headers: {
          "Content-Type": "application/json",
          "Authorization": token,
        },
      );
      print('url ------------------>\n $baseURL/$endPoint');
      String finalResponse = response.body;
      print(
          'endPoint API request header ------------------>\n ${jsonDecode(finalResponse)}');
      print('endPoint API response ------------------>\n $finalResponse');
      return jsonDecode(finalResponse);
    } catch (e) {
      print('$e');
    }
  }
}
