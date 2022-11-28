import 'dart:convert';

import 'restaurant_menu_data.dart';

class RestaurantMenu {
  int? response;
  String? errorMessage;
  List<RestaurantMenuData>? data;
  dynamic token;

  RestaurantMenu({this.response, this.errorMessage, this.data, this.token});

  @override
  String toString() {
    return 'RestaurantMenu(response: $response, errorMessage: $errorMessage, data: $data, token: $token)';
  }

  factory RestaurantMenu.fromMap(Map<String, dynamic> data) {
    return RestaurantMenu(
      response: data['response'] as int?,
      errorMessage: data['errorMessage'] as String?,
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => RestaurantMenuData.fromMap(e as Map<String, dynamic>))
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
  /// Parses the string and returns the resulting Json object as [RestaurantMenu].
  factory RestaurantMenu.fromJson(String data) {
    return RestaurantMenu.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RestaurantMenu] to a JSON string.
  String toJson() => json.encode(toMap());

  RestaurantMenu copyWith({
    int? response,
    String? errorMessage,
    List<RestaurantMenuData>? data,
    dynamic token,
  }) {
    return RestaurantMenu(
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      token: token ?? this.token,
    );
  }
}
