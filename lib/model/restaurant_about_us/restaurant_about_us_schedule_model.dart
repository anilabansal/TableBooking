import 'dart:convert';

class RestaurantAboutUsSchedule {
  num? restaurantOpHrsId;
  num? restaurantId;
  String? openingDay;
  DateTime? createdOn;
  String? openingHour;
  String? closingHour;
  dynamic restaurant;

  RestaurantAboutUsSchedule({
    this.restaurantOpHrsId,
    this.restaurantId,
    this.openingDay,
    this.createdOn,
    this.openingHour,
    this.closingHour,
    this.restaurant,
  });

  factory RestaurantAboutUsSchedule.fromMap(Map<String, dynamic> data) =>
      RestaurantAboutUsSchedule(
        restaurantOpHrsId: data['restaurantOpHrsId'] as num?,
        restaurantId: data['restaurantId'] as num?,
        openingDay: data['openingDay'] as String?,
        createdOn: data['createdOn'] == null
            ? null
            : DateTime.parse(data['createdOn'] as String),
        openingHour: data['openingHour'] as String?,
        closingHour: data['closingHour'] as String?,
        restaurant: data['restaurant'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
    'restaurantOpHrsId': restaurantOpHrsId,
    'restaurantId': restaurantId,
    'openingDay': openingDay,
    'createdOn': createdOn?.toIso8601String(),
    'openingHour': openingHour,
    'closingHour': closingHour,
    'restaurant': restaurant,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RestaurantAboutUsSchedule].
  factory RestaurantAboutUsSchedule.fromJson(String data) {
    return RestaurantAboutUsSchedule.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RestaurantAboutUsSchedule] to a JSON string.
  String toJson() => json.encode(toMap());
}
