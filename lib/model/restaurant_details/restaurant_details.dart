import 'dart:convert';

import 'data.dart';

class RestaurantDetails {
  int? response;
  String? errorMessage;
  RestaurantDetailsData? data;
  dynamic token;

  RestaurantDetails({
    this.response,
    this.errorMessage,
    this.data,
    this.token,
  });

  @override
  String toString() {
    return 'RestaurantDetails(response: $response, errorMessage: $errorMessage, data: $data, token: $token)';
  }

  factory RestaurantDetails.fromMap(Map<String, dynamic> data) {
    return RestaurantDetails(
      response: data['response'] as int?,
      errorMessage: data['errorMessage'] as String?,
      data: data['data'] == null
          ? null
          : RestaurantDetailsData.fromMap(data['data'] as Map<String, dynamic>),
      token: data['token'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'response': response,
        'errorMessage': errorMessage,
        'data': data?.toMap(),
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RestaurantDetails].
  factory RestaurantDetails.fromJson(String data) {
    return RestaurantDetails.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RestaurantDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  RestaurantDetails copyWith({
    int? response,
    String? errorMessage,
    RestaurantDetailsData? data,
    dynamic token,
  }) {
    return RestaurantDetails(
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      token: token ?? this.token,
    );
  }
}
