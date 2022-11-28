import 'dart:convert';
import 'dart:io';

import 'package:booking_table/utils/common/toast_message.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../common/common_strings.dart';

class ApiCalls extends GetConnect {
  // var imageFile = File('').obs;
  // var imageUrl = ''.obs;
  //
  // updateImageFile(File value) {
  //   imageFile.value = value;
  // }

  /// This method is for get request to the server.

  Future<dynamic> callPostApi(Map<String, dynamic>? body, String endPoint,
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
      return response.body;
    } catch (e) {
      print("========> Responses Error ${e.toString()}");
    }
    return;
  }

  /**
   * This method is for get request with multipart to the server.
   * Using HTTP
   **/

  // Future<dynamic> callMultipartWithFileAPI(
  //     Map<String, String> body,
  //     String endPoint,
  //     File imageFile, {
  //       bool isToken = false,
  //       String token = '',
  //       bool isFullUrl = false,
  //     }) async {
  //   print('Request Body ------------------>\n ${body.toString()}');
  //   print('Request Image ------------------>\n ${imageFile.toString()}');
  //   print('url ------------------>\n $baseURL/$endPoint');
  //   var headers = {
  //     // "Content-Type":
  //     //     "multipart/form-data; boundary=<calculated when request is sent>",
  //     // 'accept': 'text/plain',
  //     "Content-Type": "multipart/form-data",
  //     'Authorization': "Bearer $token"
  //   };
  //
  //   print('Header ------------------>\n ${headers.toString()}');
  //   var request =
  //   http.MultipartRequest('POST', Uri.parse('$baseURL/$endPoint'));
  //   request.fields.addAll(body);
  //   request.files
  //       .add(await http.MultipartFile.fromPath('Profile Pic', imageFile.path));
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //   print(
  //       'API response ------------------------------->\n ${response.statusCode}');
  //
  //   print(
  //       'API request Header ------------------------------->\n ${response.headers}');
  //   print('Run Successfully!!!!!');
  //   print(response.reasonPhrase);
  //   try {
  //     if (response.statusCode == 200) {
  //       String data = await response.stream.bytesToString();
  //       print('Api Response data --> ${data.toString()}');
  //       return jsonDecode(data);
  //     } else {
  //       ShowToast.show(
  //         msg: response.reasonPhrase.toString(),
  //         isError: true,
  //       );
  //       print('<===== Error <====> ${response.reasonPhrase} ====>');
  //       return false;
  //     }
  //   } catch (e) {
  //     print("====> Error MultiPart${e.toString()}");
  //   }
  // }
  Future<dynamic> callMultipartFileAPI(
      Map<String, String> body,
      String endPoint,
      File imageFile, {
        /*bool isToken = false,*/
        String token = '',
        /*bool isFullUrl = false,*/
      }) async {
    print('url ------------------>\n $baseURL/$endPoint');
    ///Create the map to send in the API call header
    var headers = {
      "Content-Type": "multipart/form-data",
      'accept': 'text/plain',
      'Authorization': "Bearer $token"
    };
    print('Header ------------------>\n ${headers.toString()}');
    ///Create the multipart request
    var request = http.MultipartRequest('POST', Uri.parse('$baseURL/$endPoint'));
    ///Add the file in the request

    request.files.add(await http.MultipartFile.fromPath('ProfilePic', imageFile.path));
    ///Add the header in the request
    ///
    request.fields.addAll(body);
    // request.fields.addAll({
    //   'FirstName': 'xyz',
    //   'LastName': 'abcd',
    //   'Email': '',
    //   'MobileNo': '+919917940471',
    //   'Address': '',
    //   'DeviceToken': '',
    //   'DeviceType': 'Android',
    //   'DateofBirth': '2020-11-02 00:00:00.000',
    //   'City': '',
    //   'State': '',
    //   'ZipCode': 'dwcc',
    //   'AuthenticationId': '',
    //   'AuthenticationType': ''
    // });
    request.headers.addAll(headers);
    ///Send the multipart request to the server
    http.StreamedResponse response = await request.send();
    print(response.reasonPhrase);
    if (response.statusCode == 200) {
      String data = await response.stream.bytesToString();
      print('Api Response data --> ${data.toString()}');
      ///Return the API response
      return jsonDecode(data);
    } else {
      print(response.reasonPhrase);
    }
  }

// /// This method is for get request
//
// Future<dynamic> callGetApi(String endPoint, {String token = ''}) async {
//   try {
//     print('token ------------------>\n $token');
//     var response = await get(
//       '$baseURL/$endPoint',
//       headers: {
//         "Content-Type": "application/json",
//         "Authorization": token,
//       },
//     );
//     print('url ------------------>\n $baseURL/$endPoint');
//     String finalResponse = response.body;
//     print(
//         'endPoint API request header ------------------>\n ${jsonDecode(finalResponse)}');
//     print('endPoint API response ------------------>\n $finalResponse');
//     return jsonDecode(finalResponse);
//   } catch (e) {
//     print('$e');
//   }
// }
}