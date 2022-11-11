import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

import '../common/common_strings.dart';

class ApiCalls extends GetConnect {
  // var imageFile = File('').obs;
  // var imageUrl = ''.obs;
  //
  // updateImageFile(File value) {
  //   imageFile.value = value;
  // }

  /// This method is for get request to the server.

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
    print('API Request ------------------------------->\n ${(body)}');
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
      print("========> Responses Error ${e.toString()}");
    }
    return;
  }

  /**
   * This method is for get request with multipart to the server.
   **/

  Future<dynamic> callPostApiWithFile(
      Map<String, dynamic>? body, String endPoint,
      {bool isToken = false,
      String token = '',
      // bool isFullUrl = false,
      // String baseUrl,
      String? filename,
      File? imageFile,
      isPayment = false,
      bool isString = false}) async {
    Map<String, String> withToken;

    withToken = {
      "Content-Type": "multipart/form-data",
      'accept': 'text/plain',
      // "Authorization": token,
    };
    print(
        'API Request Header ------------------------------->\n ${jsonEncode(withToken)}');
    String url = '$baseURL/$endPoint';
    print('URL Request ------------------------------->\n $url');
    try {
      // MultipartFile request = MultipartFile(imageFile, filename: filename!);
      FormData form = FormData({
        "body": body,
        "file": MultipartFile(imageFile, filename: filename!),
        // if (imageFile != null && imageFile.path != '') "file": request,
      });
      var response = await post(
        url,
        form,
        headers: withToken,
      );
      String finalResponse = response.body;

      print(
          'API response ------------------------------->\n ${response.statusCode}');

      print('API response ------------------------------->\n ${response.body}');

      print(
          'API final body ------------------------------->\n ${response.body.toString()}');

      print(
          'API request Header ------------------------------->\n ${response.headers}');
      print('Run Successfully!!!!!');
      return jsonDecode(finalResponse);
      // if (response.statusCode == 200) {
      //   return jsonDecode(finalResponse);
      // }
    } catch (e) {
      print("========> Responses Error ${e.toString()}");
    }
    return;
  }

  /**
   * This method is for get request
   **/

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
