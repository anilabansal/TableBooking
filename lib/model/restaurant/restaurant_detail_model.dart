import 'dart:convert';

import 'restaurant_list_model.dart';

class RestaurantDetailModel {
  int? totalCount;
  List<RestaurantList>? restaurantlist;
  int? response;
  String? errorMessage;
  dynamic data;
  dynamic token;

  RestaurantDetailModel({
    this.totalCount,
    this.restaurantlist,
    this.response,
    this.errorMessage,
    this.data,
    this.token,
  });

  @override
  String toString() {
    return 'RestaurantDetailModel(totalCount: $totalCount, restaurantlist: $restaurantlist, response: $response, errorMessage: $errorMessage, data: $data, token: $token)';
  }

  factory RestaurantDetailModel.fromMap(Map<String, dynamic> data) {
    return RestaurantDetailModel(
      totalCount: data['totalCount'] as int?,
      restaurantlist: (data['restaurantlist'] as List<dynamic>?)
          ?.map((e) => RestaurantList.fromMap(e as Map<String, dynamic>))
          .toList(),
      response: data['response'] as int?,
      errorMessage: data['errorMessage'] as String?,
      data: data['data'] as dynamic,
      token: data['token'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'totalCount': totalCount,
        'restaurantlist': restaurantlist?.map((e) => e.toMap()).toList(),
        'response': response,
        'errorMessage': errorMessage,
        'data': data,
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RestaurantDetailModel].
  factory RestaurantDetailModel.fromJson(String data) {
    return RestaurantDetailModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RestaurantDetailModel] to a JSON string.
  String toJson() => json.encode(toMap());

  RestaurantDetailModel copyWith({
    int? totalCount,
    List<RestaurantList>? restaurantlist,
    int? response,
    String? errorMessage,
    dynamic data,
    dynamic token,
  }) {
    return RestaurantDetailModel(
      totalCount: totalCount ?? this.totalCount,
      restaurantlist: restaurantlist ?? this.restaurantlist,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
      token: token ?? this.token,
    );
  }
}
