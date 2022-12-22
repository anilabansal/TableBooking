import 'dart:convert';

import 'restaurant_about_us_details_model.dart';

class RestaurantAboutUsModel {
  int? response;
  String? errorMessage;
  List<RestaurantAboutUsDetails>? data;
  dynamic token;

  RestaurantAboutUsModel({
    this.response,
    this.errorMessage,
    this.data,
    this.token,
  });

  factory RestaurantAboutUsModel.fromMap(Map<String, dynamic> data) {
    return RestaurantAboutUsModel(
      response: data['response'] as int?,
      errorMessage: data['errorMessage'] as String?,
      data: (data['data'] as List<dynamic>?)
          ?.map((e) =>
          RestaurantAboutUsDetails.fromMap(e as Map<String, dynamic>))
          .toList(),
      token: data['token'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
    'response': response,
    'errorMessage': errorMessage,
    'data': data?.map((e) => e.toMap()).toList(),
    'token': token,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RestaurantAboutUsModel].
  factory RestaurantAboutUsModel.fromJson(String data) {
    return RestaurantAboutUsModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RestaurantAboutUsModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
