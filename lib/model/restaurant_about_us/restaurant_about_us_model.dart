import 'dart:convert';

import 'restaurant_about_us_details_model.dart';

class RestaurantAboutUs {
  int? response;
  String? errorMessage;
  List<RestaurantAboutUsDetails>? data;
  dynamic token;

  RestaurantAboutUs({
    this.response,
    this.errorMessage,
    this.data,
    this.token,
  });

  @override
  String toString() {
    return 'RestaurantAboutUs(response: $response, errorMessage: $errorMessage, data: $data, token: $token)';
  }

  factory RestaurantAboutUs.fromMap(Map<String, dynamic> data) {
    return RestaurantAboutUs(
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
  /// Parses the string and returns the resulting Json object as [RestaurantAboutUs].
  factory RestaurantAboutUs.fromJson(String data) {
    return RestaurantAboutUs.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RestaurantAboutUs] to a JSON string.
  String toJson() => json.encode(toMap());

  RestaurantAboutUs copyWith({
    int? response,
    String? errorMessage,
    List<RestaurantAboutUsDetails>? data,
    dynamic token,
  }) {
    return RestaurantAboutUs(
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      token: token ?? this.token,
    );
  }
}
