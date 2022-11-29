import 'dart:convert';

class RestaurantImage {
  int? restaurantImageId;
  String? restaurantImage;

  RestaurantImage({this.restaurantImageId, this.restaurantImage});

  @override
  String toString() {
    return 'RestaurantImage(restaurantImageId: $restaurantImageId, restaurantImage: $restaurantImage)';
  }

  factory RestaurantImage.fromMap(Map<String, dynamic> data) {
    return RestaurantImage(
      restaurantImageId: data['restaurantImageId'] as int?,
      restaurantImage: data['restaurantImage'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'restaurantImageId': restaurantImageId,
        'restaurantImage': restaurantImage,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RestaurantImage].
  factory RestaurantImage.fromJson(String data) {
    return RestaurantImage.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RestaurantImage] to a JSON string.
  String toJson() => json.encode(toMap());

  RestaurantImage copyWith({
    int? restaurantImageId,
    String? restaurantImage,
  }) {
    return RestaurantImage(
      restaurantImageId: restaurantImageId ?? this.restaurantImageId,
      restaurantImage: restaurantImage ?? this.restaurantImage,
    );
  }
}
