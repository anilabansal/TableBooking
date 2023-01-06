import 'dart:convert';
import 'dart:io';
import 'package:booking_table/controller/user_session/user_session_controller.dart';
import 'package:booking_table/utils/common/toast_message.dart';
import 'package:booking_table/utils/common/widgets_methods/common_button.dart';
import 'package:booking_table/utils/common/widgets_methods/common_text.dart';
import 'package:flutter/material.dart';
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
  UserSessionController userSessionController = Get.find();

  /// This method is for get request to the server.

  Future<dynamic> callPostApi(
    Map<String, dynamic>? body,
    String endPoint, {
    bool isToken = false,
    String? token,
    // bool isFullUrl = false,
    // String baseUrl,
    isPayment = false,
    bool isString = false,
  }) async {
    Map<String, String> withToken;

    withToken = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
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
      if (response.statusCode == 200) {
        print(
            'API response ------------------------------->\n ${response.statusCode}');

        // print(
        //     'API response ------------------------------->\n ${response.body}');

        print(
            'API final body ------------------------------->\n ${response.body.toString()}');

        print(
            'API request Header ------------------------------->\n ${response.headers}');
        print('Run Successfully!!!!!');
        return response.body;
      }
      else if(response.statusCode==401){
        Get.offAllNamed('/authentication');
      }
      // else if (userSessionController.isLogin == true &&
      //     response.statusText == "Unauthorized") {
      //   // ShowToast.show(
      //   //   msg: "${response.statusText}\nPlease Login Again!!!",
      //   //   isError: true,
      //   // );
      //
      //   Get.defaultDialog(
      //     title: "Token Expired!",
      //     titleStyle:
      //         const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      //     content: Column(
      //       children: [
      //         Image.asset(
      //           'assets/images/error.png',
      //           height: 80,
      //         ),
      //         const SizedBox(
      //           height: 15,
      //         ),
      //         CommonText(
      //           fontSize: 16,
      //           text:
      //               "Your token has expired!\nPlease login again to continue..",
      //           textAlign: TextAlign.center,
      //         ),
      //       ],
      //     ),
      //     radius: 0010,
      //     actions: [
      //       Padding(
      //         padding:
      //             const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5.0),
      //         child: Row(
      //           children: [
      //             Expanded(
      //               child: SizedBox(
      //                 height: 40,
      //                 child: CommonButton(
      //                   bgColor: redE2211C,
      //                   text: 'Login',
      //                   textColor: Colors.white,
      //                   onTap: () async {
      //                     await userSessionController.logOut();
      //                     await Get.toNamed('/login');
      //                   },
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(
      //               width: 15,
      //             ),
      //             Expanded(
      //               child: SizedBox(
      //                 height: 40,
      //                 child: CommonButton(
      //                   bgColor: redE2211C,
      //                   text: 'Cancel',
      //                   onTap: () {
      //                     Get.back();
      //                   },
      //                   textColor: Colors.white,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   );
      //
      //   // return false;
      // } else {
      //   print('<===== Error <====> ${response.statusText} ====>');
      // }
    } catch (e) {
      print("========> Responses Error ${e.toString()}");
    }
    return;
  }

  /// This method is for get request with multipart to the server.
  Future<dynamic> callMultipartWithFileAPI(
    Map<String, String> body,
    String endPoint,
    File imageFile, {
    bool isToken = false,
    String token = '',
    bool isFullUrl = false,
  }) async {
    print('Request Body ------------------>\n ${body.toString()}');
    // print('Request Image ------------------>\n ${imageFile.toString()}');
    print('url ------------------>\n $baseURL/$endPoint');
    var headers = {
      // "Content-Type":
      //     "multipart/form-data; boundary=<calculated when request is sent>",
      // 'accept': 'text/plain',
      'Authorization': "Bearer $token"
    };

    print('Header ------------------>\n ${headers.toString()}');
    var request =
        http.MultipartRequest('POST', Uri.parse('$baseURL/$endPoint'));
    request.fields.addAll(body);
    if (imageFile.path != '') {
      request.files
          .add(await http.MultipartFile.fromPath('ProfilePic', imageFile.path));
    }

    request.headers.addAll(headers);

    var response = await request.send();
    print('Request Body ------------------>\n ${body.toString()}');
    print("profile pic ----->${imageFile.path}");
    print(
        'API response ------------------------------->\n ${response.statusCode}');

    print(
        'API request Header ------------------------------->\n ${response.headers}');
    print('Run Successfully!!!!!');
    print(response.reasonPhrase);
    try {
      if (response.statusCode == 200) {
        String data = await response.stream.bytesToString();
        print('Api Response data --> ${data.toString()}');
        return jsonDecode(data);
      } else {
        ShowToast.show(
          msg: response.reasonPhrase.toString(),
          isError: true,
        );
        print('<===== Error <====> ${response.reasonPhrase} ====>');
        return false;
      }
    } catch (e) {
      print("====> Error MultiPart${e.toString()}");
    }
  }
}
